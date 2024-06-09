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
procedure Print(const AText: PWideChar; const AColor: Integer); cdecl; varargs; external LMENGINE_DEPS_DLL; exports Print;
procedure PrintLn(const AText: PWideChar; const AColor: Integer); cdecl; varargs; external LMENGINE_DEPS_DLL; exports PrintLn;

procedure GetCursorPosition(X, Y: PInteger); cdecl; exports GetCursorPosition;
procedure SetCursorPostion(const X, Y: Integer); cdecl; exports SetCursorPostion;
procedure ClearConsole(); cdecl; exports ClearConsole;
procedure ClearConsoleLine(const AColor: WORD); cdecl; exports ClearConsoleLine;

procedure ClearKeyStates(); cdecl; exports ClearKeyStates;
function  IsKeyPressed(AKey: Byte): Boolean; cdecl; exports IsKeyPressed;
function  WasKeyReleased(AKey: Byte): Boolean; cdecl; exports WasKeyReleased;
function  WasKeyPressed(AKey: Byte): Boolean; cdecl; exports WasKeyPressed;
procedure Pause(const AForcePause: Boolean; AColor: WORD; const AText: PWideChar); cdecl; exports Pause;

procedure ProcessMessages(); cdecl; exports ProcessMessages;
function  MaskFirstFoundWord(const AText, AWord: PWideChar): PWideChar; cdecl; exports MaskFirstFoundWord;

procedure SetTokenResponseRightMargin(const AMargin: Integer); cdecl; exports SetTokenResponseRightMargin;
function  AddTokenResponseToken(const AToken: PWideChar): Integer; cdecl; exports AddTokenResponseToken;
function  LastTokenResponseWord(const ATrimLeft: Boolean): PWideChar; cdecl; exports LastTokenResponseWord;
function  FinalizeTokenResponse(): Boolean; cdecl; exports FinalizeTokenResponse;


//=== SPEECH =================================================================
procedure SetSpeechWordCallback(const AHandler: Speech.WordEvent; const AUserData: Pointer); cdecl; exports SetSpeechWordCallback;
function  GetSpeechWordCallback(): Speech.WordEvent; cdecl; exports GetSpeechWordCallback;
function  GetSpeechVoiceCount(): Integer; cdecl; exports GetSpeechVoiceCount;
function  GetSpeechVoiceAttribute(const AIndex: Integer; const AAttribute: Speech.VoiceAttributeEvent): PWideChar; cdecl; exports GetSpeechVoiceAttribute;
procedure ChangeSpeechVoice(const AIndex: Integer); cdecl; exports ChangeSpeechVoice;
function  GetSpeechVoice(): Integer; cdecl; exports GetSpeechVoice;
procedure SetSpeechVolume(const AVolume: Single); cdecl; exports SetSpeechVolume;
function  GetSpeechVolume(): Single; cdecl; exports GetSpeechVolume;
procedure SetSpeechRate(const ARate: Single); cdecl; exports SetSpeechRate;
function  GetSpeechRate(): Single; cdecl; exports GetSpeechRate;
procedure ClearSpeech(); cdecl; exports ClearSpeech;
procedure SaySpeech(const AText: PWideChar; const APurge: Boolean); cdecl; exports SaySpeech;
function  IsSpeechActive(): Boolean; cdecl; exports IsSpeechActive;
procedure PauseSpeech(); cdecl; exports PauseSpeech;
procedure ResumeSpeech(); cdecl; exports ResumeSpeech;
procedure ResetSpeech(); cdecl; exports ResetSpeech;
procedure SubstituteSpeechWord(const AWord, ASubstituteWord: PWideChar); cdecl; exports SubstituteSpeechWord;


//=== CORE ===================================================================
function  GetVersionInfo(const AType: Byte): PWideChar; cdecl; exports GetVersionInfo;

procedure ClearError(); cdecl; exports ClearError;
procedure SetError(const AText: PWideChar); cdecl; exports SetError;
function  GetError(): PWideChar; cdecl; exports GetError;

function  GetInferenceCancelCallback(): TLMEngine.InferenceCancelCallback; cdecl; exports GetInferenceCancelCallback;
procedure SetInferenceCancelCallback(const AHandler: TLMEngine.InferenceCancelCallback; const AUserData: Pointer); cdecl; exports SetInferenceCancelCallback;

function  GetInferenceTokenCallback(): TLMEngine.InferenceTokenCallback; cdecl; exports GetInferenceTokenCallback;
procedure SetInferenceTokenlCallback(const AHandler: TLMEngine.InferenceTokenCallback; const AUserData: Pointer); cdecl; exports SetInferenceTokenlCallback;

function  GetInfoCallback(): TLMEngine.InfoCallback; cdecl; exports GetInfoCallback;
procedure SetInfoCallback(const AHandler: TLMEngine.InfoCallback; const AUserData: Pointer); cdecl; exports SetInfoCallback;

function  GetLoadModelProgressCallback(): TLMEngine.LoadModelProgressCallback; cdecl; exports GetLoadModelProgressCallback;
procedure SetLoadModelProgressCallback(const AHandler: TLMEngine.LoadModelProgressCallback; const AUserData: Pointer); cdecl; exports SetLoadModelProgressCallback;

function  GetLoadModelCallback(): TLMEngine.LoadModelCallback; cdecl; exports GetLoadModelCallback;
procedure SetLoadModelCallback(const AHandler: TLMEngine.LoadModelCallback; const AUserData: Pointer); cdecl; exports SetLoadModelCallback;

function  GetInferenceStartCallback(): TLMEngine.InferenceStartCallback; cdecl; exports GetInferenceStartCallback;
procedure SetInferenceStartCallback(const AHandler: TLMEngine.InferenceStartCallback; const AUserData: Pointer); cdecl; exports SetInferenceStartCallback;

function  GetInferenceEndCallback(): TLMEngine.InferenceEndCallback; cdecl; exports GetInferenceEndCallback;
procedure SetInferenceEndCallback(const AHandler: TLMEngine.InferenceEndCallback; const AUserData: Pointer); cdecl; exports SetInferenceEndCallback;

procedure InitConfig(const AModelPath: PWideChar; const ANumGPULayers: Int32); cdecl; exports InitConfig;
function  SaveConfig(const AFilename: PWideChar): Boolean; cdecl; exports SaveConfig;
function  LoadConfig(const AFilename: PWideChar): Boolean; cdecl; exports LoadConfig;

procedure ClearAllMessages(); cdecl; exports ClearAllMessages;
function  AddMessage(const ARole, AContent: PWideChar): Int32; cdecl; exports AddMessage;
function  GetLastUserMessage(): PWideChar; cdecl; exports GetLastUserMessage;
function  BuildMessageInferencePrompt(const AModelName: PWideChar): PWideChar; cdecl; exports BuildMessageInferencePrompt;

procedure ClearModelDefines(); cdecl; exports ClearModelDefines;
function  DefineModel(const AModelFilename, AModelName: PWideChar; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: PWideChar): Int32; cdecl; exports DefineModel;
function  SaveModelDefines(const AFilename: PWideChar): Boolean; cdecl; exports SaveModelDefines;
function  LoadModelDefines(const AFilename: PWideChar): Boolean; cdecl; exports LoadModelDefines;

function  LoadModel(const AModelName: PWideChar): Boolean; cdecl; exports LoadModel;
function  IsModelLoaded(): Boolean; cdecl; exports IsModelLoaded;
procedure UnloadModel(); cdecl; exports UnloadModel;

function  RunInference(const AModelName: PWideChar; const AMaxTokens: UInt32): Boolean; cdecl; exports RunInference;
function  GetInferenceResponse(): PWideChar; cdecl; exports GetInferenceResponse;
procedure GetInferenceStats(ATokenInputSpeed: PSingle; ATokenOutputSpeed: PSingle; AInputTokens: PInt32; AOutputTokens: PInt32; ATotalTokens: PInt32); cdecl; exports GetInferenceStats;


implementation

var
  LLMEngine: TLMEngine = nil;


//=== UTILS =================================================================


procedure GetCursorPosition(X, Y: PInteger);
begin
  LLMEngine.GetCursorPos(X, Y);
end;

procedure SetCursorPostion(const X, Y: Integer);
begin
  LLMEngine.SetCursorPos(X, Y);
end;

procedure ClearConsole();
begin
  LLMEngine.ClearConsole();
end;

procedure ClearConsoleLine(const AColor: WORD);
begin
  LLMEngine.ClearConsoleLine(AColor);
end;

procedure ClearKeyStates();
begin
  LLMEngine.ClearKeyStates();
end;

function  IsKeyPressed(AKey: Byte): Boolean;
begin
  Result := LLMEngine.IsKeyPressed(AKey);
end;

function  WasKeyReleased(AKey: Byte): Boolean;
begin
  Result := LLMEngine.WasKeyReleased(AKey);
end;

function  WasKeyPressed(AKey: Byte): Boolean;
begin
  Result := LLMEngine.WasKeyPressed(AKey);
end;

procedure Pause(const AForcePause: Boolean; AColor: WORD; const AText: PWideChar);
begin
  LLMEngine.Pause(AForcePause, AColor, AText);
end;

procedure ProcessMessages();
begin
  LLMEngine.ProcessMessages();
end;

function  MaskFirstFoundWord(const AText, AWord: PWideChar): PWideChar;
begin
  Result := PWideChar(LLMEngine.MaskFirstFoundWord(AText, AWord));
end;

procedure SetTokenResponseRightMargin(const AMargin: Integer);
begin
  LLMEngine.SetTokenResponseRightMargin(AMargin);
end;

function  AddTokenResponseToken(const AToken: PWideChar): Integer;
begin
  Result := LLMEngine.AddTokenResponseToken(AToken);
end;

function  LastTokenResponseWord(const ATrimLeft: Boolean): PWideChar;
begin
  Result := PWideChar(LLMEngine.LastTokenResponseWord(ATrimLeft));
end;

function  FinalizeTokenResponse(): Boolean;
begin
  Result := LLMEngine.FinalizeTokenResponse();
end;



//=== SPEECH =================================================================
procedure SetSpeechWordCallback(const AHandler: Speech.WordEvent; const AUserData: Pointer);
begin
  Speech.SetOnWordEvent(AHandler, AUserData)
end;

function  GetSpeechWordCallback(): Speech.WordEvent;
begin
  Result := Speech.GetOnWordEvent();
end;

function  GetSpeechVoiceCount(): Integer;
begin
  Result := Speech.GetVoiceCount();
end;

function  GetSpeechVoiceAttribute(const AIndex: Integer; const AAttribute: Speech.VoiceAttributeEvent): PWideChar;
begin
  Result := PWideChar(Speech.GetVoiceAttribute(AIndex, AAttribute));
end;

procedure ChangeSpeechVoice(const AIndex: Integer);
begin
  Speech.ChangeVoice(AIndex);
end;

function  GetSpeechVoice(): Integer;
begin
  Result := Speech.GetVoice();
end;

procedure SetSpeechVolume(const AVolume: Single);
begin
  Speech.SetVolume(AVolume);
end;

function  GetSpeechVolume(): Single;
begin
  Result := Speech.GetVolume();
end;

procedure SetSpeechRate(const ARate: Single);
begin
  Speech.SetRate(ARate);
end;

function  GetSpeechRate(): Single;
begin
  Result := Speech.GetRate();
end;

procedure ClearSpeech();
begin
  Speech.Clear();
end;

procedure SaySpeech(const AText: PWideChar; const APurge: Boolean);
begin
  Speech.Say(string(AText), APurge)
end;

function  IsSpeechActive(): Boolean;
begin
  Result := Speech.Active();
end;

procedure PauseSpeech();
begin
  Speech.Pause();
end;

procedure ResumeSpeech();
begin
  Speech.Resume();
end;

procedure ResetSpeech();
begin
  Speech.Reset();
end;

procedure SubstituteSpeechWord(const AWord, ASubstituteWord: PWideChar);
begin
  Speech.SubstituteWord(string(AWord), string(ASubstituteWord));
end;

//=== CORE ==================================================================
function  GetVersionInfo(const AType: Byte): PWideChar;
begin
  Result := PWideChar(LLMEngine.GetVersion(AType));
end;

procedure ClearError();
begin
  LLMEngine.ClearError();
end;

procedure SetError(const AText: PWideChar);
begin
  LLMEngine.SetError(string(AText));
end;

function  GetError(): PWideChar;
begin
  Result := PWideChar(LLMEngine.GetError());
end;

function  GetInferenceCancelCallback(): TLMEngine.InferenceCancelCallback;
begin
  Result := LLMEngine.GetInferenceCancelCallback();
end;

procedure SetInferenceCancelCallback(const AHandler: TLMEngine.InferenceCancelCallback; const AUserData: Pointer);
begin
  LLMEngine.SetInferenceCancelCallback(AHandler, AUserData);
end;

function  GetInferenceTokenCallback(): TLMEngine.InferenceTokenCallback;
begin
  Result := LLMEngine.GetInferenceTokenCallback();
end;

procedure SetInferenceTokenlCallback(const AHandler: TLMEngine.InferenceTokenCallback; const AUserData: Pointer);
begin
  LLMEngine.SetInferenceTokenlCallback(AHandler, AUserData);
end;

function  GetInfoCallback(): TLMEngine.InfoCallback;
begin
  Result := LLMEngine.GetInfoCallback();
end;

procedure SetInfoCallback(const AHandler: TLMEngine.InfoCallback; const AUserData: Pointer);
begin
  LLMEngine.SetInfoCallback(AHandler, AUserData);
end;

function  GetLoadModelProgressCallback(): TLMEngine.LoadModelProgressCallback;
begin
  Result := LLMEngine.GetLoadModelProgressCallback();
end;

procedure SetLoadModelProgressCallback(const AHandler: TLMEngine.LoadModelProgressCallback; const AUserData: Pointer);
begin
  LLMEngine.SetLoadModelProgressCallback(AHandler, AUserData);
end;

function  GetLoadModelCallback(): TLMEngine.LoadModelCallback;
begin
  Result := LLMEngine.GetLoadModelCallback();
end;

procedure SetLoadModelCallback(const AHandler: TLMEngine.LoadModelCallback; const AUserData: Pointer);
begin
  LLMEngine.SetLoadModelCallback(AHandler, AUserData);
end;

function  GetInferenceStartCallback(): TLMEngine.InferenceStartCallback;
begin
  Result := LLMEngine.GetInferenceStartCallback();
end;

procedure SetInferenceStartCallback(const AHandler: TLMEngine.InferenceStartCallback; const AUserData: Pointer);
begin
  LLMEngine.SetInferenceStartCallback(AHandler, AUserData);
end;

function  GetInferenceEndCallback(): TLMEngine.InferenceEndCallback;
begin
  Result := LLMEngine.GetInferenceEndCallback();
end;

procedure SetInferenceEndCallback(const AHandler: TLMEngine.InferenceEndCallback; const AUserData: Pointer);
begin
  LLMEngine.SetInferenceEndCallback(AHandler, AUserData);
end;

procedure InitConfig(const AModelPath: PWideChar; const ANumGPULayers: Int32);
begin
  LLMEngine.InitConfig(string(AModelPath), ANumGPULayers)
end;

function  SaveConfig(const AFilename: PWideChar): Boolean;
begin
  Result := LLMEngine.SaveConfig(string(AFilename));
end;

function  LoadConfig(const AFilename: PWideChar): Boolean;
begin
  Result := LLMEngine.LoadConfig(string(AFilename));
end;

procedure ClearAllMessages();
begin
  LLMEngine.ClearAllMessages();
end;

function  AddMessage(const ARole, AContent: PWideChar): Int32;
begin
  Result := LLMEngine.AddMessage(string(ARole), string(AContent));
end;

function  GetLastUserMessage(): PWideChar;
begin
  Result := PWideChar(LLMEngine.GetLastUserMessage());
end;

function  BuildMessageInferencePrompt(const AModelName: PWideChar): PWideChar;
begin
  Result := PWideChar(LLMEngine.BuildMessageInferencePrompt(AModelName));
end;

procedure ClearModelDefines();
begin
  LLMEngine.ClearModelDefines();
end;

function  DefineModel(const AModelFilename, AModelName: PWideChar; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: PWideChar): Int32;
begin
  Result := LLMEngine.DefineModel(string(AModelFilename), string(AModelName), AMaxContext, string(ATemplate), string(ATemplateEnd));
end;

function  SaveModelDefines(const AFilename: PWideChar): Boolean;
begin
  Result := LLMEngine.SaveModelDefines(string(AFilename));
end;

function  LoadModelDefines(const AFilename: PWideChar): Boolean;
begin
  Result := LLMEngine.LoadModelDefines(string(AFilename));
end;

function  LoadModel(const AModelName: PWideChar): Boolean;
begin
  Result := LLMEngine.LoadModel(string(AModelName));
end;

function  IsModelLoaded(): Boolean;
begin
  Result := LLMEngine.IsModelLoaded();
end;

procedure UnloadModel();
begin
  LLMEngine.UnloadModel();
end;

function  RunInference(const AModelName: PWideChar; const AMaxTokens: UInt32): Boolean;
begin
  Result := LLMEngine.RunInference(string(AModelName), AMaxTokens);
end;

function  GetInferenceResponse(): PWideChar;
begin
  Result := PWideChar(LLMEngine.GetInferenceResponse());
end;

procedure GetInferenceStats(ATokenInputSpeed: PSingle; ATokenOutputSpeed: PSingle; AInputTokens: PInt32; AOutputTokens: PInt32; ATotalTokens: PInt32);
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
