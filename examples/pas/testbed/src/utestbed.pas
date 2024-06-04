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
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

unit utestbed;

interface

uses
  SysUtils,
  IOUtils,
  LMEngine;

procedure RunTests();

implementation

function OnInferenceCancel(const AUserData: Pointer): Boolean; cdecl;
begin
  Result := LME_WasKeyReleased(LME_VKEY_ESCAPE);
end;

procedure OnInferenceToken(const AToken: PWideChar; const AUserData: Pointer); cdecl;
begin
  // Handle new tokens
  case LME_AddTokenResponseToken(AToken) of
    LME_TOKENRESPONSE_WAIT:
    begin
      // Do nothing, need more tokens
    end;

    LME_TOKENRESPONSE_APPEND:
    begin
      LME_Print(LME_LastTokenResponseWord(False), LME_FG_WHITE);
    end;

    LME_TOKENRESPONSE_NEWLINE:
    begin
      LME_PrintLn('', LME_FG_WHITE);
      LME_Print(LME_LastTokenResponseWord(True), LME_FG_WHITE);
    end;
  end;
end;

procedure OnInferenceStart( const AUserData: Pointer); cdecl;
begin
  LME_PrintLn('[InferenceStart]', LME_FG_DARKGRAY);
end;

procedure OnInferenceEnd( const AUserData: Pointer); cdecl;
begin
  // Force potential leftovers into Word array.
  if LME_FinalizeTokenResponse() then
  begin
    // Handle last word
    OnInferenceToken('', nil);
  end;

  LME_PrintLn('', LME_FG_WHITE);
  LME_PrintLn('[InferenceEnd]', LME_FG_DARKGRAY);
end;

function OnLoadModelProgress(const AModelName: PWideChar; const AProgress: Single; const AUserData: Pointer): Boolean; cdecl;
begin
  Result := True;

  LME_Print(LME_CR+'Loading model "%ls" (%3.2f%c)...', LME_FG_CYAN, AModelName, AProgress*100, '%');
  if AProgress >= 1 then
  begin
    LME_ClearConsoleLine(LME_FG_WHITE);
  end;
end;

procedure OnLoadModel(const AModelName: PWideChar; const ASuccess: Boolean; const AUserData: Pointer); cdecl;
begin
  if ASuccess then
    LME_PrintLn('Successfully loaded model "%ls"', LME_FG_CYAN, AModelName)
  else
    LME_PrintLn('Failed to load model "%ls"', LME_FG_RED, AModelName)
end;

procedure OnInfo(const ALevel: Integer; const AText: PWideChar; const AUserData: Pointer); cdecl;
begin
  // Uncomment to display system and model information
  //LME_Print(AText, FG_DARKGRAY);
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
  LME_InitConfig('C:\LLM\gguf', -1);
  LME_SaveConfig('config.json');

  LME_SetInferenceCancelCallback(OnInferenceCancel, nil);
  LME_SetInferenceTokenlCallback(OnInferenceToken, nil);
  LME_SetInferenceStartCallback(OnInferenceStart, nil);
  LME_SetInferenceEndCallback(OnInferenceEnd, nil);
  LME_SetLoadModelProgressCallback(OnLoadModelProgress, nil);
  LME_SetLoadModelCallback(OnLoadModel, nil);
  LME_SetInfoCallback(OnInfo, nil);

  LME_DefineModel('phi-3-mini-4k-instruct.Q4_K_M.gguf', 'phi-3-mini-4k-instruct.Q4_K_M', 4000, '<|{role}|>{content}<|end|>', '<|assistant|>');
  LME_DefineModel('phi-3-mini-128k-instruct.Q4_K_M.gguf', 'phi-3-mini-128k-instruct.Q4_K_M', 8000, '<|{role}|>{content}<|end|>', '<|assistant|>');
  LME_DefineModel('meta-llama-3-8b-instruct.Q4_K_M.gguf', 'meta-llama-3-8b-instruct.Q4_K_M', 8000, '<|start_header_id|>{role}\n<|end_header_id|><|eot_id|><|start_header_id|>{content}\n<|end_header_id|><|eot_id|>', '<|start_header_id|>assistant<|end_header_id|>');
  LME_DefineModel('hermes-2-pro-llama-3-8b.Q4_K_M.gguf', 'hermes-2-pro-llama-3-8b.Q4_K_M', 8000, '<|im_start|>{role}\n{content}\n<|im_end|>', '<|im_start|>assistant');
  LME_DefineModel('dolphin-2.9.1-llama-3-8b.Q4_K_M.gguf', 'dolphin-2.9.1-llama-3-8b.Q4_K_M', 8000, '<|im_start|>{role}\n{content}\n<|im_end|>', '<|im_start|>assistant');

  LME_SaveModelDefines('models.json');

  LME_AddMessage(LME_ROLE_SYSTEM, 'You are a helpful AI assistant.');
  LME_AddMessage(LME_ROLE_USER, CQuestion);

  if not LME_LoadModel(CModel) then Exit;
  try
    LME_PrintLn('', LME_FG_WHITE);
    LME_PrintLn(LME_GetLastUserMessage(), LME_FG_DARKGREEN);
    if LME_RunInference(CModel, 1024) then
      begin
        LME_GetInferenceStats(nil, @LTokenOutputSpeed, @LInputTokens, @LOutputTokens, @LTotalTokens);
        LME_PrintLn('', LME_FG_WHITE);
        LME_PrintLn('Token :: Input: %d, Output: %d, Total: %d, Speed: %3.2f tokens/sec', LME_FG_BRIGHTYELLOW, LInputTokens, LOutputTokens, LTotalTokens, LTokenOutputSpeed);
        //LME_PrintLn('Response:', FG_WHITE);
        //LME_PrintLn(LME_GetInferenceResponse(), FG_BLUE);
      end
    else
      begin
        LME_PrintLn('Error: %ls', LME_FG_RED, LME_GetError());
      end;
  finally
    LME_UnloadModel();
  end;
end;

procedure RunTests();
begin
  LME_PrintLn('>>> LMEngine v%ls <<<'+LME_CRLF, LME_FG_MAGENTA, LME_GetVersion(LME_VERSION_FULL));
  LME_PrintLn('Running in Pascal'+LME_CRLF, LME_FG_WHITE);

  Test01();
  LME_Pause();
end;

end.
