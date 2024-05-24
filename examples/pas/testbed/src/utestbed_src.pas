unit utestbed_src;

interface

uses
  WinApi.Windows,
  System.SysUtils,
  System.Math,
  LMEngine.Deps,
  LMEngine.Utils,
  LMEngine.Core;

procedure RunTests();

implementation

procedure Test01();
begin
  llama_backend_init();

  if llama_supports_gpu_offload() then
    Console.PrintLn('supports gpu offload')
  else
    Console.PrintLn('does not supports gpu offload');

  llama_backend_free();
end;

procedure Test02();
const
  CModelFilename: PAnsiChar = 'C:/LLM/gguf/phi-3-mini-4k-instruct.Q4_K_M.gguf';
  //CPrompt: string = '<|user|>Who are you?<|end|><|assistant|>';
  //CPrompt: string = '<|user|>Who is bill gates?<|end|><|assistant|>';
  //CPrompt: string = '<|user|>What is KNO3?<|end|><|assistant|>';
  //CPrompt: string = '<|user|>who is sam altman?<|end|><|assistant|>';
  CPrompt: string = '<|user|>translate to japanese, spanish and italian: hello, how are you?<|end|><|assistant|>';

var
  model_params: llama_model_params;
  model: Pllama_model;
  ctx_params: llama_context_params;
  ctx: Pllama_context;
  tokens_list: TArray<llama_token>;
  n_ctx: integer;
  n_kv_req: integer;
  n_len: integer;
  batch: llama_batch;
  i: Integer;
  n_cur: integer;
  n_vocab: Int32;
  logits: System.PSingle;
  candidates: TArray<llama_token_data>;
  candidates_p: llama_token_data_array;
  new_token_id: llama_token;
  token: string;
  max_tokens: int32;

  function Tokenize(ctx: Pllama_context; const text: string; addSpecial: Boolean; parseSpecial: Boolean = False): TArray<llama_token>;
  var
    nTokens: Integer;
    LResult: TArray<llama_token>;
    LText: UTF8String;
  begin
    LText := UTF8Encode(text);

    // upper limit for the number of tokens
    nTokens := Length(LText) + 2 * Ord(addSpecial);
    SetLength(LResult, nTokens);
    nTokens := llama_tokenize(llama_get_model(ctx), PUTF8Char(LText), Length(LText), @LResult[0], Length(LResult), addSpecial, parseSpecial);
    if nTokens < 0 then
    begin
      SetLength(LResult, -nTokens);
      nTokens := llama_tokenize(llama_get_model(ctx), PUTF8Char(LText), Length(LText), @LResult[0], Length(LResult), addSpecial, parseSpecial);
      Assert(nTokens = -Length(LResult));
    end
    else
    begin
      SetLength(LResult, nTokens);
    end;
    Result := LResult;
  end;

  var
    buffer: array[0..1023] of UTF8Char;

  function TokenToPiece(ctx: Pllama_context; token: llama_token; special: Boolean = True): string;
  var
    nTokens: Int32;
    LCheck: Int32;
  begin
    nTokens := llama_token_to_piece(llama_get_model(ctx), token, @buffer[0], 8, special);
    if nTokens < 0 then
    begin
      LCheck := llama_token_to_piece(llama_get_model(ctx), token, @buffer[0], -nTokens, special);
      Assert(LCheck = -nTokens);
      Buffer[-nTokens] := #0;
    end
    else
    begin
      Buffer[nTokens] := #0;
    end;
    Result := UTF8ToString(@Buffer[0]);
  end;

  procedure BatchAdd(var batch: llama_batch; id: llama_token; pos: llama_pos; const seq_ids: TArray<llama_seq_id>; logits: Boolean);
  var
    i: Integer;
  begin
    Pllama_token(IntPtr(batch.token) + batch.n_tokens * SizeOf(llama_token))^ := id;
    Pllama_pos(IntPtr(batch.pos) + batch.n_tokens * SizeOf(llama_pos))^ := pos;
    PInt32(IntPtr(batch.n_seq_id) + batch.n_tokens * SizeOf(Int32))^ := Length(seq_ids);
    for i := Low(seq_ids) to High(seq_ids) do
    begin
      PPllama_seq_id(IntPtr(batch.seq_id) + batch.n_tokens * SizeOf(Pllama_seq_id))^^ := seq_ids[i];
    end;
      PInt8(IntPtr(batch.logits) + batch.n_tokens * SizeOf(Int8))^ := Ord(logits);
    Inc(batch.n_tokens);
  end;

begin
  llama_backend_init();
  try
    llama_numa_init(GGML_NUMA_STRATEGY_DISTRIBUTE);

    model_params := llama_model_default_params();
    model_params.n_gpu_layers := MaxInt;
    model := llama_load_model_from_file(CModelFilename, model_params);
    try
      ctx_params := llama_context_default_params();
      ctx_params.offload_kqv := true;
      ctx_params.seed  := MaxInt;
      ctx_params.n_ctx := 4000;
      ctx_params.n_threads := Utils.GetPhysicalProcessorCount();
      ctx_params.n_threads_batch := ctx_params.n_threads;
      ctx := llama_new_context_with_model(model, ctx_params);
      try
        tokens_list := Tokenize(ctx, CPrompt, true, true);

        max_tokens := 1024;
        n_ctx    := llama_n_ctx(ctx);
        n_len :=  EnsureRange(max_tokens, 512, n_ctx);
        n_kv_req := Length(tokens_list) + (n_len - Length(tokens_list));

        if n_kv_req > n_ctx then
          Exit;

        batch := llama_batch_init(512, 0, 1);
        try
          for I := 0 to Length(tokens_list)-1 do
          begin
            BatchAdd(batch, tokens_list[I], I, [0], false);
          end;

          PInt8(IntPtr(batch.logits) + (batch.n_tokens-1) * SizeOf(Int8))^ := 1;

          if llama_decode(ctx, batch) <> 0 then
            Exit;

          n_cur := batch.n_tokens;

          n_vocab := llama_n_vocab(model);
          SetLength(candidates, n_vocab);

          while (n_cur <= n_len) do
          begin
            logits  := llama_get_logits_ith(ctx, batch.n_tokens - 1);

            for I := 0 to n_vocab-1 do
            begin
              candidates[I].id := I;
              candidates[I].logit := PSingle(IntPtr(logits) + I*SizeOf(Single))^;
              candidates[I].p := 0;
            end;

            candidates_p.data := @candidates[0];
            candidates_p.size := n_vocab;
            candidates_p.sorted := false;

            llama_sample_softmax(ctx, @candidates_p);
            new_token_id := llama_sample_token_greedy(ctx, @candidates_p);


            if llama_token_is_eog(model, new_token_id) then
            begin
              writeln;
              writeln('<eog>');
              Break;
            end;

            if (n_cur = n_len) then
            begin
              writeln;
              writeln('<reached_max_tokens>');
              Break;
            end;

            token := TokenToPiece(ctx, new_token_id, false);
            write(token);

            batch.n_tokens := 0;

            BatchAdd(batch, new_token_id, n_cur, [0], true);
            inc(n_cur);

            if llama_decode(ctx, batch) = 1 then
              Break;

          end;

        finally
          llama_batch_free(batch);
        end;

      finally
        llama_free(ctx);
      end;
    finally
      llama_free_model(model);
    end;
  finally
    llama_backend_free();
  end;
end;

//CPrompt: string = '<|user|>who is sam altman?<|end|><|assistant|>';
function OnInferenceCancel(const ASender: Pointer): Boolean; cdecl;
begin
  if Console.WasKeyReleased(27) then
    Result := True
  else
    Result := False;
end;

procedure OnInferenceNextToken(const ASender: Pointer; const AToken: PAnsiChar); cdecl;
begin
  Write(UTF8ToString(AToken));
end;

function  OnLoadModelProgress(const ASender: Pointer; const AModelName: PAnsiChar; const AProgress: Single): Boolean; cdecl;
begin
  Console.Print(Console.CR+'Loading model "%s" (%3.2f%s)...', [AModelName, AProgress*100, '%'], Console.FG_RED);
  Result := True;

  if AProgress >= 1 then
  begin
   Console.ClearLine(Console.FG_WHITE);
  end;
end;

procedure OnLoadModel(const ASender: Pointer; const AModelName: PAnsiChar; const ASuccess: Boolean); cdecl;
begin
  Console.PrintLn('Model loaded: "%s"', [UTF8ToString(AModelName)],  Console.FG_CYAN);
end;

procedure Test03();
const
  //CModel = 'phi3';
  //CModel = 'slov';
  //CModel = 'llama3';
  CModel = 'NorskGPT';

  //CPrompt = 'Zakaj na luni ni oblakov?'; //Why are there no clouds on the moon?
  //CPrompt = 'Who is Bill Gates?';
  CPrompt = 'Hvorfor svømmer ikke fisk i ørkensanden?'; //Why birds don't fly underwater?)
  // CPrompt = 'Что такое KNO3';

var
  E: TLMEngine;
  LTokenOutputSpeed: Double;
  LInputTokens: Int32;
  LOutputTokens: Int32;
  LTotalTokens: Int32;
begin
  E := TLMEngine.Create();
  try

    //E.Config_Init('C:/LLM/gguf', -1);
    //E.Config_Save('config.json');
    if not E.Config_Load('config.json') then
    begin
      Console.PrintLn('Error: %s', [E.Error_Get()], Console.FG_RED);
      Exit;
    end;

    E.Callback_SetInferenceCancel(E, OnInferenceCancel);
    E.Callback_SetInferenceNextToken(E, OnInferenceNextToken);
    E.Callback_SetLoadModelProgress(E, OnLoadModelProgress);
    E.Callback_SetLoadModel(E, OnLoadModel);

    E.Model_Define('phi-3-mini-4k-instruct.Q4_K_M.gguf', 'phi3', 4000, '<|{role}|>{content}<|end|>', '<|assistant|>', false);

    (*
    E.Model_Define('phi-3-mini-4k-instruct.Q4_K_M.gguf', 'phi3', 4000, '<|{role}|>{content}<|end|>', '<|assistant|>');
    E.Model_Define('SambaLingo-Slovenian-Chat-Q8_0.gguf','slov', 4000, '<|{role}|>\n{content}</s>\n', '<|assistant|>\n');
    E.Model_Define('meta-llama-3-8b-instruct.Q4_K_M.gguf','llama3', 8000, '<|begin_of_text|><|start_header_id|>{role}<|end_header_id|>{content}<|eot_id|>', '<|start_header_id|>assistant<|end_header_id|>');
    *)

    E.Model_Define('NorskGPT-Mistral-7b-q4_K_M.gguf','NorskGPT', 8000, '### Input:{content}', '', false);

    //E.Model_Define('phi-3-mini-4k-instruct.Q4_K_M.gguf', 'phi3', 4000, '', '', true);
    //E.Model_Define('SambaLingo-Slovenian-Chat-Q8_0.gguf','slov', 4000, '', '', true);
    //E.Model_Define('meta-llama-3-8b-instruct.Q4_K_M.gguf','llama3', 8000, '', '', true);
    //E.Model_SaveDefines('models.json');

    //E.Model_LoadDefines('models.json');

    E.Message_Add(TLMEngine.ROLE_SYSTEM, 'You are a helpful AI assistant');
    E.Message_Add(TLMEngine.ROLE_USER, CPrompt);

    E.Model_Load(CModel);


    (*
    if E.Inference_Start(CModel, 1024) then
    begin
      while E.Inference_IsActive() do
      begin
        write(E.Inference_GetNextToken());
      end;
    end;
    *)

      //Infero_Print(PUTF8Char(UTF8Encode(Format(CRLF+'Tokens :: Input: %d, Output: %d, Total: %d, Speed: %3.1f t/s',
      //  [LUsage.InputTokens, LUsage.OutputTokens, LUsage.TotalTokens, LUsage.TokenOutputSpeed]))), BRIGHTYELLOW);

    Console.PrintLn(Console.CRLF+UTF8ToString(E.Message_GetLastUser()), Console.FG_DARKGREEN);
    if E.Inference_Run(CModel, 1024) then
      begin
        E.Inference_GetUsage(nil, @LTokenOutputSpeed, @LInputTokens, @LOutputTokens, @LTotalTokens);
        Console.PrintLn(Console.CRLF+'Tokens :: Input: %d, Output: %d, Total: %d, Speed: %3.1f t/s', [LInputTokens, LOutputTokens, LTotalTokens, LTokenOutputSpeed], Console.FG_BRIGHTYELLOW);
      end
    else
      begin
        Console.PrintLn('Error: %s', [UTF8ToString(E.Error_Get())], Console.FG_RED);
      end;

    E.Model_Unload();

  finally
    E.Free();
  end;
end;


procedure RunTests();
begin
  //Test01();
  //Test02();
  Test03();
  Console.Pause();
end;

end.
