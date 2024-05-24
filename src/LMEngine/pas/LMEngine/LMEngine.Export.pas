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

unit LMEngine.Export;

{$I LMEngine.Defines.inc}

interface

uses
  LMEngine.Utils,
  LMEngine.Core;

//--- UTILS -----------------------------------------------------------------
procedure Utils_ProcessMessages();
function  Utils_MaskFirstFoundWord(const AText, AWord: PAnsiChar): PAnsiChar;

//--- UTF8 ------------------------------------------------------------------
function  UTF8_Encode(const AText: PWideChar): PAnsiChar;
function  UTF8_Decode(const AText: PAnsiChar): PAnsiChar;
procedure UTF8_Free(APtr: PAnsiChar);

//--- CONSOLE ---------------------------------------------------------------
procedure Console_GetCursorPos(X, Y: PInteger);
procedure Console_SetCursorPos(const X, Y: Integer);
procedure Console_Clear();
procedure Console_ClearLine(const AColor: WORD);
procedure Console_ClearKeyStates();
function  Console_IsKeyPressed(AKey: Byte): Boolean;
function  Console_WasKeyReleased(AKey: Byte): Boolean;
function  Console_WasKeyPressed(AKey: Byte): Boolean;
procedure Console_Pause(const AForcePause: Boolean; AColor: WORD; const AText: PAnsiChar);


//--- SPEECH ----------------------------------------------------------------
procedure Speech_SetWordCallback(const ASender: Pointer; const AHandler: Speech.WordEvent);
function  Speech_GetWordCallback(): Speech.WordEvent;
function  Speech_GetVoiceCount(): Integer;
function  Speech_GetVoiceAttribute(const AIndex: Integer; const AAttribute: Speech.VoiceAttributeEvent): PAnsiChar;
procedure Speech_ChangeVoice(const AIndex: Integer);
function  Speech_GetVoice(): Integer;
procedure Speech_SetVolume(const AVolume: Single);
function  Speech_GetVolume(): Single;
procedure Speech_SetRate(const ARate: Single);
function  Speech_GetRate(): Single;
procedure Speech_Clear();
procedure Speech_Say(const AText: PAnsiChar; const APurge: Boolean);
function  Speech_Active(): Boolean;
procedure Speech_Pause();
procedure Speech_Resume();
procedure Speech_Reset();
procedure Speech_SubstituteWord(const AWord, ASubstituteWord: PAnsiChar);


//--- LMEngine --------------------------------------------------------------

// Version
function  Version_Get(const AType: Byte): PAnsiChar;

// Error
procedure Error_Clear();
procedure Error_Set(const AText: PAnsiChar);
function  Error_Get(): PAnsiChar;

// Callback
function  Callback_GetLoadModelProgress(): TLMEngine.LoadModelProgressCallback;
procedure Callback_SetLoadModelProgress(const ASender: Pointer; const AHandler: TLMEngine.LoadModelProgressCallback);

function  Callback_GetLoadModel(): TLMEngine.LoadModelCallback;
procedure Callback_SetLoadModel(const ASender: Pointer; const AHandler: TLMEngine.LoadModelCallback);

function  Callback_GetInferenceCancel(): TLMEngine.InferenceCancelCallback;
procedure Callback_SetInferenceCancel(const ASender: Pointer; const AHandler: TLMEngine.InferenceCancelCallback);

function  Callback_GetInferenceNextToken(): TLMEngine.InferenceGetNextTokenCallback;
procedure Callback_SetInferenceNextToken(const ASender: Pointer; const AHandler: TLMEngine.InferenceGetNextTokenCallback);

function  Callback_GetInferenceStart(): TLMEngine.InferenceStartCallback;
procedure Callback_SetInferenceStart(const ASender: Pointer; const AHandler: TLMEngine.InferenceStartCallback);

function  Callback_GetInferenceEnd(): TLMEngine.InferenceEndCallback;
procedure Callback_SetInferenceEnd(const ASender: Pointer; const AHandler: TLMEngine.InferenceEndCallback);

function  Callback_GetInfo(): TLMEngine.InfoCallback;
procedure Callback_SetInfo(const ASender: Pointer; const AHandler: TLMEngine.InfoCallback);


// Config
procedure Config_Init(const AModelPath: PAnsiChar; const ANumGPULayers: Int32);
function  Config_Save(const AFilename: PAnsiChar): Boolean;
function  Config_Load(const AFilename: PAnsiChar): Boolean;

// Message
procedure Message_ClearAll();
function  Message_Add(const ARole, AContent: PAnsiChar): Int32;
function  Message_AddW(const ARole: PAnsiChar; AContent: PWideChar): Int32;
function  Message_GetLastUser(): PAnsiChar;
function  Message_BuildInferencePrompt(const AModelName: PAnsiChar): PAnsiChar;

// Model
procedure Model_ClearDefines();
function  Model_Define(const AModelFilename, AModelName: PAnsiChar; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: PAnsiChar{; const AAddAssistant: Boolean}): Int32;
function  Model_SaveDefines(const AFilename: PAnsiChar): Boolean;
function  Model_LoadDefines(const AFilename: PAnsiChar): Boolean;
procedure Model_ClearStopSequences(const AModelName: PAnsiChar);
function  Model_AddStopSequence(const AModelName, AToken: PAnsiChar): Int32;
function  Model_GetStopSequenceCount(const AModelName: PAnsiChar): Int32;
function  Model_Load(const AModelName: PAnsiChar): Boolean;
function  Model_IsLoaded(): Boolean;
procedure Model_Unload();

// Inference
function  Inference_Run(const AModelName: PAnsiChar; const AMaxTokens: UInt32): Boolean;
function  Inference_Start(const AModelName: PAnsiChar; const AMaxTokens: UInt32): Boolean;
function  Inference_IsActive(): Boolean;
function  Inference_GetNextToken(): PAnsiChar;
procedure Inference_Stop();
function  Inference_GetResponse(): PAnsiChar;
procedure Inference_GetUsage(ATokenInputSpeed, ATokenOutputSpeed: System.PSingle;  AInputTokens, AOutputTokens, ATotalTokens: PInteger);


// TokenResponse
procedure TokenResponse_SetRightMargin(const AMargin: Integer);
function  TokenResponse_AddToken(const AToken: PAnsiChar): Integer;
function  TokenResponse_LastWord(const ATrimLeft: Boolean): PAnsiChar;
function  TokenResponse_Finalize: Boolean;


implementation

//--- UTILS -----------------------------------------------------------------
procedure Utils_ProcessMessages();
begin
  Utils.ProcessMessages();
end;

function  Utils_MaskFirstFoundWord(const AText, AWord: PAnsiChar): PAnsiChar;
begin
  Result := Utils.AsUTF8(Utils.ReplaceFirstFoundWord(UTF8ToString(AText), UTF8ToString(AWord), '^'));
end;

function UTF8_Encode(const AText: PWideChar): PAnsiChar;
var
  LText: UTF8String;
begin
  LText := UTF8Encode(AText);
  GetMem(Result, Length(LText) + 1);
  Move(LText[1], Result^, Length(LText));
  Result[Length(LText)] := #0;
end;

function UTF8_Decode(const AText: PAnsiChar): PAnsiChar;
var
  LText: UTF8String;
  LWideText: WideString;
begin
  LText := UTF8String(AText); // Convert PAnsiChar to UTF8String
  LWideText := UTF8Decode(LText); // Decode UTF-8 to WideString

  // Allocate memory for the resulting PAnsiChar
  GetMem(Result, Length(LWideText) * SizeOf(Char) + 1);
  // Convert WideString to PAnsiChar
  Move(LWideText[1], Result^, Length(LWideText) * SizeOf(Char));
  Result[Length(LWideText)] := #0; // Null-terminate the string
end;

procedure UTF8_Free(APtr: PAnsiChar);
begin
  if APtr <> nil then
    FreeMem(APtr);  // Free the memory allocated with GetMem
end;

//--- CONSOLE ---------------------------------------------------------------
procedure Console_GetCursorPos(X, Y: PInteger);
begin
  Console.GetCursorPos(X, Y);
end;

procedure Console_SetCursorPos(const X, Y: Integer);
begin
  Console.SetCursorPos(X, Y);
end;

procedure Console_Clear();
begin
  Console.Clear();
end;

procedure Console_ClearLine(const AColor: WORD);
begin
  Console.ClearLine(AColor);
end;

procedure Console_ClearKeyStates();
begin
  Console.ClearKeyStates();
end;

function  Console_IsKeyPressed(AKey: Byte): Boolean;
begin
  Result := Console.IsKeyPressed(AKey);
end;

function  Console_WasKeyReleased(AKey: Byte): Boolean;
begin
  Result := Console.WasKeyReleased(AKey);
end;

function  Console_WasKeyPressed(AKey: Byte): Boolean;
begin
  Result := Console.WasKeyPressed(AKey);
end;

procedure Console_Pause(const AForcePause: Boolean; AColor: WORD; const aText: PAnsiChar);
begin
  Console.Pause(AForcePause, AColor, UTF8ToString(AText));
end;


//--- SPEECH ----------------------------------------------------------------
procedure Speech_SetWordCallback(const ASender: Pointer; const AHandler: Speech.WordEvent);
begin
  Speech.SetOnWordEvent(ASender, AHandler);
end;

function  Speech_GetWordCallback(): Speech.WordEvent;
begin
  Result := Speech.GetOnWordEvent();
end;

function  Speech_GetVoiceCount(): Integer;
begin
  Result := Speech.GetVoiceCount();
end;

function  Speech_GetVoiceAttribute(const AIndex: Integer; const AAttribute: Speech.VoiceAttributeEvent): PAnsiChar;
begin
  Result := Utils.AsUTF8(Speech.GetVoiceAttribute(AIndex, AAttribute));
end;

procedure Speech_ChangeVoice(const AIndex: Integer);
begin
  Speech.ChangeVoice(AIndex);
end;

function  Speech_GetVoice(): Integer;
begin
  Result := Speech.GetVoice();
end;

procedure Speech_SetVolume(const AVolume: Single);
begin
  Speech.SetVolume(AVolume);
end;

function  Speech_GetVolume(): Single;
begin
  Result := Speech.GetVolume();
end;

procedure Speech_SetRate(const ARate: Single);
begin
  Speech.SetRate(ARate);
end;

function  Speech_GetRate(): Single;
begin
  Result := Speech.GetRate();
end;

procedure Speech_Clear();
begin
 Speech.Clear();
end;

procedure Speech_Say(const AText: PAnsiChar; const APurge: Boolean);
begin
  Speech.Say(UTF8ToString(AText), APurge);
end;

function  Speech_Active(): Boolean;
begin
  Result := Speech.Active();
end;

procedure Speech_Pause();
begin
  Speech.Pause();
end;

procedure Speech_Resume();
begin
  Speech.Resume();
end;

procedure Speech_Reset();
begin
  Speech.Reset();
end;

procedure Speech_SubstituteWord(const AWord, ASubstituteWord: PAnsiChar);
begin
  Speech.SubstituteWord(UTF8ToString(AWord), UTF8ToString(ASubstituteWord));
end;

//--- LMEngine --------------------------------------------------------------
var
  LLMEngine: TLMEngine = nil;

// Version
function  Version_Get(const AType: Byte): PAnsiChar;
begin
  Result := PUTF8Char(LLMEngine.Version_Get(AType));
end;

procedure Error_Clear();
begin
  LLMEngine.Error_Clear();
end;

procedure Error_Set(const AText: PAnsiChar);
begin
  LLMEngine.Error_Set(UTF8ToString(AText), []);
end;

function  Error_Get(): PAnsiChar;
begin
  Result := PUTF8Char(LLMEngine.Error_Get());
end;

function  Callback_GetLoadModelProgress(): TLMEngine.LoadModelProgressCallback;
begin
  Result := LLMEngine.Callback_GetLoadModelProgress();
end;

procedure Callback_SetLoadModelProgress(const ASender: Pointer; const AHandler: TLMEngine.LoadModelProgressCallback);
begin
  LLMEngine.Callback_SetLoadModelProgress(ASender, AHandler);
end;

function  Callback_GetLoadModel(): TLMEngine.LoadModelCallback;
begin
  Result := LLMEngine.Callback_GetLoadModel();
end;

procedure Callback_SetLoadModel(const ASender: Pointer; const AHandler: TLMEngine.LoadModelCallback);
begin
  LLMEngine.Callback_SetLoadModel(ASender, AHandler);
end;

function  Callback_GetInferenceCancel(): TLMEngine.InferenceCancelCallback;
begin
  Result := LLMEngine.Callback_GetInferenceCancel();
end;

procedure Callback_SetInferenceCancel(const ASender: Pointer; const AHandler: TLMEngine.InferenceCancelCallback);
begin
  LLMEngine.Callback_SetInferenceCancel(ASender, AHandler);
end;

function  Callback_GetInferenceNextToken(): TLMEngine.InferenceGetNextTokenCallback;
begin
  Result := LLMEngine.Callback_GetInferenceNextToken();
end;

procedure Callback_SetInferenceNextToken(const ASender: Pointer; const AHandler: TLMEngine.InferenceGetNextTokenCallback);
begin
  LLMEngine.Callback_SetInferenceNextToken(ASender, AHandler);
end;

function  Callback_GetInferenceStart(): TLMEngine.InferenceStartCallback;
begin
  Result := LLMEngine.Callback_GetInferenceStart();
end;

procedure Callback_SetInferenceStart(const ASender: Pointer; const AHandler: TLMEngine.InferenceStartCallback);
begin
  LLMEngine.Callback_SetInferenceStart(ASender, AHandler);
end;

function  Callback_GetInferenceEnd(): TLMEngine.InferenceEndCallback;
begin
  Result := LLMEngine.Callback_GetInferenceEnd();
end;

procedure Callback_SetInferenceEnd(const ASender: Pointer; const AHandler: TLMEngine.InferenceEndCallback);
begin
  LLMEngine.Callback_SetInferenceEnd(ASender, AHandler);
end;

function  Callback_GetInfo(): TLMEngine.InfoCallback;
begin
  Result := LLMEngine.Callback_GetInfo();
end;

procedure Callback_SetInfo(const ASender: Pointer; const AHandler: TLMEngine.InfoCallback);
begin
  LLMEngine.Callback_SetInfo(ASender, AHandler);
end;

procedure Config_Init(const AModelPath: PAnsiChar; const ANumGPULayers: Int32);
begin
  LLMEngine.Config_Init(UTF8ToString(AModelPath), ANumGPULayers);
end;

function  Config_Save(const AFilename: PAnsiChar): Boolean;
begin
  Result := LLMEngine.Config_Save(UTF8ToString(AFilename));
end;

function  Config_Load(const AFilename: PAnsiChar): Boolean;
begin
  Result := LLMEngine.Config_Load(UTF8ToString(AFilename));
end;

procedure Message_ClearAll();
begin
  LLMEngine.Message_ClearAll();
end;

function  Message_Add(const ARole, AContent: PAnsiChar): Int32;
begin
  Result := LLMEngine.Message_Add(UTF8ToString(ARole), UTF8ToString(AContent));
end;

function  Message_AddW(const ARole: PAnsiChar; AContent: PWideChar): Int32;
begin
  Result := LLMEngine.Message_Add(UTF8ToString(ARole), string(AContent));
end;

function  Message_GetLastUser(): PAnsiChar;
begin
  Result := PUTF8Char(LLMEngine.Message_GetLastUser());
end;

function  Message_BuildInferencePrompt(const AModelName: PAnsiChar): PAnsiChar;
begin
  Result := PUTF8Char(LLMEngine.Message_BuildInferencePrompt(UTF8ToString(AModelName)));
end;

procedure Model_ClearDefines();
begin
  LLMEngine.Model_ClearDefines();
end;

function  Model_Define(const AModelFilename, AModelName: PAnsiChar; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: PAnsiChar{; const AAddAssistant: Boolean}): Int32;
begin
  Result := LLMEngine.Model_Define(UTF8ToString(AModelFilename), UTF8ToString(AModelName), AMaxContext, UTF8ToString(ATemplate), UTF8ToString(ATemplateEnd), False);
end;

function  Model_SaveDefines(const AFilename: PAnsiChar): Boolean;
begin
  Result := LLMEngine.Model_SaveDefines(UTF8ToString(AFilename));
end;

function  Model_LoadDefines(const AFilename: PAnsiChar): Boolean;
begin
  Result := LLMEngine.Model_LoadDefines(UTF8ToString(AFilename));
end;

procedure Model_ClearStopSequences(const AModelName: PAnsiChar);
begin
  LLMEngine.Model_ClearStopSequences(UTF8ToString(AModelName));
end;

function  Model_AddStopSequence(const AModelName, AToken: PAnsiChar): Int32;
begin
  Result := LLMEngine.Model_AddStopSequence(UTF8ToString(AModelName), UTF8ToString(AToken));
end;

function  Model_GetStopSequenceCount(const AModelName: PAnsiChar): Int32;
begin
  Result := LLMEngine.Model_GetStopSequenceCount(UTF8ToString(AModelName));
end;

function  Model_Load(const AModelName: PAnsiChar): Boolean;
begin
  Result := LLMEngine.Model_Load(UTF8ToString(AModelName));
end;

function  Model_IsLoaded(): Boolean;
begin
  Result := LLMEngine.Model_IsLoaded();
end;

procedure Model_Unload();
begin
  LLMEngine.Model_Unload();
end;


// Inference
function  Inference_Run(const AModelName: PAnsiChar; const AMaxTokens: UInt32): Boolean;
begin
  Result := LLMEngine.Inference_Run(UTF8ToString(AModelName), AMaxTokens)
end;

function  Inference_Start(const AModelName: PAnsiChar; const AMaxTokens: UInt32): Boolean;
begin
  Result := LLMEngine.Inference_Start(UTF8ToString(AModelName), AMaxTokens)
end;

function  Inference_IsActive(): Boolean;
begin
  Result := LLMEngine.Inference_IsActive();
end;

function  Inference_GetNextToken(): PAnsiChar;
begin
  Result := PUTF8Char(LLMEngine.Inference_GetNextToken());
end;

procedure Inference_Stop();
begin
  LLMEngine.Inference_Stop();
end;

function  Inference_GetResponse(): PAnsiChar;
begin
  Result := PUTF8Char(LLMEngine.Inference_GetResponse());
end;

procedure Inference_GetUsage(ATokenInputSpeed, ATokenOutputSpeed: System.PSingle; AInputTokens, AOutputTokens, ATotalTokens: PInteger);
begin
  LLMEngine.Inference_GetUsage(ATokenInputSpeed, ATokenOutputSpeed, AInputTokens, AOutputTokens, ATotalTokens);
end;

// TokenResponse
var
  LTokenResponse: TTokenResponse;
procedure TokenResponse_SetRightMargin(const AMargin: Integer);
begin
  LTokenResponse.SetRightMargin(AMargin);
end;

function  TokenResponse_AddToken(const AToken: PAnsiChar): Integer;
begin
  Result := Ord(LTokenResponse.AddToken(UTF8ToUnicodeString(AToken)));
end;

function  TokenResponse_LastWord(const ATrimLeft: Boolean): PAnsiChar;
begin
  Result := Utils.AsUTF8(LTokenResponse.LastWord(ATrimLeft));
end;

function  TokenResponse_Finalize: Boolean;
begin
  Result := LTokenResponse.Finalize();
end;


{ --------------------------------------------------------------------------- }


initialization
begin
  LLMEngine := TLMEngine.Create();
end;

finalization
begin
  LLMEngine.Free();
end;

end.

