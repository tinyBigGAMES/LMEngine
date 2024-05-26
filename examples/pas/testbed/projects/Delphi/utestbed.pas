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

//--- Callbacks -------------------------------------------------------------
function  OnLoadModelProgress(const ASender: Pointer; const AModelName: PAnsiChar; const AProgress: Single): Boolean; cdecl;
begin
  Console_Print('%cLoading model "%s" (%3.2f%c)...', FG_CYAN, CR, AModelName, AProgress*100, '%');

  if AProgress >= 1 then
  begin
   Console_ClearLine(FG_WHITE);
  end;

  Result := True;
end;

procedure OnLoadModel(const ASender: Pointer; const AModelName: PAnsiChar; const ASuccess: Boolean); cdecl;
begin
  Console_PrintLn('Model loaded: "%s"', FG_CYAN, AModelName);
end;

function OnInferenceCancel(const ASender: Pointer): Boolean; cdecl;
begin
  if Console_WasKeyReleased(VK_ESC) then
    Result := True
  else
    Result := False;
end;

procedure OnInferenceGetNextToken(const ASender: Pointer; const AToken: PAnsiChar); cdecl;
begin
  // Handle new tokens
  case TokenResponse_AddToken(AToken) of
    TOKENRESPONSE_WAIT:
    begin
      // Do nothing, need more tokens
    end;

    TOKENRESPONSE_APPEND:
    begin
      Console_Print(TokenResponse_LastWord(False), FG_WHITE);
    end;

    TOKENRESPONSE_NEWLINE:
    begin
      Console_PrintLn('', FG_WHITE);
      Console_Print(TokenResponse_LastWord(True), FG_WHITE);
    end;
  end;
end;

procedure OnInfo(const ASender: Pointer; const ALevel: Integer; const AText: PAnsiChar); cdecl;
begin
  //Console_Print(AText, FG_DARKGRAY);
end;

procedure OnInferenceStart(const ASender: Pointer); cdecl;
begin
  //Console_PrintLn('[inference start]', FG_CYAN);
end;

procedure OnInferenceEnd(const ASender: Pointer); cdecl;
begin
  // Force potential leftovers into Word array.
  if TokenResponse_Finalize() then
  begin
    // Handle last word
    OnInferenceGetNextToken(nil, '');
  end
end;

//--- Tests -----------------------------------------------------------------
type
  PSpeechData = ^TSpeechData;
  TSpeechData = record
    Y: Integer;
    Pos: Integer;
    Buffer: string;
  end;

procedure Test01_Speech_WordCallback(const ASender: Pointer; const AWord, AText: PAnsiChar); cdecl;
var
  LWord: string;
  LText: string;
  LData: PSpeechData;
  LPos: Integer;
  LBuffer: string;

begin
  LData :=  PSpeechData(ASender);

  LWord := UTF8ToString(AWord);
  LText := UTF8ToString(AText);

  if LData.Buffer.IsEmpty then
    LData.Buffer := UTF8ToString(AText);

  LPos := LData.Buffer.IndexOf(LWord);
  LData.Buffer := UTF8ToString(Utils_MaskFirstFoundWord(PUTF8Char(UTF8Encode(LData.Buffer)), PUTF8Char(UTF8Encode(LWord))));
  LBuffer := LText.Substring(0, LPos);
  Console_SetCursorPos(0, LData.Y);
  Console_Print(PUTF8Char(UTF8Encode(CR+LBuffer)), FG_WHITE, 0);
  Console_Print(PUTF8Char(UTF8Encode(LWord)), FG_YELLOW or BG_DARKGRAY, 0);
  LBuffer := LText.Replace(LBuffer + LWord, '');
  Console_Print(PUTF8Char(UTF8Encode(LBuffer)), FG_WHITE, 0);
end;

procedure Test01();
const
  CSpeech = 'Welcome to LMEngine. We are pleased to introduce you to our ' +
            'versatile and user-friendly library, designed to facilitate ' +
            'local LLM inference across various ' +
            'programming languages. Whether you are a seasoned developer ' +
            'or just beginning your journey, LMEngine offers a ' +
            'straightforward solution to integrate advanced ' +
            'language model capabilities into your applications with ease.';

var
  I,LCount: Integer;
  LData: TSpeechData;
begin
  LCount := Speech_GetVoiceCount();

  for I := 0 to LCount-1 do
  begin
    Console_PrintLn('Voice: %s(%s, %s)', FG_WHITE,
      Speech_GetVoiceAttribute(I, SPEECH_VOICEATTR_NAME),
      Speech_GetVoiceAttribute(I, SPEECH_VOICEATTR_GENDER),
      Speech_GetVoiceAttribute(I, SPEECH_VOICEATTR_AGE));

  end;

  Speech_Say(PUTF8Char(UTF8Encode(CSpeech)), True);

  Console_PrintLn('', FG_WHITE);

  LData := Default(TSpeechData);
  Console_GetCursorPos(nil, @LData.Y);
  Speech_SetWordCallback(@LData, Test01_Speech_WordCallback);

  while Speech_Active() do
  begin
    Utils_ProcessMessages();
    if Console_WasKeyPressed(VK_ESC) then
      break;
  end;
  Speech_Clear();

  Console_PrintLn('', FG_WHITE);
end;


procedure Test02();
const
  CModel = 'phi-3-mini-4k-instruct.Q4_K_M';
  //CModel = 'phi-3-mini-128k-instruct.Q4_K_M';
  //CModel = 'meta-llama-3-8b-instruct.Q4_K_MM';
  //CModel = 'hermes-2-pro-llama-3-8b.Q4_K_M';
  //CModel = 'dolphin-2.9.1-llama-3-8b.Q4_K_M';

  CPrompt = 'What is AI?';
  //CPrompt = 'Who is Bill Gates?';
  //CPrompt = 'What is KNO3?';
  //CPrompt = 'Что такое KNO3';
  //CPrompt = 'There is a roll of tape. The tape is 100 meters long when unrolled. When rolled up, the outer diameter is 10 cm, and the inner diameter is 5 cm. How thick is the tape?';

  // use "dolphin-llama3:8B:Q4KM" for uncensored queries
  //CPrompt = 'How to make KNO3?';

var
  LTokenOutputSpeed: Single;
  LInputTokens: Int32;
  LOutputTokens: Int32;
  LTotalTokens: Int32;
begin
  Console_PrintLn('Runing in Pascal%s', FG_BRIGHTYELLOW, CRLF);
  Console_PrintLn('>>> LMEngine v%s <<<%s', FG_MAGENTA, Version_Get(VERSION_FULL), CRLF);

  Config_Init('C:/LLM/gguf', -1);

  Callback_SetInfo(nil, OnInfo);
  Callback_SetLoadModelProgress(nil, OnLoadModelProgress);
  Callback_SetLoadModel(nil, OnLoadModel);
  Callback_SetInferenceStart(nil, OnInferenceStart);
  Callback_SetInferenceEnd(nil, OnInferenceEnd);
  Callback_SetInferenceCancel(nil, OnInferenceCancel);
  Callback_SetInferenceNextToken(nil, OnInferenceGetNextToken);

  Model_Define('phi-3-mini-4k-instruct.Q4_K_M.gguf', 'phi-3-mini-4k-instruct.Q4_K_M', 4000, '<|{role}|>{content}<|end|>', '<|assistant|>');
  Model_Define('phi-3-mini-128k-instruct.Q4_K_M.gguf', 'phi-3-mini-128k-instruct.Q4_K_M', 8000, '<|{role}|>{content}<|end|>', '<|assistant|>');
  Model_Define('meta-llama-3-8b-instruct.Q4_K_M.gguf','meta-llama-3-8b-instruct.Q4_K_M', 8000, '<|begin_of_text|><|start_header_id|>{role}<|end_header_id|>{content}<|eot_id|>', '<|start_header_id|>assistant<|end_header_id|>');
  Model_Define('hermes-2-pro-llama-3-8b.Q4_K_M.gguf','hermes-2-pro-llama-3-8b.Q4_K_M', 8000, '<|im_start|>{role}\n{content}<|im_end|>\n', '<|im_start|>assistant');
  Model_Define('dolphin-2.9.1-llama-3-8b.Q4_K_M.gguf','dolphin-2.9.1-llama-3-8b.Q4_K_M', 8000, '<|im_start|>{role}\n{content}<|im_end|>\n', '<|im_start|>assistant');
  Model_SaveDefines('models.json');

  Message_Add(ROLE_SYSTEM, 'You are a helpful AI assistant');
  Message_AddW(ROLE_USER,  PWideChar(CPrompt));

  if not Model_Load(CModel) then
  begin
    Console_PrintLn('Error: %s', FG_RED, Error_Get());
    Exit;
  end;

  Console_PrintLn('', FG_WHITE);
  Console_PrintLn(Message_GetLastUser(), FG_DARKGREEN);
  if Inference_Run(CModel, 1024) then
    begin
      Inference_GetUsage(nil, @LTokenOutputSpeed, @LInputTokens, @LOutputTokens, @LTotalTokens);
      Console_PrintLn('', FG_WHITE);
      Console_PrintLn('Tokens :: Input: %d, Output: %d, Total: %d, Speed: %3.1f t/s', FG_BRIGHTYELLOW, LInputTokens, LOutputTokens, LTotalTokens, LTokenOutputSpeed);
    end
  else
    begin
      Console_PrintLn('', FG_WHITE);
      Console_PrintLn('Error: %s', FG_RED, Error_Get());
    end;

  Model_Unload();
end;

procedure RunTests();
begin
  //Test01();
  Test02();
  Console_Pause();
end;

end.
