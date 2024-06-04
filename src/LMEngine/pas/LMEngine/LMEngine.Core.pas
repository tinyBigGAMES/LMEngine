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

unit LMEngine.Core;

{$I LMEngine.Defines.inc}

interface

uses
  WinApi.Windows,
  System.Generics.Collections,
  System.SysUtils,
  System.IOUtils,
  System.Math,
  LMEngine.Deps,
  LMEngine.Utils;

const
  LMENGINE_DLL = 'LMEngine.dll';

type
  { TLMEngine }
  TLMEngine = class(TBaseObject)
  public const
    LF   = #10;
    CR   = #13;
    CRLF = LF+CR;

    // Virtual Keys
    VKEY_ESCAPE   = 27;
    VKEY_SPACE = 32;

    // Primary console colors
    FG_BLUE         = 1;
    FG_GREEN        = 2;
    FG_RED          = 4;
    FG_INTENSITY    = 8;
    BG_BLUE         = $10;
    BG_GREEN        = $20;
    BG_RED          = $40;
    BG_INTENSITY    = $80;

    // Custom console color
    FG_BRIGHTYELLOW = FG_RED OR FG_GREEN OR FG_INTENSITY;
    FG_YELLOW       = FG_RED OR FG_GREEN;
    FG_WHITE        = FG_RED OR FG_GREEN OR FG_BLUE;
    FG_BRIGHTWHITE  = FG_WHITE OR FG_INTENSITY;
    FG_DARKGREEN    = FG_GREEN;
    FG_LIGHTGREEN   = FG_GREEN or FG_INTENSITY;
    FG_DARKGRAY     = FG_INTENSITY;
    FG_CYAN         = FG_GREEN OR FG_BLUE;
    FG_MAGENTA      = FG_RED OR FG_BLUE;

    BG_BRIGHTYELLOW = BG_RED OR BG_GREEN OR BG_INTENSITY;
    BG_YELLOW       = BG_RED OR BG_GREEN;
    BG_WHITE        = BG_RED OR BG_GREEN OR BG_BLUE;
    BG_BRIGHTWHITE  = BG_WHITE OR BG_INTENSITY;
    BG_DARKGREEN    = BG_GREEN;
    BG_LIGHTGREEN   = BG_GREEN or BG_INTENSITY;
    BG_DARKGRAY     = BG_INTENSITY;
    BG_CYAN         = BG_GREEN OR FG_BLUE;
    BG_MAGENTA      = BG_RED OR FG_BLUE;

    ROLE_SYSTEM = 'system';
    ROLE_USER = 'user';
    ROLE_ASSISTANT = 'assistant';
    ROLE_TOOL = 'tool';

    VERSION_FULL  = 0;
    VERSION_MAJOR = 1;
    VERSION_MINOR = 2;
    VERSION_PATCH = 3;

    // Speech Voice Attributes
    SPEECH_VOICEATTR_DESCRIPTION = 0;
    SPEECH_VOICEATTR_NAME        = 1;
    SPEECH_VOICEATTR_VENDOR      = 2;
    SPEECH_VOICEATTR_AGE         = 3;
    SPEECH_VOICEATTR_GENDER      = 4;
    SPEECH_VOICEATTR_LANGUAGE    = 5;
    SPEECH_VOICEATTR_ID          = 6;

    // Token Response
    TOKENRESPONSE_WAIT    = 0;
    TOKENRESPONSE_APPEND  = 1;
    TOKENRESPONSE_NEWLINE = 2;

  public type
    SpeechWordCallback = procedure(const AWord, AText: PWideChar; const AUserData: Pointer); cdecl;
    InferenceCancelCallback = function(const AUserData: Pointer): Boolean; cdecl;
    InferenceTokenCallback = procedure(const AToken: PWideChar; const AUserData: Pointer); cdecl;
    InfoCallback = procedure(const ALevel: Integer; const AText: PWideChar; const AUserData: Pointer); cdecl;
    LoadModelProgressCallback = function(const AModelName: PWideChar; const AProgress: Single; const AUserData: Pointer): Boolean; cdecl;
    LoadModelCallback = procedure(const AModelName: PWideChar; const ASuccess: Boolean; const AUserData: Pointer); cdecl;
    InferenceStartCallback = procedure(const AUserData: Pointer); cdecl;
    InferenceEndCallback = procedure(const AUserData: Pointer); cdecl;
  private type
    TStats = record
      TokenInputSpeed: Double;
      TokenOutputSpeed: Double;
      InputTokens: Int32;
      OutputTokens: Int32;
      TotalTokens: Int32;
    end;
    TCallback<T> = record
      Handler: T;
      UserData: Pointer;
    end;
    TCallbacks = record
      InferenceCancel: TCallback<InferenceCancelCallback>;
      InferenceToken: TCallback<InferenceTokenCallback>;
      Info: TCallback<InfoCallback>;
      LoadModelProgress: TCallback<LoadModelProgressCallback>;
      LoadModel: TCallback<LoadModelCallback>;
      InferenceStart: TCallback<InferenceStartCallback>;
      InferenceEnd: TCallback<InferenceEndCallback>;
    end;
    TConfig = record
      ModelPath: string;
      NumGPULayers: Int32;
    end;
    TMessage = record
      Role: string;
      Content: string;
    end;
    TModel = record
      Filename: string;
      Name: string;
      MaxContext: UInt32;
      Template: string;
      TemplateEnd: string;
      Stop: TArray<string>;
    end;
    TVersion = record
      Full: string;
      Major: string;
      Minor: string;
      Patch: string;
    end;
    TInference = record
      Active: Boolean;
      ModelName: string;
      Prompt: string;
      Response: string;
    end;
    TMessageList = TList<TMessage>;
    TModelList = TDictionary<string, TModel>;
  private
    FError: string;
    FCallbacks: TCallbacks;
    FModel: Pllama_model;
    FModelParams: llama_model_params;
    FContext: Pllama_context;
    FContextParams: llama_context_params;
    FVersion: TVersion;
    FConfig: TConfig;
    FMessageList: TMessageList;
    FModelList: TModelList;
    FStats: TStats;
    FInference: TInference;
    FTokenResponse: TTokenResponse;
    FLastUserMessage: string;
  private
    function MakeVersion(const AVersion: string; const AType: Byte): string;
    function Tokenize(const AContext: Pllama_context; const AText: string; const AAddSpecial: Boolean; const AParseSpecial: Boolean=False): TVector<llama_token>;
    function TokenToPiece(const AContext: Pllama_context; const AToken: llama_token; const ASpecial: Boolean=True): string;
    function ShouldAddBOSToken(const AModel: Pllama_model): Boolean;

    function  OnInferenceCancel(): Boolean;
    procedure OnInferenceToken(const AToken: string);
    procedure OnInfo(const ALevel: Integer; const AText: string);
    function  OnLoadModelProgress(const AModelName: string; const AProgress: Single): Boolean;
    procedure OnLoadModel(const AModelName: string; const ASuccess: Boolean);
    procedure OnInferenceStart();
    procedure OnInferenceEnd();

  public
    constructor Create(); override;
    destructor Destroy(); override;

    // Utils
    procedure Print(const AText: string; const AColor: WORD; const AArgs: array of const);
    procedure PrintLn(const AText: string; const AColor: WORD; const AArgs: array of const);
    procedure GetCursorPos(X, Y: PInteger);
    procedure SetCursorPos(const X, Y: Integer);
    procedure ClearConsole();
    procedure ClearConsoleLine(const AColor: WORD);
    procedure ClearKeyStates();
    function  IsKeyPressed(AKey: Byte): Boolean;
    function  WasKeyReleased(AKey: Byte): Boolean;
    function  WasKeyPressed(AKey: Byte): Boolean;
    procedure Pause(const AForcePause: Boolean=False; AColor: WORD=FG_WHITE; const AText: string='');
    procedure ProcessMessages();
    function  MaskFirstFoundWord(const AText, AWord: string): string;
    procedure SetTokenResponseRightMargin(const AMargin: Integer);
    function  AddTokenResponseToken(const AToken: string): Integer;
    function  LastTokenResponseWord(const ATrimLeft: Boolean): string;
    function  FinalizeTokenResponse(): Boolean;

    // Speech
    procedure SetSpeechWordCallback(const AHandler: SpeechWordCallback; const AUserData: Pointer);
    function  GetSpeechWordCallback(): SpeechWordCallback;
    function  GetSpeechVoiceCount(): Integer;
    function  GetSpeechVoiceAttribute(const AIndex: Integer; const AAttribute: Byte): string;
    procedure ChangeSpeechVoice(const AIndex: Integer);
    function  GetSpeechVoice(): Integer;
    procedure SetSpeechVolume(const AVolume: Single);
    function  GetSpeechVolume(): Single;
    procedure SetSpeechRate(const ARate: Single);
    function  GetSpeechRate(): Single;
    procedure ClearSpeech();
    procedure SaySpeech(const AText: string; const APurge: Boolean);
    function  IsSpeechActive(): Boolean;
    procedure PauseSpeech();
    procedure ResumeSpeech();
    procedure ResetSpeech();
    procedure SubstituteSpeechWord(const AWord, ASubstituteWord: string);

    // Core
    function  GetVersion(const AType: Byte): string;

    procedure ClearError();
    procedure SetError(const AMsg: string; const AArgs: array of const); overload;
    procedure SetError(const AText: string); overload;
    function  GetError(): string;

    function  GetInferenceCancelCallback(): TLMEngine.InferenceCancelCallback;
    procedure SetInferenceCancelCallback(const AHandler: TLMEngine.InferenceCancelCallback; const AUserData: Pointer);

    function  GetInferenceTokenCallback(): TLMEngine.InferenceTokenCallback;
    procedure SetInferenceTokenlCallback(const AHandler: TLMEngine.InferenceTokenCallback; const AUserData: Pointer);

    function  GetInfoCallback(): TLMEngine.InfoCallback;
    procedure SetInfoCallback(const AHandler: TLMEngine.InfoCallback; const AUserData: Pointer);

    function  GetLoadModelProgressCallback(): TLMEngine.LoadModelProgressCallback;
    procedure SetLoadModelProgressCallback(const AHandler: TLMEngine.LoadModelProgressCallback; const AUserData: Pointer);

    function  GetLoadModelCallback(): TLMEngine.LoadModelCallback;
    procedure SetLoadModelCallback(const AHandler: TLMEngine.LoadModelCallback; const AUserData: Pointer);

    function  GetInferenceStartCallback(): TLMEngine.InferenceStartCallback;
    procedure SetInferenceStartCallback(const AHandler: TLMEngine.InferenceStartCallback; const AUserData: Pointer);

    function  GetInferenceEndCallback(): TLMEngine.InferenceEndCallback;
    procedure SetInferenceEndCallback(const AHandler: TLMEngine.InferenceEndCallback; const AUserData: Pointer);

    procedure InitConfig(const AModelPath: string; const ANumGPULayers: Int32);
    function  SaveConfig(const AFilename: string): Boolean;
    function  LoadConfig(const AFilename: string): Boolean;

    procedure ClearAllMessages();
    function  AddMessage(const ARole, AContent: string): Int32;
    function  GetLastUserMessage(): string;
    function  BuildMessageInferencePrompt(const AModelName: string): string;

    procedure ClearModelDefines();
    function  DefineModel(const AModelFilename, AModelName: string; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: string): Int32;
    function  SaveModelDefines(const AFilename: string): Boolean;
    function  LoadModelDefines(const AFilename: string): Boolean;
    procedure ClearModelStopSequences(const AModelName: string);
    function  AddModelStopSequence(const AModelName, AToken: string): Int32;
    function  GetModelStopSequenceCount(const AModelName: string): Int32;
    function  LoadModel(const AModelName: string): Boolean;
    function  IsModelLoaded(): Boolean;
    procedure UnloadModel();

    function  RunInference(const AModelName: string; const AMaxTokens: UInt32): Boolean;
    function  GetInferenceResponse(): string;
    procedure GetInferenceStats(ATokenInputSpeed: System.PSingle; ATokenOutputSpeed: System.PSingle; AInputTokens: PInt32; AOutputTokens: PInt32; ATotalTokens: PInt32);
  end;


implementation

{ llama sampling }
function  _llama_sampling_init(): Pointer; cdecl; external LMENGINE_DLL;
function  _llama_sampling_sample(ctx_sampling: Pointer; ctx_main, ctx_cfg: Pllama_context; idx: integer = -1): llama_token; cdecl; external LMENGINE_DLL;
procedure _llama_sampling_accept(ctx_sampling: Pointer; ctx_main: Pllama_context; id: llama_token; apply_grammar: Boolean); cdecl; external LMENGINE_DLL;
procedure _llama_sampling_free(ctx_sampling: Pointer); cdecl; external LMENGINE_DLL;

{ TLMEngine }
function TLMEngine_ModelLoadProgressCallback(AProgress: single; AUserData: pointer): Boolean; cdecl;
var
  LLMEngine: TLMEngine;
begin
  LLMEngine := AUserData;
  if Assigned(LLMEngine) then
    Result := LLMEngine.OnLoadModelProgress(LLMEngine.FInference.ModelName, AProgress)
  else
    Result := True;
end;

procedure TLMEngine_LogCallback(ALevel: ggml_log_level; const AText: PUTF8Char; AUserData: Pointer); cdecl;
begin
  if Assigned(AUserData) then
    TLMEngine(AUserData).OnInfo(ALevel, Utf8ToString(AText));
end;

procedure TLMEngine_CErrCallback(const AText: PUTF8Char; AUserData: Pointer); cdecl;
begin
  if Assigned(AUserData) then
    TLMEngine(AUserData).OnInfo(GGML_LOG_LEVEL_ERROR, Utf8ToString(AText));
end;

function  TLMEngine.MakeVersion(const AVersion: string; const AType: Byte): string;
var
  LVersionParts: TArray<string>;
begin
  Result := '';

  if AVersion.IsEmpty then
    Exit;

  case AType of
    VERSION_FULL:
    begin
      LVersionParts := AVersion.Split(['.']);
      Result := LVersionParts[0] + '.' + LVersionParts[1] + '.' + LVersionParts[2];
    end;

    VERSION_MAJOR:
    begin
      Result := AVersion.Split(['.'])[0];
    end;

    VERSION_MINOR:
    begin
      Result := AVersion.Split(['.'])[1];
    end;

    VERSION_PATCH:
    begin
      Result := AVersion.Split(['.'])[2];
    end;
  else
    Result := '';
  end;
end;

function TLMEngine.Tokenize(const AContext: Pllama_context; const AText: string; const AAddSpecial: Boolean; const AParseSpecial: Boolean): TVector<llama_token>;
var
  LNumTokens: Integer;
  LResult: TVector<llama_token>;
  LText: UTF8String;
  LTokens: TArray<llama_token>;
begin
  Result := nil;

  try
    LResult := TVector<llama_token>.Create;
    LText := UTF8Encode(AText);

    // Upper limit for the number of tokens
    LNumTokens := Length(LText) + 2 * Ord(AAddSpecial);
    SetLength(LTokens, LNumTokens);

    LNumTokens := llama_tokenize(llama_get_model(AContext), PUTF8Char(LText), Length(LText), @LTokens[0], Length(LTokens), AAddSpecial, AParseSpecial);

    if LNumTokens < 0 then
    begin
      SetLength(LTokens, -LNumTokens);
      LNumTokens := llama_tokenize(llama_get_model(AContext), PUTF8Char(LText), Length(LText), @LTokens[0], Length(LTokens), AAddSpecial, AParseSpecial);
      Assert(LNumTokens = -Length(LTokens));
    end
    else
    begin
      SetLength(LTokens, LNumTokens);
    end;

    LResult.Resize(LNumTokens);
    Move(LTokens[0], LResult.Data^, LNumTokens * SizeOf(llama_token));
    Result := LResult;
  except
    on E: Exception do
    begin
      SetError(E.Message);
      Exit;
    end;
  end;
end;

function TLMEngine.TokenToPiece(const AContext: Pllama_context; const AToken: llama_token; const ASpecial: Boolean): string;
var
  LTokens: Int32;
  LCheck: Int32;
  LBuffer: TArray<UTF8Char>;
begin
  try
    SetLength(LBuffer, 9);
    LTokens := llama_token_to_piece(llama_get_model(AContext), AToken, @LBuffer[0], 8, ASpecial);
    if LTokens < 0 then
      begin
        SetLength(LBuffer, (-LTokens)+1);
        LCheck := llama_token_to_piece(llama_get_model(AContext), AToken, @LBuffer[0], -LTokens, ASpecial);
        Assert(LCheck = -LTokens);
        LBuffer[-LTokens] := #0;
      end
    else
      begin
        LBuffer[LTokens] := #0;
      end;
    Result := UTF8ToString(@LBuffer[0]);
  except
    on E: Exception do
    begin
      SetError(E.Message);
      Exit;
    end;
  end;
end;

function TLMEngine.ShouldAddBOSToken(const AModel: Pllama_model): Boolean;
var
  LAddBOS: Integer;
begin
  LAddBOS := llama_add_bos_token(AModel);
  if LAddBOS <> -1 then
    Result := Boolean(LAddBOS)
  else
    Result := llama_vocab_type(AModel) = LLAMA_VOCAB_TYPE_SPM;
end;

function TLMEngine.OnInferenceCancel(): Boolean;
begin
  if Assigned(FCallbacks.InferenceCancel.Handler) then
    begin
      Result := FCallbacks.InferenceCancel.Handler(FCallbacks.InferenceCancel.UserData);
    end
  else
    begin
      Result := Console.WasKeyReleased(VK_ESCAPE);
    end;
end;

procedure TLMEngine.OnInferenceToken(const AToken: string);
begin
  if Assigned(FCallbacks.InferenceToken.Handler) then
    begin
      FCallbacks.InferenceToken.Handler(PWideChar(AToken), FCallbacks.InferenceToken.UserData);
    end
  else
    begin
      Console.Print(AToken);
    end;
end;

procedure TLMEngine.OnInfo(const ALevel: Integer; const AText: string);
begin
  if Assigned(FCallbacks.Info.Handler) then
  begin
    FCallbacks.Info.Handler(ALevel, PWideChar(AText), FCallbacks.Info.UserData);
  end;
end;

function  TLMEngine.OnLoadModelProgress(const AModelName: string; const AProgress: Single): Boolean;
begin
  Result := True;

  if Assigned(FCallbacks.LoadModelProgress.Handler) then
    begin
      Result := FCallbacks.LoadModelProgress.Handler(PWideChar(AModelName), AProgress, FCallbacks.LoadModelProgress.UserData);
    end
  else
    begin
      Console.Print(Console.CR+'Loading model "%s" (%3.2f%s)...', [AModelName, AProgress*100, '%'], Console.FG_CYAN);
      if AProgress >= 1 then
      begin
        Console.ClearLine(Console.FG_WHITE);
      end;
    end;
end;

procedure TLMEngine.OnLoadModel(const AModelName: string; const ASuccess: Boolean);
begin
  if Assigned(FCallbacks.LoadModel.Handler) then
  begin
    FCallbacks.LoadModel.Handler(PWideChar(AModelName), ASuccess, FCallbacks.LoadModel.UserData);
  end;
end;

procedure TLMEngine.OnInferenceStart();
begin
  if Assigned(FCallbacks.InferenceStart.Handler) then
  begin
    FCallbacks.InferenceStart.Handler(FCallbacks.InferenceStart.UserData);
  end;
end;

procedure TLMEngine.OnInferenceEnd();
begin
  if Assigned(FCallbacks.InferenceEnd.Handler) then
  begin
    FCallbacks.InferenceEnd.Handler(FCallbacks.InferenceEnd.UserData);
  end;
end;

constructor TLMEngine.Create();
var
  LVersion: string;
begin
  inherited;
  LVersion := Utils.GetModuleVersionFullStr();
  FVersion.Full := MakeVersion(LVersion, VERSION_FULL);
  FVersion.Major := MakeVersion(LVersion, VERSION_MAJOR);
  FVersion.Minor := MakeVersion(LVersion, VERSION_MINOR);
  FVersion.Patch := MakeVersion(LVersion, VERSION_PATCH);

  FMessageList := TMessageList.Create();
  FModelList := TModelList.Create();
end;

destructor TLMEngine.Destroy();
begin
  UnloadModel();

  if Assigned(FModelList) then
    FModelList.Free();

  if Assigned(FMessageList) then
    FMessageList.Free();

  inherited;
end;

// Utils
procedure TLMEngine.Print(const AText: string; const AColor: WORD; const AArgs: array of const);
begin
  Console.Print(AText, AArgs, AColor);
end;

procedure TLMEngine.PrintLn(const AText: string; const AColor: WORD; const AArgs: array of const);
begin
  Console.PrintLn(AText, AArgs, AColor);
end;

procedure TLMEngine.GetCursorPos(X, Y: PInteger);
begin
  Console.GetCursorPos(X, Y);
end;

procedure TLMEngine.SetCursorPos(const X, Y: Integer);
begin
  Console.SetCursorPos(X, Y);
end;

procedure TLMEngine.ClearConsole();
begin
  Console.Clear();
end;

procedure TLMEngine.ClearConsoleLine(const AColor: WORD);
begin
  Console.ClearLine(AColor);
end;

procedure TLMEngine.ClearKeyStates();
begin
  Console.ClearKeyStates();
end;

function  TLMEngine.IsKeyPressed(AKey: Byte): Boolean;
begin
  Result := Console.IsKeyPressed(AKey);
end;

function  TLMEngine.WasKeyReleased(AKey: Byte): Boolean;
begin
  Result := Console.WasKeyReleased(AKey);
end;

function  TLMEngine.WasKeyPressed(AKey: Byte): Boolean;
begin
  Result := Console.WasKeyPressed(AKey);
end;

procedure TLMEngine.Pause(const AForcePause: Boolean; AColor: WORD; const AText: string);
begin
  Console.Pause(AForcePause, AColor, AText);
end;

procedure TLMEngine.ProcessMessages();
begin
  Utils.ProcessMessages();
end;

function  TLMEngine.MaskFirstFoundWord(const AText, AWord: string): string;
begin
  Result := Utils.ReplaceFirstFoundWord(AText, AWord, '^');
end;

procedure TLMEngine.SetTokenResponseRightMargin(const AMargin: Integer);
begin
  FTokenResponse.SetRightMargin(AMargin);
end;

function  TLMEngine.AddTokenResponseToken(const AToken: string): Integer;
begin
  Result := Ord(FTokenResponse.AddToken(AToken));
end;

function  TLMEngine.LastTokenResponseWord(const ATrimLeft: Boolean): string;
begin
  Result := FTokenResponse.LastWord(ATrimLeft);
end;

function  TLMEngine.FinalizeTokenResponse(): Boolean;
begin
  Result := FTokenResponse.Finalize;
end;

// Speech
procedure TLMEngine.SetSpeechWordCallback(const AHandler: SpeechWordCallback; const AUserData: Pointer);
begin
  Speech.SetOnWordEvent(AHandler, AUserData);
end;

function  TLMEngine.GetSpeechWordCallback(): SpeechWordCallback;
begin
  Result := Speech.GetOnWordEvent();
end;

function  TLMEngine.GetSpeechVoiceCount(): Integer;
begin
  Result := Speech.GetVoiceCount();
end;

function  TLMEngine.GetSpeechVoiceAttribute(const AIndex: Integer; const AAttribute: Byte): string;
begin
  Result := Speech.GetVoiceAttribute(AIndex, Speech.VoiceAttributeEvent(AAttribute));
end;

procedure TLMEngine.ChangeSpeechVoice(const AIndex: Integer);
begin
  Speech.ChangeVoice(AIndex);
end;

function  TLMEngine.GetSpeechVoice(): Integer;
begin
  Result := Speech.GetVoice();
end;

procedure TLMEngine.SetSpeechVolume(const AVolume: Single);
begin
  Speech.SetVolume(AVolume);
end;

function  TLMEngine.GetSpeechVolume(): Single;
begin
  Result := Speech.GetVolume();
end;

procedure TLMEngine.SetSpeechRate(const ARate: Single);
begin
  Speech.SetRate(ARate);
end;

function  TLMEngine.GetSpeechRate(): Single;
begin
  Result := Speech.GetRate();
end;

procedure TLMEngine.ClearSpeech();
begin
  Speech.Clear();
end;

procedure TLMEngine.SaySpeech(const AText: string; const APurge: Boolean);
begin
  Speech.Say(AText, APurge);
end;

function  TLMEngine.IsSpeechActive(): Boolean;
begin
  Result := Speech.Active();
end;

procedure TLMEngine.PauseSpeech();
begin
  Speech.Pause();
end;

procedure TLMEngine.ResumeSpeech();
begin
  Speech.Resume();
end;

procedure TLMEngine.ResetSpeech();
begin
  Speech.Reset();
end;

procedure TLMEngine.SubstituteSpeechWord(const AWord, ASubstituteWord: string);
begin
  Speech.SubstituteWord(AWord, ASubstituteWord);
end;

// Core
function  TLMEngine.GetVersion(const AType: Byte): string;
begin
  case AType of
    VERSION_FULL:
    begin
      Result := FVersion.Full;
    end;

    VERSION_MAJOR:
    begin
      Result := FVersion.Major;
    end;

    VERSION_MINOR:
    begin
      Result := FVersion.Minor;
    end;

    VERSION_PATCH:
    begin
      Result := FVersion.Patch;
    end;
  else
    Result := '';
  end;
end;

procedure TLMEngine.ClearError();
begin
  FError := '';
end;

procedure TLMEngine.SetError(const AMsg: string; const AArgs: array of const);
begin
  FError := Format(AMsg, AArgs);
end;

procedure TLMEngine.SetError(const AText: string);
begin
  FError := AText;
end;

function  TLMEngine.GetError(): string;
begin
  Result := FError;
end;

function  TLMEngine.GetInferenceCancelCallback(): TLMEngine.InferenceCancelCallback;
begin
  Result := FCallbacks.InferenceCancel.Handler;
end;

procedure TLMEngine.SetInferenceCancelCallback(const AHandler: TLMEngine.InferenceCancelCallback; const AUserData: Pointer);
begin
  FCallbacks.InferenceCancel.Handler := AHandler;
  FCallbacks.InferenceCancel.UserData := AUserData;
end;

function  TLMEngine.GetInferenceTokenCallback(): TLMEngine.InferenceTokenCallback;
begin
  Result := FCallbacks.InferenceToken.Handler;
end;

procedure TLMEngine.SetInferenceTokenlCallback(const AHandler: TLMEngine.InferenceTokenCallback; const AUserData: Pointer);
begin
  FCallbacks.InferenceToken.Handler := AHandler;
  FCallbacks.InferenceToken.UserData := AUserData;
end;

function  TLMEngine.GetInfoCallback(): TLMEngine.InfoCallback;
begin
  Result := FCallbacks.Info.Handler;
end;

procedure TLMEngine.SetInfoCallback(const AHandler: TLMEngine.InfoCallback; const AUserData: Pointer);
begin
  FCallbacks.Info.Handler := AHandler;
  FCallbacks.Info.UserData := AUserData;
end;

function  TLMEngine.GetLoadModelProgressCallback(): TLMEngine.LoadModelProgressCallback;
begin
  Result := FCallbacks.LoadModelProgress.Handler;
end;

procedure TLMEngine.SetLoadModelProgressCallback(const AHandler: TLMEngine.LoadModelProgressCallback; const AUserData: Pointer);
begin
  FCallbacks.LoadModelProgress.Handler := AHandler;
  FCallbacks.LoadModelProgress.UserData := AUserData;
end;

function  TLMEngine.GetLoadModelCallback(): TLMEngine.LoadModelCallback;
begin
  Result := FCallbacks.LoadModel.Handler;
end;

procedure TLMEngine.SetLoadModelCallback(const AHandler: TLMEngine.LoadModelCallback; const AUserData: Pointer);
begin
  FCallbacks.LoadModel.Handler := AHandler;
  FCallbacks.LoadModel.UserData := AUserData;
end;

function  TLMEngine.GetInferenceStartCallback(): TLMEngine.InferenceStartCallback;
begin
  Result := FCallbacks.InferenceStart.Handler;
end;

procedure TLMEngine.SetInferenceStartCallback(const AHandler: TLMEngine.InferenceStartCallback; const AUserData: Pointer);
begin
  FCallbacks.InferenceStart.Handler := AHandler;
  FCallbacks.InferenceStart.UserData := AUserData;
end;

function  TLMEngine.GetInferenceEndCallback(): TLMEngine.InferenceEndCallback;
begin
  Result := FCallbacks.InferenceEnd.Handler;
end;

procedure TLMEngine.SetInferenceEndCallback(const AHandler: TLMEngine.InferenceEndCallback; const AUserData: Pointer);
begin
  FCallbacks.InferenceEnd.Handler := AHandler;
  FCallbacks.InferenceEnd.UserData := AUserData;
end;

procedure TLMEngine.InitConfig(const AModelPath: string; const ANumGPULayers: Int32);
var
  LNumGPULayers: Int32;
begin
  FConfig.ModelPath := AModelPath;
  if ANumGPULayers < 0 then
    LNumGPULayers := MaxInt
  else
    LNumGPULayers := ANumGPULayers;

  FConfig.NumGPULayers := EnsureRange(LNumGPULayers, 0, MaxInt);
end;

function  TLMEngine.SaveConfig(const AFilename: string): Boolean;
var
  LJson: TJsonObject;
  LFilename: string;
begin
  Result := False;

  if AFilename.IsEmpty then
  begin
    SetError('[%s] %s', ['SaveConfig', 'Filename can not be blank']);
    Exit;
  end;

  LFilename := TPath.ChangeExtension(AFilename, 'json');

  try
    LJson := TJsonObject.Create();
    try
      LJson.S['model_path'] := FConfig.ModelPath;
      LJson.I['gpu_layers'] := FConfig.NumGPULayers;

      TFile.WriteAllText(LFilename, LJson.Format(), TEncoding.UTF8);

      Result := TFile.Exists(LFilename);
    finally
      LJson.Free();
    end;
  except
    on E: Exception do
    begin
      SetError('[%s] %s', ['SaveConfig', E.Message]);
      Result := False;
    end;
  end;
end;

function  TLMEngine.LoadConfig(const AFilename: string): Boolean;
var
  LFilename: string;
  LJson: TJsonObject;
  LConfig: TConfig;
begin
  Result := False;

  LFilename := TPath.ChangeExtension(AFilename, 'json');

  if not TFile.Exists(LFilename) then
  begin
    SetError('[%s] File was not found: %s', ['LoadConfig', LFilename]);
    Exit;
  end;

  try
    LJson := TJsonObject.Parse(TFile.ReadAllText(LFilename, TEncoding.UTF8));

    try
      if LJson.Contains('model_path') then
        begin
          LConfig.ModelPath := LJson.S['model_path'];
        end
      else
        begin
          SetError('[%s] "model_path" field was not found', ['LoadConfig']);
          Exit;
        end;

      if LJson.Contains('gpu_layers') then
        begin
          LConfig.NumGPULayers := LJson.I['gpu_layers'];
        end
      else
        begin
          SetError('[%s] "gpu_layers" field was not found', ['LoadConfig']);
          Exit;
        end;

      InitConfig(LConfig.ModelPath, LConfig.NumGPULayers);

      Result := True;

    finally
      LJson.Free();
    end;
  except
    on E: Exception do
    begin
      SetError('[%s] %s', ['LoadConfig', E.Message]);
      Result := False;
    end;
  end;
end;

procedure TLMEngine.ClearAllMessages();
begin
  FMessageList.Clear();
end;

function TLMEngine.AddMessage(const ARole, AContent: string): Int32;
var
  LMessage: TMessage;
begin
  LMessage.Role := ARole;
  LMessage.Content := AContent;
  FMessageList.Add(LMessage);
  Result := FMessageList.Count;
  if Utils.ContainsText(ARole, 'user') then
    FLastUserMessage := AContent;
end;

function  TLMEngine.GetLastUserMessage(): string;
begin
  Result := FLastUserMessage;
end;

function  TLMEngine.BuildMessageInferencePrompt(const AModelName: string): string;
var
  LModel: TModel;
  LMessage: TMessage;
begin
  Result := '';

  if FModelList.TryGetValue(AModelName, LModel) then
  begin
    for LMessage in FMessageList do
    begin
      FInference.Prompt := FInference.Prompt + LModel.Template.Replace('{role}', LMessage.Role).Replace('{content}', LMessage.Content).Trim;
    end;
    FInference.Prompt := FInference.Prompt + LModel.TemplateEnd;
  end;

  Result := FInference.Prompt;
end;

procedure TLMEngine.ClearModelDefines();
begin
  FModelList.Clear();
end;

function TLMEngine.DefineModel(const AModelFilename, AModelName: string; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: string): Int32;
var
  LModel: TModel;
begin
  LModel := Default(TModel);
  LModel.Filename := AModelFilename;
  LModel.Name := AModelName;
  LModel.MaxContext := AMaxContext;
  LModel.Template := ATemplate;
  LModel.TemplateEnd := ATemplateEnd;
  FModelList.AddOrSetValue(AModelName, LModel);
  Result := FModelList.Count
end;

function  TLMEngine.SaveModelDefines(const AFilename: string): Boolean;
var
  LFilename: string;
  LJson: TJsonObject;
  LObject: TJsonObject;
  LModel: TPair<string, TModel>;
begin
  Result := False;

  if AFilename.IsEmpty then
  begin
    SetError('[%s] %s', ['SaveModelDefines', 'Filename can not be blank']);
    Exit;
  end;

  LFilename := TPath.ChangeExtension(AFilename, 'json');

  try
    LJson := TJsonObject.Create();
    try
      with LJson.AddArray('models') do
      begin
        for LModel in FModelList do
        begin
          LObject := TJsonObject.Create();
          LObject.S['filename'] := LModel.Value.Filename;
          LObject.S['name'] := LModel.Value.Name;
          LObject.I['max_context'] := LModel.Value.MaxContext;
          LObject.S['template'] := LModel.Value.Template;
          LObject.S['template_end'] := LModel.Value.TemplateEnd;
          Add(LObject);
        end;
      end;

      TFile.WriteAllText(LFilename, LJson.Format(), TEncoding.UTF8);

      Result := TFile.Exists(LFilename);

    finally
      LJson.Free();
    end;

  except
    on E: Exception do
    begin
      SetError('[%s] %s', ['SaveModelDefines', E.Message]);
      Result := False;
    end;
  end;

end;

function  TLMEngine.LoadModelDefines(const AFilename: string): Boolean;
var
  LFilename: string;
  LJson: TJsonObject;
  LModel: TModel;
  I, LCount: Integer;
begin
  Result := False;
  LModel := Default(TModel);

  LFilename := TPath.ChangeExtension(AFilename, 'json');

  if not TFile.Exists(LFilename) then
  begin
    SetError('[%s] File was not found: %s', ['LoadModelDefines', LFilename]);
    Exit;
  end;

  try
    LJson := TJsonObject.Parse(TFile.ReadAllText(LFilename, TEncoding.UTF8));

    ClearModelDefines();

    try
      if not LJson.Contains('models') then
      begin
        SetError('[%s] "models" field was not found', ['LoadModelDefines']);
        Exit;
      end;

      LCount := LJson.A['models'].Count;

      for I := 0 to LCount-1 do
      begin
        if LJson.A['models'].Items[I].FindValue('filename') <> nil then
          begin
            LModel.Filename := LJson.A['models'].Items[I].FindValue('filename').Value;
          end
        else
          begin
            SetError('[%s] "filename" field was not found', ['LoadModelDefines']);
            Exit;
          end;

        if LJson.A['models'].Items[I].FindValue('name') <> nil then
          begin
            LModel.Name := LJson.A['models'].Items[I].FindValue('name').Value;
          end
        else
          begin
            SetError('[%s] "name" field was not found', ['LoadModelDefines']);
            Exit;
          end;

        if LJson.A['models'].Items[I].FindValue('max_context') <> nil then
          begin
            LModel.MaxContext := LJson.A['models'].Items[I].FindValue('max_context').Value.ToInt64;
          end
        else
          begin
            SetError('[%s] "max_context" field was not found', ['LoadModelDefines']);
            Exit;
          end;

        if LJson.A['models'].Items[I].FindValue('template') <> nil then
          begin
            LModel.Template := LJson.A['models'].Items[I].FindValue('template').Value;
          end
        else
          begin
            SetError('[%s] "template" field was not found', ['LoadModelDefines']);
            Exit;
          end;

        if LJson.A['models'].Items[I].FindValue('template_end') <> nil then
          begin
            LModel.TemplateEnd := LJson.A['models'].Items[I].FindValue('template_end').Value;
          end
        else
          begin
            SetError('[%s] "template_end" field was not found', ['LoadModelDefines']);
            Exit;
          end;

        DefineModel(LModel.Filename, LModel.Name, LModel.MaxContext, LModel.Template, LModel.TemplateEnd);
      end;

      Result := True;

    finally
      LJson.Free();
    end;
  except
    on E: Exception do
    begin
      SetError('[%s] %s', ['LoadModelDefines', E.Message]);
      Result := False;
    end;
  end;
end;

procedure TLMEngine.ClearModelStopSequences(const AModelName: string);
var
  LModel: TModel;
begin
  if FModelList.TryGetValue(AModelName, LModel) then
  begin
    LModel.Stop := nil;
    FModelList.AddOrSetValue(AModelName, LModel)
  end;
end;

function  TLMEngine.AddModelStopSequence(const AModelName, AToken: string): Int32;
var
  LModel: TModel;
  I: Integer;
begin
  Result := -1;
  if FModelList.TryGetValue(AModelName, LModel) then
  begin
    I := Length(LModel.Stop);
    SetLength(LModel.Stop, I + 1);
    LModel.Stop[I] := AToken;
    FModelList.AddOrSetValue(AModelName, LModel);
  end;
end;
function  TLMEngine.GetModelStopSequenceCount(const AModelName: string): Int32;
var
  LModel: TModel;
begin
  Result := 0;
  if FModelList.TryGetValue(AModelName, LModel) then
  begin
    Result := Length(LModel.Stop);
  end;
end;

function  TLMEngine.LoadModel(const AModelName: string): Boolean;
var
  LModel: TModel;
  LFilename: string;
begin
  Result := False;

  try
    // check for valid model name
    if not FModelList.TryGetValue(AModelName, LModel) then
    begin
      SetError('[%s] Model not found: "%s"', ['LoadModel', AModelName]);
      Exit;
    end;

    // Model already loaded
    if IsModelLoaded() then
    begin
      if SameText(LModel.Name, AModelName) then
      begin
        Result := True;
        Exit;
      end;

      // currently loaded model is not AModelName, so unload and load requested one
      UnloadModel();
    end;


    LFilename := TPath.Combine(FConfig.ModelPath, LModel.Filename);
    if not TFile.Exists(LFilename) then
    begin
      SetError('[LoadModel] Model file was not found: "%s"', [LFilename]);
      Exit;
    end;
    FInference.ModelName := AModelName;

    redirect_cerr_to_callback(TLMEngine_CErrCallback, Self);
    llama_log_set(TLMEngine_LogCallback, Self);
    llama_backend_init();
    llama_numa_init(GGML_NUMA_STRATEGY_DISTRIBUTE);

    FModelParams := llama_model_default_params();
    FModelParams.progress_callback_user_data := Self;
    FModelParams.progress_callback := TLMEngine_ModelLoadProgressCallback;
    FModelParams.n_gpu_layers := FConfig.NumGPULayers;
    FModel := llama_load_model_from_file(Utils.AsUTF8(LFilename), FModelParams);
    if not Assigned(FModel) then
    begin
      OnLoadModel(FInference.ModelName, False);
      llama_backend_free();
      SetError('[LoadModel] Failed to load model file: "%s"', [LFilename]);
      Exit;
    end;
    OnLoadModel(FInference.ModelName, True);

    FContextParams := llama_context_default_params();
    //FContextParams.flash_attn := true;
    FContextParams.offload_kqv := true;
    FContextParams.seed  := 1234;
    FContextParams.n_ctx := LModel.MaxContext;
    FContextParams.n_threads := Utils.GetPhysicalProcessorCount();
    FContextParams.n_threads_batch := FContextParams.n_threads;
    FContext := llama_new_context_with_model(FModel, FContextParams);
    if not Assigned(FContext) then
    begin
      llama_free_model(FModel);
      llama_backend_free();
      SetError('[LoadModel] Failed to load model file: "%s"', [LFilename]);
      Exit;
    end;

    Result := IsModelLoaded();
  except
    on E: Exception do
    begin
      SetError(E.Message);
      Exit;
    end;
  end;
end;

function  TLMEngine.IsModelLoaded(): Boolean;
begin
  Result := Boolean(Assigned(FModel) and Assigned(FContext));
end;

procedure TLMEngine.UnloadModel();
begin
  if not IsModelLoaded() then Exit;
  llama_free(FContext);
  FContext := nil;
  llama_free_model(FModel);
  FModel := nil;
  llama_backend_free();
  restore_cerr();
end;

function  TLMEngine.RunInference(const AModelName: string; const AMaxTokens: UInt32): Boolean;
var
  LPast: UInt32;
  LRemain: UInt32;
  LConsumed: UInt32;
  LSamplingContext: Pointer;
  I: UInt32;
  LPredict: UInt32;
  LBatch: UInt32;
  LEval: UInt32;
  LId: llama_token;
  LMaxEmbedSize: UInt32;
  LSkippedTokens: UInt32;
  LEmbedInput: TVector<llama_token>;
  LEmbed: TVector<llama_token>;
  LTimings: llama_timings;
  LTokenStr: string;
  LFirstToken: Boolean;
begin
  Result := False;

  try
    // check if inference is already runnig
    if FInference.Active then
    begin
      SetError('[%s] Inference already active', ['RunInference']);
      Exit;
    end;

    // start new inference
    FInference := Default(TInference);

    // check if model not loaded
    if not LoadModel(AModelName) then
    begin
      Exit;
    end;

    // build prompt message
    FInference.Prompt := BuildMessageInferencePrompt(AModelName);
    if FInference.Prompt.IsEmpty then
    begin
      SetError('[%s] Inference prompt was empty', ['RunInference']);
      Exit;
    end;

    FInference.Active := True;
    FInference.Response := '';

    OnInferenceStart();
    try
      LEmbedInput := tokenize(FContext, FInference.Prompt, true, true);
      try
        if LEmbedInput.empty() then
          LEmbedInput.Add(llama_token_bos(FModel));

        LMaxEmbedSize := llama_n_ctx(FContext) - 4;
        if LEmbedInput.Count() > LMaxEmbedSize then
        begin
          LSkippedTokens := LEmbedInput.count() - LMaxEmbedSize;
          SetError('[%s] Input too long: %d tokens over max context of %d', ['RunInference', LSkippedTokens, LMaxEmbedSize]);
          Exit;
        end;

        LEmbed := TVector<llama_token>.Create();
        try
          LSamplingContext := _llama_sampling_init();
          try
            LPredict := AMaxTokens;
            LBatch := FContextParams.n_ubatch;

            LPast := 0;
            LRemain := LPredict;
            LConsumed := 0;
            LFirstToken := True;

            llama_reset_timings(FContext);
            while LRemain <> 0 do
            begin
              if OnInferenceCancel() then
              begin
                Break;
              end;

              if LEmbed.Count <> 0 then
              begin
                I := 0;
                while I < LEmbed.Count do
                begin
                  LEval := LEmbed.Count - I;
                  if LEval > LBatch then
                    LEval := LBatch;

                  if llama_decode(FContext, llama_batch_get_one(@LEmbed.FItems[I], LEval, LPast, 0)) <> 0 then
                  begin
                    Break;
                  end;

                  Inc(LPast, LEval);
                  Inc(I, LBatch);
                end;
                LEmbed.Clear;
              end;

              if LEmbedInput.Count <= LConsumed then
                begin
                  LId := _llama_sampling_sample(LSamplingContext, FContext, nil);
                  if llama_token_is_eog(FModel, LId) then
                  begin
                    Break;
                  end;

                  _llama_sampling_accept(LSamplingContext, FContext, LId, True);
                  LEmbed.Add(LId);
                  Dec(LRemain);

                  LTokenStr := TokenToPiece(FContext, LId, False);
                  if LFirstToken then
                  begin
                    LFirstToken := False;
                    LTokenStr := LTokenStr.TrimLeft();
                  end;

                  FInference.Response := FInference.Response + LTokenStr;
                  OnInferenceToken(LTokenStr);

                end
              else
                begin
                  while LEmbedInput.Count > LConsumed do
                  begin
                    LEmbed.Add(LEmbedInput[LConsumed]);
                    _llama_sampling_accept(LSamplingContext, FContext, LEmbedInput[LConsumed], False);
                    Inc(LConsumed);
                    if LEmbed.Count >= LBatch then
                    begin
                      Break;
                    end;
                  end;
                end;
            end;

            // get usage
            LTimings := llama_get_timings(FContext);
            FStats.InputTokens := LTimings.n_p_eval;
            FStats.OutputTokens := LTimings.n_eval;
            FStats.TokenInputSpeed := 1e3 / LTimings.t_p_eval_ms * LTimings.n_p_eval;
            FStats.TokenOutputSpeed := 1e3 / LTimings.t_eval_ms * LTimings.n_eval;
            FStats.TotalTokens := FStats.InputTokens + FStats.OutputTokens;
            Result := True;
          finally
            _llama_sampling_free(LSamplingContext);
          end;
        finally
          LEmbed.Free();
        end;
      finally
        LEmbedInput.Free();
      end;
    finally
      FInference.Active := False;
      OnInferenceEnd();
    end;
  except
    on E: Exception do
    begin
      SetError(E.Message);
      Exit;
    end;
  end;
end;

function  TLMEngine.GetInferenceResponse(): string;
begin
  Result := FInference.Response;
end;

procedure TLMEngine.GetInferenceStats(ATokenInputSpeed: System.PSingle; ATokenOutputSpeed: System.PSingle; AInputTokens: PInt32; AOutputTokens: PInt32; ATotalTokens: PInt32);
begin
  if Assigned(ATokenInputSpeed) then
    ATokenInputSpeed^ := FStats.TokenInputSpeed;

  if Assigned(ATokenOutputSpeed) then
    ATokenOutputSpeed^ := FStats.TokenOutputSpeed;

  if Assigned(AInputTokens) then
    AInputTokens^ := FStats.InputTokens;

  if Assigned(AOutputTokens) then
    AOutputTokens^ := FStats.OutputTokens;

  if Assigned(ATotalTokens) then
    ATotalTokens^ := FStats.TotalTokens;
end;

end.
