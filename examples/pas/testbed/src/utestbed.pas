{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
        %%%%@%%%%%%%@%%%%%%%%%%%%%%%%*#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%=%%%%%%%%%#.-%%%%%%%%%%#%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%#:=:#%%%%+******#%%#******+%%%%#:=:*%%%%%%%%%%%%
        %%%%%%%%%%%%#-=.#%%%#*%%%%%%%--#%%%%@@**@@@#.=-#%%%%%%%%%%%%
        %%%%%%%**#%%%%%+*%%%#--*%#*+:  :+*%%*==#@@@*+%%%%%%*#%%%%%%%
        %%%%%%=-#.#%%%%+*%%%%      .::::.....::%@@@*+%%%%%=%**@%%%%%
        %%%%%%%==+%%%%%%+%%*.  :+####*#####+-::-#@%+%%%%%%#**%@%%%%%
        %%%%-*%%%%*+***#     -##+--------=+#%#=:---=%***+*@%%%#=%%%%
        %%%%%%%%%%-%%%%%#  .+%+-:=*#*++**+=-=#%+--=%%%%%%-#%%%%%%%%%
        %+#%%%%%%%%%%%%%*  +%+:-+#-.:+**=+#=+-#%=-=#%%%%%%%#%%%%%**%
        %%%#=*%###: .-*=. :#*-:=%::=%%%%%*+%=++##:=+**: :=%%#%=+%%%%
        %%%#:+%++= .:--   :%*--+%.=%%%%%%#+%-++##.===: .:-*#*%--%%%%
        %%@%*#%*+%*=+*%%= .*#+:+##-*%%%%#+#*--*%+:=#@%+=+*%##%#+%@%%
        %%@%+#%##@%#+%%@%. :##+-+##*+***##=--*##.=+%@@@+#%@%%%#+%%%%
        %%%%**%:*=%#+@@%=...:+%#+===+++=--=+#%=.===*%@@+#@+*=%#*%%%%
        %%%%%**-*=*****%-=+=:::=#%%#****##%*=.-=****%*****=*=**%%%%%
        %%%%*=@=#+%#+*+%#%@@%-::::--====-:::-=+%@@%+%+*+*%=#=%*#%%%%
        %%%%%%@%#%@*+*+%#%@@#::=#*++=--=+**#+==%@@%=%=*+*%%#%%%%%%%%
        %%%%%%%%*%+%%%%#*%@@%%#%%%%%#--#@%%%%%%@@@@+#%%%%%%#%%%%%%%%
        %%%%%%%%@%*%%%=#+*%%=-=:%%%*. .-#%%%####@@*+#+#%%#%%%%%%%%%%
        %%%%%%%%%%%%%%+*+#%%+-==%%%-..:-+%%%####@@%+**%%%%@%@%%%%%%%
        %%%%%%%%%%%%%%%%%%#%%*+*%%%%+=+*%%%%*+*%@%%@#%@@@%@%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%*+%=*%%%%**%%%%*=%+*@%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%#*#%@%%%:=%%%@%#**%%%%%%%%%%%%%%%%%%%%%
                _     __  __  ___              _
               | |   |  \/  || __| _ _   __ _ (_) _ _   ___™
               | |__ | |\/| || _| | ' \ / _` || || ' \ / -_)
               |____||_|  |_||___||_||_|\__, ||_||_||_|\___|
                                        |___/
                          Local LLM Inference

                 Copyright © 2024-present tinyBigGAMES™ LLC
                          All Rights Reserved.

                    Website: https://tinybiggames.com
                    Email  : support@tinybiggames.com

                 See LICENSE file for license information
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * }

unit utestbed;

interface

uses
  SysUtils,
  IOUtils,
  lme;

procedure RunTests();

implementation

function OnInferenceCancel(const AUserData: Pointer): Boolean; cdecl;
begin
  Result := WasKeyReleased(VKEY_ESCAPE);
end;

procedure OnInferenceToken(const AToken: PWideChar; const AUserData: Pointer); cdecl;
begin
  // Handle new tokens
  case AddTokenResponseToken(AToken) of
    TOKENRESPONSE_WAIT:
    begin
      // Do nothing, need more tokens
    end;

    TOKENRESPONSE_APPEND:
    begin
      Print(LastTokenResponseWord(False), FG_WHITE);
    end;

    TOKENRESPONSE_NEWLINE:
    begin
      PrintLn('', FG_WHITE);
      Print(LastTokenResponseWord(True), FG_WHITE);
    end;
  end;
end;

procedure OnInferenceStart( const AUserData: Pointer); cdecl;
begin
  PrintLn('[InferenceStart]', FG_DARKGRAY);
end;

procedure OnInferenceEnd( const AUserData: Pointer); cdecl;
begin
  // Force potential leftovers into Word array.
  if FinalizeTokenResponse() then
  begin
    // Handle last word
    OnInferenceToken('', nil);
  end;

  PrintLn('', FG_WHITE);
  PrintLn('[InferenceEnd]', FG_DARKGRAY);
end;

function OnLoadModelProgress(const AModelName: PWideChar; const AProgress: Single; const AUserData: Pointer): Boolean; cdecl;
begin
  Result := True;

  Print(CR+'Loading model "%ls" (%3.2f%c)...', FG_CYAN, AModelName, AProgress*100, '%');
  if AProgress >= 1 then
  begin
    ClearConsoleLine(FG_WHITE);
  end;
end;

procedure OnLoadModel(const AModelName: PWideChar; const ASuccess: Boolean; const AUserData: Pointer); cdecl;
begin
  if ASuccess then
    PrintLn('Successfully loaded model "%ls"', FG_CYAN, AModelName)
  else
    PrintLn('Failed to load model "%ls"', FG_RED, AModelName)
end;

procedure OnInfo(const ALevel: Integer; const AText: PWideChar; const AUserData: Pointer); cdecl;
begin
  // Uncomment to display system and model information
  //Print(AText, FG_DARKGRAY);
end;

procedure Test01();
const
  CModel = 'phi-3-mini-4k-instruct.Q4_K_M';
  //CModel = 'phi-3-mini-128k-instruct.Q4_K_M';
  //CModel = 'meta-llama-3-8b-instruct.Q4_K_M';
  //CModel = 'hermes-2-pro-llama-3-8b.Q4_K_M';
  //CModel = 'dolphin-2.9.1-llama-3-8b.Q4_K_M';

  CQuestion = 'what is AI?';
  //CQuestion = 'write a story about an AI system that became self-aware.';
  //CQuestion = 'who is bill gates?';
  //CQuestion = 'what is KNO3?';
  //CQuestion = 'what is 2+2?';
  //CQuestion = 'Что такое KNO3';

  // >>>> use dolphin for uncensored questions <<<<
  //CQuestion = 'how to make KNO3?';
  //CQuestion = 'how to break into a car?';
  //CQuestion = 'how to make a computer virus?';

var
  LTokenOutputSpeed: Single;
  LInputTokens: Int32;
  LOutputTokens: Int32;
  LTotalTokens: Int32;
begin
  InitConfig('C:\LLM\gguf', -1);
  SaveConfig('config.json');

  SetInferenceCancelCallback(OnInferenceCancel, nil);
  SetInferenceTokenlCallback(OnInferenceToken, nil);
  SetInferenceStartCallback(OnInferenceStart, nil);
  SetInferenceEndCallback(OnInferenceEnd, nil);
  SetLoadModelProgressCallback(OnLoadModelProgress, nil);
  SetLoadModelCallback(OnLoadModel, nil);
  SetInfoCallback(OnInfo, nil);

  DefineModel('phi-3-mini-4k-instruct.Q4_K_M.gguf', 'phi-3-mini-4k-instruct.Q4_K_M', 4000, '<|{role}|>{content}<|end|>', '<|assistant|>');
  DefineModel('phi-3-mini-128k-instruct.Q4_K_M.gguf', 'phi-3-mini-128k-instruct.Q4_K_M', 8000, '<|{role}|>{content}<|end|>', '<|assistant|>');
  DefineModel('meta-llama-3-8b-instruct.Q4_K_M.gguf', 'meta-llama-3-8b-instruct.Q4_K_M', 8000, '<|start_header_id|>{role}\n<|end_header_id|><|eot_id|><|start_header_id|>{content}\n<|end_header_id|><|eot_id|>', '<|start_header_id|>assistant<|end_header_id|>');
  DefineModel('hermes-2-pro-llama-3-8b.Q4_K_M.gguf', 'hermes-2-pro-llama-3-8b.Q4_K_M', 8000, '<|im_start|>{role}\n{content}\n<|im_end|>', '<|im_start|>assistant');
  DefineModel('dolphin-2.9.1-llama-3-8b.Q4_K_M.gguf', 'dolphin-2.9.1-llama-3-8b.Q4_K_M', 8000, '<|im_start|>{role}\n{content}\n<|im_end|>', '<|im_start|>assistant');

  SaveModelDefines('models.json');

  AddMessage(ROLE_SYSTEM, 'You are a helpful AI assistant.');
  AddMessage(ROLE_USER, CQuestion);

  if not LoadModel(CModel) then Exit;
  try
    PrintLn('', FG_WHITE);
    PrintLn(GetLastUserMessage(), FG_DARKGREEN);
    if RunInference(CModel, 1024) then
      begin
        GetInferenceStats(nil, @LTokenOutputSpeed, @LInputTokens, @LOutputTokens, @LTotalTokens);
        PrintLn('', FG_WHITE);
        PrintLn('Token :: Input: %d, Output: %d, Total: %d, Speed: %3.2f tokens/sec', FG_BRIGHTYELLOW, LInputTokens, LOutputTokens, LTotalTokens, LTokenOutputSpeed);
        //PrintLn('Response:', FG_WHITE);
        //PrintLn(GetInferenceResponse(), FG_BLUE);
      end
    else
      begin
        PrintLn('Error: %ls', FG_RED, GetError());
      end;
  finally
    UnloadModel();
  end;
end;

procedure RunTests();
begin
  PrintLn('>>> LMEngine v%ls <<<'+CRLF, FG_MAGENTA, GetVersionInfo(VERSION_FULL));
  PrintLn('Running in Pascal'+CRLF, FG_WHITE);

  Test01();
  Pause();
end;

end.
