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
  LMEngine.Deps,
  LMEngine.Utils,
  LMEngine.Core;

//=== UTILS =================================================================
procedure LME_Print(const AText: PWideChar; const AColor: Integer);
procedure LME_PrintLn(const AText: PWideChar; const AColor: Integer);

procedure LME_GetCursorPos(X, Y: PInteger);
procedure LME_SetCursorPos(const X, Y: Integer);
procedure LME_ClearConsole();
procedure LME_ClearConsoleLine(const AColor: WORD);

procedure LME_ClearKeyStates();
function  LME_IsKeyPressed(AKey: Byte): Boolean;
function  LME_WasKeyReleased(AKey: Byte): Boolean;
function  LME_WasKeyPressed(AKey: Byte): Boolean;
procedure LME_Pause(const AForcePause: Boolean; AColor: WORD; const AText: PWideChar);

procedure LME_ProcessMessages();
function  LME_MaskFirstFoundWord(const AText, AWord: PWideChar): PWideChar;

procedure LME_SetTokenResponseRightMargin(const AMargin: Integer);
function  LME_AddTokenResponseToken(const AToken: PWideChar): Integer;
function  LME_LastTokenResponseWord(const ATrimLeft: Boolean): PWideChar;
function  LME_FinalizeTokenResponse(): Boolean;


//=== SPEECH =================================================================
procedure LME_SetSpeechWordCallback(const AHandler: Speech.WordEvent; const AUserData: Pointer);
function  LME_GetSpeechWordCallback(): Speech.WordEvent;
function  LME_GetSpeechVoiceCount(): Integer;
function  LME_GetSpeechVoiceAttribute(const AIndex: Integer; const AAttribute: Speech.VoiceAttributeEvent): PWideChar;
procedure LME_ChangeSpeechVoice(const AIndex: Integer);
function  LME_GetSpeechVoice(): Integer;
procedure LME_SetSpeechVolume(const AVolume: Single);
function  LME_GetSpeechVolume(): Single;
procedure LME_SetSpeechRate(const ARate: Single);
function  LME_GetSpeechRate(): Single;
procedure LME_ClearSpeech();
procedure LME_SaySpeech(const AText: PWideChar; const APurge: Boolean);
function  LME_IsSpeechActive(): Boolean;
procedure LME_PauseSpeech();
procedure LME_ResumeSpeech();
procedure LME_ResetSpeech();
procedure LME_SubstituteSpeechWord(const AWord, ASubstituteWord: PWideChar);


//=== CORE ===================================================================
function  LME_GetVersion(const AType: Byte): PWideChar;

procedure LME_ClearError();
procedure LME_SetError(const AText: PWideChar);
function  LME_GetError(): PWideChar;

function  LME_GetInferenceCancelCallback(): TLMEngine.InferenceCancelCallback;
procedure LME_SetInferenceCancelCallback(const AHandler: TLMEngine.InferenceCancelCallback; const AUserData: Pointer);

function  LME_GetInferenceTokenCallback(): TLMEngine.InferenceTokenCallback;
procedure LME_SetInferenceTokenlCallback(const AHandler: TLMEngine.InferenceTokenCallback; const AUserData: Pointer);

function  LME_GetInfoCallback(): TLMEngine.InfoCallback;
procedure LME_SetInfoCallback(const AHandler: TLMEngine.InfoCallback; const AUserData: Pointer);

function  LME_GetLoadModelProgressCallback(): TLMEngine.LoadModelProgressCallback;
procedure LME_SetLoadModelProgressCallback(const AHandler: TLMEngine.LoadModelProgressCallback; const AUserData: Pointer);

function  LME_GetLoadModelCallback(): TLMEngine.LoadModelCallback;
procedure LME_SetLoadModelCallback(const AHandler: TLMEngine.LoadModelCallback; const AUserData: Pointer);

function  LME_GetInferenceStartCallback(): TLMEngine.InferenceStartCallback;
procedure LME_SetInferenceStartCallback(const AHandler: TLMEngine.InferenceStartCallback; const AUserData: Pointer);

function  LME_GetInferenceEndCallback(): TLMEngine.InferenceEndCallback;
procedure LME_SetInferenceEndCallback(const AHandler: TLMEngine.InferenceEndCallback; const AUserData: Pointer);

procedure LME_InitConfig(const AModelPath: PWideChar; const ANumGPULayers: Int32);
function  LME_SaveConfig(const AFilename: PWideChar): Boolean;
function  LME_LoadConfig(const AFilename: PWideChar): Boolean;

procedure LME_ClearAllMessages();
function  LME_AddMessage(const ARole, AContent: PWideChar): Int32;
function  LME_GetLastUserMessage(): PWideChar;
function  LME_BuildMessageInferencePrompt(const AModelName: PWideChar): PWideChar;

procedure LME_ClearModelDefines();
function  LME_DefineModel(const AModelFilename, AModelName: PWideChar; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: PWideChar): Int32;
function  LME_SaveModelDefines(const AFilename: PWideChar): Boolean;
function  LME_LoadModelDefines(const AFilename: PWideChar): Boolean;

function  LME_LoadModel(const AModelName: PWideChar): Boolean;
function  LME_IsModelLoaded(): Boolean;
procedure LME_UnloadModel();

function  LME_RunInference(const AModelName: PWideChar; const AMaxTokens: UInt32): Boolean;
function  LME_GetInferenceResponse(): PWideChar;
procedure LME_GetInferenceStats(ATokenInputSpeed: PSingle; ATokenOutputSpeed: PSingle; AInputTokens: PInt32; AOutputTokens: PInt32; ATotalTokens: PInt32);


implementation

var
  LLMEngine: TLMEngine = nil;


//=== UTILS =================================================================
procedure LME_Print(const AText: PWideChar; const AColor: Integer);
begin
  Console.Print(string(AText), AColor);
end;

procedure LME_PrintLn(const AText: PWideChar; const AColor: Integer);
begin
  Console.PrintLn(string(AText), AColor);
end;

procedure LME_GetCursorPos(X, Y: PInteger);
begin
  LLMEngine.GetCursorPos(X, Y);
end;

procedure LME_SetCursorPos(const X, Y: Integer);
begin
  LLMEngine.SetCursorPos(X, Y);
end;

procedure LME_ClearConsole();
begin
  LLMEngine.ClearConsole();
end;

procedure LME_ClearConsoleLine(const AColor: WORD);
begin
  LLMEngine.ClearConsoleLine(AColor);
end;

procedure LME_ClearKeyStates();
begin
  LLMEngine.ClearKeyStates();
end;

function  LME_IsKeyPressed(AKey: Byte): Boolean;
begin
  Result := LLMEngine.IsKeyPressed(AKey);
end;

function  LME_WasKeyReleased(AKey: Byte): Boolean;
begin
  Result := LLMEngine.WasKeyReleased(AKey);
end;

function  LME_WasKeyPressed(AKey: Byte): Boolean;
begin
  Result := LLMEngine.WasKeyPressed(AKey);
end;

procedure LME_Pause(const AForcePause: Boolean; AColor: WORD; const AText: PWideChar);
begin
  LLMEngine.Pause(AForcePause, AColor, AText);
end;

procedure LME_ProcessMessages();
begin
  LLMEngine.ProcessMessages();
end;

function  LME_MaskFirstFoundWord(const AText, AWord: PWideChar): PWideChar;
begin
  Result := PWideChar(LLMEngine.MaskFirstFoundWord(AText, AWord));
end;

procedure LME_SetTokenResponseRightMargin(const AMargin: Integer);
begin
  LLMEngine.SetTokenResponseRightMargin(AMargin);
end;

function  LME_AddTokenResponseToken(const AToken: PWideChar): Integer;
begin
  Result := LLMEngine.AddTokenResponseToken(AToken);
end;

function  LME_LastTokenResponseWord(const ATrimLeft: Boolean): PWideChar;
begin
  Result := PWideChar(LLMEngine.LastTokenResponseWord(ATrimLeft));
end;

function  LME_FinalizeTokenResponse(): Boolean;
begin
  Result := LLMEngine.FinalizeTokenResponse();
end;



//=== SPEECH =================================================================
procedure LME_SetSpeechWordCallback(const AHandler: Speech.WordEvent; const AUserData: Pointer);
begin
  Speech.SetOnWordEvent(AHandler, AUserData)
end;

function  LME_GetSpeechWordCallback(): Speech.WordEvent;
begin
  Result := Speech.GetOnWordEvent();
end;

function  LME_GetSpeechVoiceCount(): Integer;
begin
  Result := Speech.GetVoiceCount();
end;

function  LME_GetSpeechVoiceAttribute(const AIndex: Integer; const AAttribute: Speech.VoiceAttributeEvent): PWideChar;
begin
  Result := PWideChar(Speech.GetVoiceAttribute(AIndex, AAttribute));
end;

procedure LME_ChangeSpeechVoice(const AIndex: Integer);
begin
  Speech.ChangeVoice(AIndex);
end;

function  LME_GetSpeechVoice(): Integer;
begin
  Result := Speech.GetVoice();
end;

procedure LME_SetSpeechVolume(const AVolume: Single);
begin
  Speech.SetVolume(AVolume);
end;

function  LME_GetSpeechVolume(): Single;
begin
  Result := Speech.GetVolume();
end;

procedure LME_SetSpeechRate(const ARate: Single);
begin
  Speech.SetRate(ARate);
end;

function  LME_GetSpeechRate(): Single;
begin
  Result := Speech.GetRate();
end;

procedure LME_ClearSpeech();
begin
  Speech.Clear();
end;

procedure LME_SaySpeech(const AText: PWideChar; const APurge: Boolean);
begin
  Speech.Say(string(AText), APurge)
end;

function  LME_IsSpeechActive(): Boolean;
begin
  Result := Speech.Active();
end;

procedure LME_PauseSpeech();
begin
  Speech.Pause();
end;

procedure LME_ResumeSpeech();
begin
  Speech.Resume();
end;

procedure LME_ResetSpeech();
begin
  Speech.Reset();
end;

procedure LME_SubstituteSpeechWord(const AWord, ASubstituteWord: PWideChar);
begin
  Speech.SubstituteWord(string(AWord), string(ASubstituteWord));
end;

//=== CORE ==================================================================
function  LME_GetVersion(const AType: Byte): PWideChar;
begin
  Result := PWideChar(LLMEngine.GetVersion(AType));
end;

procedure LME_ClearError();
begin
  LLMEngine.ClearError();
end;

procedure LME_SetError(const AText: PWideChar);
begin
  LLMEngine.SetError(string(AText));
end;

function  LME_GetError(): PWideChar;
begin
  Result := PWideChar(LLMEngine.GetError());
end;

function  LME_GetInferenceCancelCallback(): TLMEngine.InferenceCancelCallback;
begin
  Result := LLMEngine.GetInferenceCancelCallback();
end;

procedure LME_SetInferenceCancelCallback(const AHandler: TLMEngine.InferenceCancelCallback; const AUserData: Pointer);
begin
  LLMEngine.SetInferenceCancelCallback(AHandler, AUserData);
end;

function  LME_GetInferenceTokenCallback(): TLMEngine.InferenceTokenCallback;
begin
  Result := LLMEngine.GetInferenceTokenCallback();
end;

procedure LME_SetInferenceTokenlCallback(const AHandler: TLMEngine.InferenceTokenCallback; const AUserData: Pointer);
begin
  LLMEngine.SetInferenceTokenlCallback(AHandler, AUserData);
end;

function  LME_GetInfoCallback(): TLMEngine.InfoCallback;
begin
  Result := LLMEngine.GetInfoCallback();
end;

procedure LME_SetInfoCallback(const AHandler: TLMEngine.InfoCallback; const AUserData: Pointer);
begin
  LLMEngine.SetInfoCallback(AHandler, AUserData);
end;

function  LME_GetLoadModelProgressCallback(): TLMEngine.LoadModelProgressCallback;
begin
  Result := LLMEngine.GetLoadModelProgressCallback();
end;

procedure LME_SetLoadModelProgressCallback(const AHandler: TLMEngine.LoadModelProgressCallback; const AUserData: Pointer);
begin
  LLMEngine.SetLoadModelProgressCallback(AHandler, AUserData);
end;

function  LME_GetLoadModelCallback(): TLMEngine.LoadModelCallback;
begin
  Result := LLMEngine.GetLoadModelCallback();
end;

procedure LME_SetLoadModelCallback(const AHandler: TLMEngine.LoadModelCallback; const AUserData: Pointer);
begin
  LLMEngine.SetLoadModelCallback(AHandler, AUserData);
end;

function  LME_GetInferenceStartCallback(): TLMEngine.InferenceStartCallback;
begin
  Result := LLMEngine.GetInferenceStartCallback();
end;

procedure LME_SetInferenceStartCallback(const AHandler: TLMEngine.InferenceStartCallback; const AUserData: Pointer);
begin
  LLMEngine.SetInferenceStartCallback(AHandler, AUserData);
end;

function  LME_GetInferenceEndCallback(): TLMEngine.InferenceEndCallback;
begin
  Result := LLMEngine.GetInferenceEndCallback();
end;

procedure LME_SetInferenceEndCallback(const AHandler: TLMEngine.InferenceEndCallback; const AUserData: Pointer);
begin
  LLMEngine.SetInferenceEndCallback(AHandler, AUserData);
end;

procedure LME_InitConfig(const AModelPath: PWideChar; const ANumGPULayers: Int32);
begin
  LLMEngine.InitConfig(string(AModelPath), ANumGPULayers)
end;

function  LME_SaveConfig(const AFilename: PWideChar): Boolean;
begin
  Result := LLMEngine.SaveConfig(string(AFilename));
end;

function  LME_LoadConfig(const AFilename: PWideChar): Boolean;
begin
  Result := LLMEngine.LoadConfig(string(AFilename));
end;

procedure LME_ClearAllMessages();
begin
  LLMEngine.ClearAllMessages();
end;

function  LME_AddMessage(const ARole, AContent: PWideChar): Int32;
begin
  Result := LLMEngine.AddMessage(string(ARole), string(AContent));
end;

function  LME_GetLastUserMessage(): PWideChar;
begin
  Result := PWideChar(LLMEngine.GetLastUserMessage());
end;

function  LME_BuildMessageInferencePrompt(const AModelName: PWideChar): PWideChar;
begin
  Result := PWideChar(LLMEngine.BuildMessageInferencePrompt(AModelName));
end;

procedure LME_ClearModelDefines();
begin
  LLMEngine.ClearModelDefines();
end;

function  LME_DefineModel(const AModelFilename, AModelName: PWideChar; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: PWideChar): Int32;
begin
  Result := LLMEngine.DefineModel(string(AModelFilename), string(AModelName), AMaxContext, string(ATemplate), string(ATemplateEnd));
end;

function  LME_SaveModelDefines(const AFilename: PWideChar): Boolean;
begin
  Result := LLMEngine.SaveModelDefines(string(AFilename));
end;

function  LME_LoadModelDefines(const AFilename: PWideChar): Boolean;
begin
  Result := LLMEngine.LoadModelDefines(string(AFilename));
end;

function  LME_LoadModel(const AModelName: PWideChar): Boolean;
begin
  Result := LLMEngine.LoadModel(string(AModelName));
end;

function  LME_IsModelLoaded(): Boolean;
begin
  Result := LLMEngine.IsModelLoaded();
end;

procedure LME_UnloadModel();
begin
  LLMEngine.UnloadModel();
end;

function  LME_RunInference(const AModelName: PWideChar; const AMaxTokens: UInt32): Boolean;
begin
  Result := LLMEngine.RunInference(string(AModelName), AMaxTokens);
end;

function  LME_GetInferenceResponse(): PWideChar;
begin
  Result := PWideChar(LLMEngine.GetInferenceResponse());
end;

procedure LME_GetInferenceStats(ATokenInputSpeed: PSingle; ATokenOutputSpeed: PSingle; AInputTokens: PInt32; AOutputTokens: PInt32; ATotalTokens: PInt32);
begin
  LLMEngine.GetInferenceStats(ATokenInputSpeed, ATokenOutputSpeed, AInputTokens, AOutputTokens, ATotalTokens);
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
