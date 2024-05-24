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

type
  { TLMEngine }
  TLMEngine = class(TBaseObject)
  public const
    ROLE_SYSTEM = 'system';
    ROLE_USER = 'user';
    ROLE_ASSISTANT = 'assistant';
    ROLE_TOOL = 'tool';

    VERSION_FULL  = 0;
    VERSION_MAJOR = 1;
    VERSION_MINOR = 2;
    VERSION_PATCH = 3;

  public type
    InferenceCancelCallback = function(const ASender: Pointer): Boolean; cdecl;
    InferenceGetNextTokenCallback = procedure(const ASender: Pointer; const AToken: PAnsiChar); cdecl;
    InfoCallback = procedure(const ASender: Pointer; const ALevel: Integer; const AText: PAnsiChar); cdecl;
    LoadModelProgressCallback = function(const ASender: Pointer; const AModelName: PAnsiChar; const AProgress: Single): Boolean; cdecl;
    LoadModelCallback = procedure(const ASender: Pointer; const AModelName: PAnsiChar; const ASuccess: Boolean); cdecl;
    InferenceStartCallback = procedure(const ASender: Pointer); cdecl;
    InferenceEndCallback = procedure(const ASender: Pointer); cdecl;
  protected type
    TError = record
      Msg: UTF8String;
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
      AddAssistant: Boolean;
      Stop: TArray<string>;
    end;
    TUsage = record
      TokenInputSpeed: Double;
      TokenOutputSpeed: Double;
      InputTokens: Int32;
      OutputTokens: Int32;
      TotalTokens: Int32;
    end;
    TCallback<T> = record
      Sender: Pointer;
      Handler: T;
    end;
    TInference = record
      Active: Boolean;
      TokenList: TArray<llama_token>;
      CtxNum: integer;
      KVReqNum: integer;
      LenNum: integer;
      Batch: llama_batch;
      CurNum: integer;
      VocabNum: Int32;
      Logits: System.PSingle;
      Candidates: TArray<llama_token_data>;
      CandidatesP: llama_token_data_array;
      NewTokenId: llama_token;
      TokenStr: UTF8String;
      MaxTokens: int32;
      Prompt: string;
      FirstToken: Boolean;
      ModelName: string;
      PrevToken: string;
      LTokenBuffer: string;
    end;
    TCallbacks = record
      InferenceCancel: TCallback<InferenceCancelCallback>;
      InferenceNextToken: TCallback<InferenceGetNextTokenCallback>;
      Info: TCallback<InfoCallback>;
      LoadModelProgress: TCallback<LoadModelProgressCallback>;
      LoadModel: TCallback<LoadModelCallback>;
      InferenceStart: TCallback<InferenceStartCallback>;
      InferenceEnd: TCallback<InferenceEndCallback>;
    end;
    TVersion = record
      Full: UTF8String;
      Major: UTF8String;
      Minor: UTF8String;
      Patch: UTF8String;
    end;
    TMessageList = TList<TMessage>;
    TModelList = TDictionary<string, TModel>;
  protected
    FVersion: TVersion;
    FConfig: TConfig;
    FMessageList: TMessageList;
    FModelList: TModelList;
    FUsage: TUsage;
    FError: TError;
    FModel: Pllama_model;
    FContext: Pllama_context;
    FLastUserMessage: UTF8String;
    FCallbacks: TCallbacks;
    FInference: TInference;
    FInferencePrompt: UTF8String;
    FInferenceResponse: UTF8String;

    function  MakeVersion(const AVersion: string; const AType: Byte): string;

    function  Tokenize(AContext: Pllama_context; const AText: string; AAddSpecial: Boolean; AParseSpecial: Boolean = False): TArray<llama_token>;
    function  TokenToPiece(AContext: Pllama_context; AToken: llama_token; ASpecial: Boolean = True): string;
    procedure BatchAdd(var ABatch: llama_batch; AId: llama_token; APos: llama_pos; const ASeqIDs: TArray<llama_seq_id>; ALogits: Boolean);

    function  OnLoadModelProgress(const AModelName: string; const AProgress: Single): Boolean;
    procedure OnLoadModel(const AModelName: string; const ASuccess: Boolean);
    procedure OnInfo(const ALevel: Integer; const AText: string);
    function  OnInferenceCancel(): Boolean;
    procedure OnInferenceNextToken();
    procedure OnInferenceStart();
    procedure OnInferenceEnd();

  public
    constructor Create(); override;
    destructor Destroy(); override;

    // Version
    function  Version_Get(const AType: Byte): UTF8String;

    // Error
    procedure Error_Clear();
    procedure Error_Set(const AMsg: string; const AArgs: array of const);
    function  Error_Get(): UTF8String;

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
    procedure Config_Init(const AModelPath: string; const ANumGPULayers: Int32);
    function  Config_Save(const AFilename: string): Boolean;
    function  Config_Load(const AFilename: string): Boolean;

    // Message
    procedure Message_ClearAll();
    function  Message_Add(const ARole, AContent: string): Int32;
    function  Message_GetLastUser(): UTF8String;
    function  Message_BuildInferencePrompt(const AModelName: string): UTF8String;

    // Model
    procedure Model_ClearDefines();
    function  Model_Define(const AModelFilename, AModelName: string; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: string; const AAddAssistant: Boolean): Int32;
    function  Model_SaveDefines(const AFilename: string): Boolean;
    function  Model_LoadDefines(const AFilename: string): Boolean;
    procedure Model_ClearStopSequences(const AModelName: string);
    function  Model_AddStopSequence(const AModelName, AToken: string): Int32;
    function  Model_GetStopSequenceCount(const AModelName: string): Int32;
    function  Model_Load(const AModelName: string): Boolean;
    function  Model_IsLoaded(): Boolean;
    procedure Model_Unload();

    // Inference
    function  Inference_Run(const AModelName: string; const AMaxTokens: UInt32): Boolean;
    function  Inference_Start(const AModelName: string; const AMaxTokens: UInt32): Boolean;
    function  Inference_IsActive(): Boolean;
    function  Inference_GetNextToken(): UTF8String;
    procedure Inference_Stop();
    function  Inference_GetResponse(): UTF8String;
    procedure Inference_GetUsage(const ATokenInputSpeed, ATokenOutputSpeed: System.PSingle; const AInputTokens, AOutputTokens, ATotalTokens: PInteger);
  end;

implementation

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

procedure TLMEngine.OnInfo(const ALevel: Integer; const AText: string);
begin
  if Assigned(FCallbacks.Info.Handler) then
    FCallbacks.Info.Handler(FCallbacks.Info.Sender, ALevel, PUTF8Char(UTF8Encode(AText)));
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

function TLMEngine.Tokenize(AContext: Pllama_context; const AText: string; AAddSpecial: Boolean; AParseSpecial: Boolean): TArray<llama_token>;
var
  LNumTokens: Integer;
  LResult: TArray<llama_token>;
  LText: UTF8String;
begin
  LText := UTF8Encode(AText);

  // upper limit for the number of tokens
  LNumTokens := Length(LText) + 2 * Ord(AAddSpecial);
  SetLength(LResult, LNumTokens);
  LNumTokens := llama_tokenize(llama_get_model(AContext), PUTF8Char(LText), Length(LText), @LResult[0], Length(LResult), AAddSpecial, AParseSpecial);
  if LNumTokens < 0 then
    begin
      SetLength(LResult, -LNumTokens);
      LNumTokens := llama_tokenize(llama_get_model(AContext), PUTF8Char(LText), Length(LText), @LResult[0], Length(LResult), AAddSpecial, AParseSpecial);
      Assert(LNumTokens = -Length(LResult));
    end
  else
    begin
      SetLength(LResult, LNumTokens);
    end;
  Result := LResult;
end;

var
  TokenToPieceBuffer: array[0..1023] of UTF8Char;
function TLMEngine.TokenToPiece(AContext: Pllama_context; AToken: llama_token; ASpecial: Boolean): string;
var
  LNumTokens: Int32;
  LCheck: Int32;
begin
  LNumTokens := llama_token_to_piece(llama_get_model(AContext), AToken, @TokenToPieceBuffer[0], 8, ASpecial);
  if LNumTokens < 0 then
    begin
      LCheck := llama_token_to_piece(llama_get_model(AContext), AToken, @TokenToPieceBuffer[0], -LNumTokens, ASpecial);
      Assert(LCheck = -LNumTokens);
      TokenToPieceBuffer[-LNumTokens] := #0;
    end
  else
    begin
      TokenToPieceBuffer[LNumTokens] := #0;
    end;
  Result := UTF8ToString(@TokenToPieceBuffer[0]);
end;

procedure TLMEngine.BatchAdd(var ABatch: llama_batch; AId: llama_token; APos: llama_pos; const ASeqIDs: TArray<llama_seq_id>; ALogits: Boolean);
var
  I: Integer;
begin
  Pllama_token(IntPtr(ABatch.token) + ABatch.n_tokens * SizeOf(llama_token))^ := AId;
  Pllama_pos(IntPtr(ABatch.pos) + ABatch.n_tokens * SizeOf(llama_pos))^ := APos;
  PInt32(IntPtr(ABatch.n_seq_id) + ABatch.n_tokens * SizeOf(Int32))^ := Length(ASeqIDs);
  for I := Low(ASeqIDs) to High(ASeqIDs) do
  begin
    PPllama_seq_id(IntPtr(ABatch.seq_id) + ABatch.n_tokens * SizeOf(Pllama_seq_id))^^ := ASeqIDs[I];
  end;
    PInt8(IntPtr(ABatch.logits) + ABatch.n_tokens * SizeOf(Int8))^ := Ord(ALogits);
  Inc(ABatch.n_tokens);
end;

function  TLMEngine.OnLoadModelProgress(const AModelName: string; const AProgress: Single): Boolean;
begin
  Result := True;

  if Assigned(FCallbacks.LoadModelProgress.Handler) then
    Result := FCallbacks.LoadModelProgress.Handler(FCallbacks.LoadModelProgress.Sender,  PUTF8Char(UTF8Encode(AModelName)), AProgress)
  else
    begin
      Console.Print(Console.CR+'Loading model "%s" (%3.2f%s)...', [AModelName, AProgress*100, '%'], Console.FG_CYAN);
      if AProgress >= 1 then
        Console.ClearLine(Console.FG_WHITE);
    end;
end;

procedure TLMEngine.OnLoadModel( const AModelName: string; const ASuccess: Boolean);
begin
  if Assigned(FCallbacks.LoadModel.Handler) then
    FCallbacks.LoadModel.Handler(FCallbacks.LoadModel.Sender,  PUTF8Char(UTF8Encode(AModelName)), ASuccess);
end;

function  TLMEngine.OnInferenceCancel(): Boolean;
begin
  Result := False;
  if Assigned(FCallbacks.InferenceCancel.Handler) then
  begin
    Result := FCallbacks.InferenceCancel.Handler(FCallbacks.InferenceCancel.Sender);
  end;
end;

procedure TLMEngine.OnInferenceNextToken();
begin
  if Assigned(FCallbacks.InferenceNextToken.Handler) then
  begin
    FCallbacks.InferenceNextToken.Handler(FCallbacks.InferenceNextToken.Sender, PUTF8Char(FInference.TokenStr));
  end;
end;

procedure TLMEngine.OnInferenceStart();
begin
  if Assigned(FCallbacks.InferenceStart.Handler) then
  begin
    FCallbacks.InferenceStart.Handler(FCallbacks.InferenceStart.Sender);
  end;
end;

procedure TLMEngine.OnInferenceEnd();
begin
  if Assigned(FCallbacks.InferenceEnd.Handler) then
  begin
    FCallbacks.InferenceEnd.Handler(FCallbacks.InferenceEnd.Sender);
  end;
end;

constructor TLMEngine.Create();
var
  LVersion: string;
begin
  inherited;
  LVersion := Utils.GetModuleVersionFullStr();
  FVersion.Full := UTF8Encode(MakeVersion(LVersion, VERSION_FULL));
  FVersion.Major := UTF8Encode(MakeVersion(LVersion, VERSION_MAJOR));
  FVersion.Minor := UTF8Encode(MakeVersion(LVersion, VERSION_MINOR));
  FVersion.Patch := UTF8Encode(MakeVersion(LVersion, VERSION_PATCH));

  FMessageList := TMessageList.Create();
  FModelList := TModelList.Create();
end;

destructor TLMEngine.Destroy();
begin
  Model_Unload();

  if Assigned(FModelList) then
    FModelList.Free();

  if Assigned(FMessageList) then
    FMessageList.Free();
  inherited;
end;

function  TLMEngine.Version_Get(const AType: Byte): UTF8String;
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

procedure TLMEngine.Error_Clear();
begin
  FError.Msg := '';
end;

procedure TLMEngine.Error_Set(const AMsg: string; const AArgs: array of const);
begin
  FError.Msg := UTF8Encode(Format(AMsg, AArgs));
end;

function  TLMEngine.Error_Get(): UTF8String;
begin
  Result := FError.Msg;
end;

function  TLMEngine.Callback_GetLoadModelProgress(): TLMEngine.LoadModelProgressCallback;
begin
  Result := FCallbacks.LoadModelProgress.Handler;
end;

procedure TLMEngine.Callback_SetLoadModelProgress(const ASender: Pointer; const AHandler: TLMEngine.LoadModelProgressCallback);
begin
  FCallbacks.LoadModelProgress.Sender := ASender;
  FCallbacks.LoadModelProgress.Handler := AHandler;
end;

function  TLMEngine.Callback_GetLoadModel(): TLMEngine.LoadModelCallback;
begin
  Result := FCallbacks.LoadModel.Handler;
end;

procedure TLMEngine.Callback_SetLoadModel(const ASender: Pointer; const AHandler: TLMEngine.LoadModelCallback);
begin
  FCallbacks.LoadModel.Sender := ASender;
  FCallbacks.LoadModel.Handler := AHandler;
end;

function  TLMEngine.Callback_GetInferenceCancel(): TLMEngine.InferenceCancelCallback;
begin
  Result := FCallbacks.InferenceCancel.Handler;
end;

procedure TLMEngine.Callback_SetInferenceCancel(const ASender: Pointer; const AHandler: TLMEngine.InferenceCancelCallback);
begin
  FCallbacks.InferenceCancel.Sender := ASender;
  FCallbacks.InferenceCancel.Handler := AHandler;
end;

function  TLMEngine.Callback_GetInferenceNextToken(): TLMEngine.InferenceGetNextTokenCallback;
begin
  Result := FCallbacks.InferenceNextToken.Handler;
end;

procedure TLMEngine.Callback_SetInferenceNextToken(const ASender: Pointer; const AHandler: TLMEngine.InferenceGetNextTokenCallback);
begin
  FCallbacks.InferenceNextToken.Sender := ASender;
  FCallbacks.InferenceNextToken.Handler := AHandler;
end;

function  TLMEngine.Callback_GetInferenceStart(): TLMEngine.InferenceStartCallback;
begin
  Result := FCallbacks.InferenceStart.Handler;
end;

procedure TLMEngine.Callback_SetInferenceStart(const ASender: Pointer; const AHandler: TLMEngine.InferenceStartCallback);
begin
  FCallbacks.InferenceStart.Sender := ASender;
  FCallbacks.InferenceStart.Handler := AHandler;
end;


function  TLMEngine.Callback_GetInferenceEnd(): TLMEngine.InferenceEndCallback;
begin
  Result := FCallbacks.InferenceEnd.Handler;
end;

procedure TLMEngine.Callback_SetInferenceEnd(const ASender: Pointer; const AHandler: TLMEngine.InferenceEndCallback);
begin
  FCallbacks.InferenceEnd.Sender := ASender;
  FCallbacks.InferenceEnd.Handler := AHandler;
end;

function  TLMEngine.Callback_GetInfo(): TLMEngine.InfoCallback;
begin
  Result := FCallbacks.Info.Handler;
end;

procedure TLMEngine.Callback_SetInfo(const ASender: Pointer; const AHandler: TLMEngine.InfoCallback);
begin
  FCallbacks.Info.Sender := ASender;
  FCallbacks.Info.Handler := AHandler;
end;

procedure TLMEngine.Config_Init(const AModelPath: string; const ANumGPULayers: Int32);
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

function  TLMEngine.Config_Save(const AFilename: string): Boolean;
var
  LJson: TJsonObject;
  LFilename: string;
begin
  Result := False;

  if AFilename.IsEmpty then
  begin
    Error_Set('[%s] %s', ['Config_Save', 'Filename can not be blank']);
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
      Error_Set('[%s] %s', ['Config_Save', E.Message]);
      Result := False;
    end;
  end;
end;

function  TLMEngine.Config_Load(const AFilename: string): Boolean;
var
  LFilename: string;
  LJson: TJsonObject;
  LConfig: TConfig;
begin
  Result := False;

  LFilename := TPath.ChangeExtension(AFilename, 'json');

  if not TFile.Exists(LFilename) then
  begin
    Error_Set('[%s] File was not found: %s', ['Config_Load', LFilename]);
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
          Error_Set('[%s] "model_path" field was not found', ['Config_Load']);
          Exit;
        end;

      if LJson.Contains('gpu_layers') then
        begin
          LConfig.NumGPULayers := LJson.I['gpu_layers'];
        end
      else
        begin
          Error_Set('[%s] "gpu_layers" field was not found', ['Config_Load']);
          Exit;
        end;

      Config_Init(LConfig.ModelPath, LConfig.NumGPULayers);

      Result := True;

    finally
      LJson.Free();
    end;
  except
    on E: Exception do
    begin
      Error_Set('[%s] %s', ['Config_Load', E.Message]);
      Result := False;
    end;
  end;
end;

procedure TLMEngine.Message_ClearAll();
begin
  FMessageList.Clear();
end;

function TLMEngine.Message_Add(const ARole, AContent: string): Int32;
var
  LMessage: TMessage;
begin
  LMessage.Role := ARole;
  LMessage.Content := AContent;
  FMessageList.Add(LMessage);
  Result := FMessageList.Count;
  if Utils.ContainsText(ARole, 'user') then
    FLastUserMessage := UTF8Encode(AContent);
end;

function  TLMEngine.Message_GetLastUser(): UTF8String;
begin
  Result := FLastUserMessage;
end;

function  TLMEngine.Message_BuildInferencePrompt(const AModelName: string): UTF8String;
var
  LModel: TModel;
  LMessage: TMessage;
begin
  Result := '';

  if FModelList.TryGetValue(AModelName, LModel) then
  begin
    for LMessage in FMessageList do
    begin
      FInferencePrompt := FInferencePrompt + UTF8Encode(LModel.Template.Replace('{role}', LMessage.Role).Replace('{content}', LMessage.Content).Trim);
    end;
    FInferencePrompt := FInferencePrompt + UTF8Encode(LModel.TemplateEnd);
  end;

  Result := FInferencePrompt;
end;

procedure TLMEngine.Model_ClearDefines();
begin
  FModelList.Clear();
end;

function TLMEngine.Model_Define(const AModelFilename, AModelName: string; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: string; const AAddAssistant: Boolean): Int32;
var
  LModel: TModel;
begin
  LModel := Default(TModel);
  LModel.Filename := AModelFilename;
  LModel.Name := AModelName;
  LModel.MaxContext := AMaxContext;
  LModel.Template := ATemplate;
  LModel.TemplateEnd := ATemplateEnd;
  LModel.AddAssistant := AAddAssistant;
  FModelList.AddOrSetValue(AModelName, LModel);
  Result := FModelList.Count
end;

function  TLMEngine.Model_SaveDefines(const AFilename: string): Boolean;
var
  LFilename: string;
  LJson: TJsonObject;
  LObject: TJsonObject;
  LModel: TPair<string, TModel>;
begin
  Result := False;

  if AFilename.IsEmpty then
  begin
    Error_Set('[%s] %s', ['Model_SaveDefines', 'Filename can not be blank']);
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
          LObject.B['add_assistant'] := LModel.Value.AddAssistant;
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
      Error_Set('[%s] %s', ['Model_SaveDefines', E.Message]);
      Result := False;
    end;
  end;

end;

function  TLMEngine.Model_LoadDefines(const AFilename: string): Boolean;
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
    Error_Set('[%s] File was not found: %s', ['Model_LoadDefines', LFilename]);
    Exit;
  end;

  try
    LJson := TJsonObject.Parse(TFile.ReadAllText(LFilename, TEncoding.UTF8));

    Model_ClearDefines();

    try
      if not LJson.Contains('models') then
      begin
        Error_Set('[%s] "models" field was not found', ['Model_LoadDefines']);
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
            Error_Set('[%s] "filename" field was not found', ['Model_LoadDefines']);
            Exit;
          end;

        if LJson.A['models'].Items[I].FindValue('name') <> nil then
          begin
            LModel.Name := LJson.A['models'].Items[I].FindValue('name').Value;
          end
        else
          begin
            Error_Set('[%s] "name" field was not found', ['Model_LoadDefines']);
            Exit;
          end;

        if LJson.A['models'].Items[I].FindValue('max_context') <> nil then
          begin
            LModel.MaxContext := LJson.A['models'].Items[I].FindValue('max_context').Value.ToInt64;
          end
        else
          begin
            Error_Set('[%s] "max_context" field was not found', ['Model_LoadDefines']);
            Exit;
          end;

        if LJson.A['models'].Items[I].FindValue('template') <> nil then
          begin
            LModel.Template := LJson.A['models'].Items[I].FindValue('template').Value;
          end
        else
          begin
            Error_Set('[%s] "template" field was not found', ['Model_LoadDefines']);
            Exit;
          end;

        if LJson.A['models'].Items[I].FindValue('template_end') <> nil then
          begin
            LModel.TemplateEnd := LJson.A['models'].Items[I].FindValue('template_end').Value;
          end
        else
          begin
            Error_Set('[%s] "template_end" field was not found', ['Model_LoadDefines']);
            Exit;
          end;

        if LJson.A['models'].Items[I].FindValue('add_assistant') <> nil then
          begin
            LModel.AddAssistant := LJson.A['models'].Items[I].FindValue('add_assistant').Value.ToBoolean;
          end
        else
          begin
            Error_Set('[%s] "add_assistant" field was not found', ['Model_LoadDefines']);
            Exit;
          end;

        Model_Define(LModel.Filename, LModel.Name, LModel.MaxContext, LModel.Template, LModel.TemplateEnd, LModel.AddAssistant);
      end;

      Result := True;

    finally
      LJson.Free();
    end;
  except
    on E: Exception do
    begin
      Error_Set('[%s] %s', ['Model_LoadDefines', E.Message]);
      Result := False;
    end;
  end;
end;

procedure TLMEngine.Model_ClearStopSequences(const AModelName: string);
var
  LModel: TModel;
begin
  if FModelList.TryGetValue(AModelName, LModel) then
  begin
    LModel.Stop := nil;
    FModelList.AddOrSetValue(AModelName, LModel)
  end;
end;

function  TLMEngine.Model_AddStopSequence(const AModelName, AToken: string): Int32;
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
function  TLMEngine.Model_GetStopSequenceCount(const AModelName: string): Int32;
var
  LModel: TModel;
begin
  Result := 0;
  if FModelList.TryGetValue(AModelName, LModel) then
  begin
    Result := Length(LModel.Stop);
  end;
end;

function  TLMEngine.Model_Load(const AModelName: string): Boolean;
var
  LModel: TModel;
  LModelParams: llama_model_params;
  LContextParams: llama_context_params;
  LFilename: string;
begin
  Result := False;

  try
    // check for valid model name
    if not FModelList.TryGetValue(AModelName, LModel) then
    begin
      Error_Set('[%s] Model not found: "%s"', ['Model_Load', AModelName]);
      Exit;
    end;

    // Model already loaded
    if Model_IsLoaded then
    begin
      if SameText(LModel.Name, AModelName) then
      begin
        Result := True;
        Exit;
      end;

      // currently loaded model is not AModelName, so unload and load requested one
      Model_Unload();
    end;

    redirect_cerr_to_callback(TLMEngine_CErrCallback, Self);
    llama_log_set(TLMEngine_LogCallback, Self);
    llama_backend_init();
    llama_numa_init(GGML_NUMA_STRATEGY_DISTRIBUTE);

    LModelParams := llama_model_default_params();
    FInference.ModelName := AModelName;
    LModelParams.progress_callback_user_data := Self;
    LModelParams.progress_callback := TLMEngine_ModelLoadProgressCallback;
    LModelParams.n_gpu_layers := FConfig.NumGPULayers;
    LFilename := TPath.Combine(FConfig.ModelPath, LModel.Filename);
    FModel := llama_load_model_from_file(Utils.AsUTF8(LFilename), LModelParams);
    if not Assigned(FModel) then
    begin
      OnLoadModel(AModelName, False);
      llama_backend_free();
      restore_cerr();
      Error_Set('[%s] Failed to load model "%s"', ['Model_Load', LFilename]);
      Exit;
    end;

    OnLoadModel(AModelName, True);

    LContextParams := llama_context_default_params();
    LContextParams.offload_kqv := true;
    LContextParams.seed  := MaxInt;
    LContextParams.n_ctx := LModel.MaxContext;
    LContextParams.n_threads := Utils.GetPhysicalProcessorCount();
    LContextParams.n_threads_batch := LContextParams.n_threads;
    FContext := llama_new_context_with_model(FModel, LContextParams);
    if not Assigned(FContext) then
    begin
      llama_free_model(FModel);
      FModel := nil;
      llama_backend_free();
      restore_cerr();

      Error_Set('[%s] Failed to create context for model "%s"', ['Model_Load', LFilename]);
      Exit;
    end;

    Result := Model_IsLoaded();
  except
    on E: Exception do
    begin
      Error_Set('[%s] %s', ['Model_Load', E.Message]);
      Result := False;
      OnLoadModel(AModelName, False);
    end;
  end;
end;

function  TLMEngine.Model_IsLoaded(): Boolean;
begin
  Result := Boolean(Assigned(FModel) and Assigned(FContext));
end;

procedure TLMEngine.Model_Unload();
begin
  if not Model_IsLoaded() then
  begin
    Exit;
  end;

  Inference_Stop();

  llama_free(FContext);
  FContext := nil;

  llama_free_model(FModel);
  FModel := nil;

  llama_backend_free();
  restore_cerr();
end;

function  TLMEngine.Inference_Run(const AModelName: string; const AMaxTokens: UInt32): Boolean;
begin
  Result := True;

  if Inference_Start(AModelName, AMaxTokens) then
  begin
    while Inference_IsActive() do
    begin
      Inference_GetNextToken();
    end;
  end;
end;

function  TLMEngine.Inference_Start(const AModelName: string; const AMaxTokens: UInt32): Boolean;
var
  I: Integer;
begin
  Result := False;

  try
    // check if inference is already runnig
    if FInference.Active then
    begin
      Error_Set('[%s] Inference already active', ['Inference_Start']);
      Exit;
    end;

    // start new inference
    FInference := Default(TInference);

    // check if model not loaded
    if not Model_Load(AModelName) then
    begin
      Exit;
    end;

    // build prompt message
    FInference.Prompt := UTF8ToString(Message_BuildInferencePrompt(AModelName));
    if FInference.Prompt.IsEmpty then
    begin
      Error_Set('[%s] Inference prompt was empty', ['Inference_Start']);
      Exit;
    end;

    // generate token list
    FInference.TokenList := Tokenize(FContext, FInference.Prompt, true, true);

    FInference.MaxTokens := AMaxTokens;
    FInference.CtxNum    := llama_n_ctx(FContext);
    FInference.LenNum :=  EnsureRange(FInference.MaxTokens, 512, FInference.CtxNum);
    FInference.KVReqNum := Length(FInference.TokenList) + (FInference.LenNum - Length(FInference.TokenList));

    if FInference.KVReqNum > FInference.CtxNum then
    begin
      FInference.TokenList := nil;

      Error_Set('[%s] n_kv_req > n_ctx', ['Inference_Start']);
      Exit;
    end;

    FInference.Batch := llama_batch_init(512, 0, 1);

    for I := 0 to Length(FInference.TokenList)-1 do
    begin
      BatchAdd(FInference.Batch, FInference.TokenList[I], I, [0], false);
    end;

    PInt8(IntPtr(FInference.Batch.logits) + (FInference.Batch.n_tokens-1) * SizeOf(Int8))^ := 1;

    if llama_decode(FContext, FInference.Batch) <> 0 then
    begin
      Inference_Stop();

      Error_Set('[%s] Failed to decoderence already active', ['Inference_Start']);
      Exit;
    end;

    FInference.CurNum := FInference.Batch.n_tokens;

    FInference.VocabNum := llama_n_vocab(FModel);
    SetLength(FInference.Candidates, FInference.VocabNum);

    FInference.FirstToken := True;
    FInference.Active := True;
    FInferenceResponse := '';

    Result := True;

    OnInferenceStart();

  except
    on E: Exception do
    begin
      Error_Set('[%s] %s', ['Inference_Start', E.Message]);
      Result := False;
    end;
  end;

end;

function  TLMEngine.Inference_IsActive(): Boolean;
begin
  Result := FInference.Active;
end;

function  TLMEngine.Inference_GetNextToken(): UTF8String;
var
  I: Integer;
  LTokenStr: string;
  LSkip: Boolean;

  procedure GetUsage();
  var
    LTimings: llama_timings;
  begin
    // get usage
    LTimings := llama_get_timings(FContext);
    FUsage.InputTokens := LTimings.n_p_eval;
    FUsage.OutputTokens := LTimings.n_eval;
    FUsage.TokenInputSpeed := 1e3 / LTimings.t_p_eval_ms * LTimings.n_p_eval;
    FUsage.TokenOutputSpeed := 1e3 / LTimings.t_eval_ms * LTimings.n_eval;
    FUsage.TotalTokens := FUsage.InputTokens + FUsage.OutputTokens;
  end;

  function IsPartEndsWith(const MainStr: string; const AStopTokens: TArray<string>): Boolean;
  var
    i: Integer;
    LStopToken: string;
  begin
    Result := False;

    for LStopToken in AStopTokens do
    begin
      for i := 0 to Length(LStopToken)-1 do
      begin
        if MainStr.EndsWith(LStopToken.Substring(0, i+1)) then
        begin
          Result := True;
          Break;
        end;
      end;
    end;
  end;

  function IsAStopToken(const AText: string; const AStopTokens: TArray<string>): Boolean;
  var
    LStopToken: string;
  begin
    Result := False;

    for LStopToken in AStopTokens do
    begin
      if AText.EndsWith(LStopToken) then
      begin
        Exit(True);
      end;
    end;
  end;

begin
  Result := '';

  try

    // check if inference is runnig
    if not FInference.Active then
    begin
      Error_Set('[%s] Inference was not started', ['Inference_GetNextToken']);
      Exit;
    end;

    if (FInference.CurNum <= FInference.LenNum) then
    begin
      GetUsage();
      if OnInferenceCancel() then
      begin
        Inference_Stop();
        Exit;
      end;

      FInference.Logits  := llama_get_logits_ith(FContext, FInference.Batch.n_tokens - 1);

      for I := 0 to FInference.VocabNum-1 do
      begin
        FInference.Candidates[I].id := I;
        FInference.Candidates[I].logit := PSingle(IntPtr(FInference.Logits) + I*SizeOf(Single))^;
        FInference.Candidates[I].p := 0;
      end;

      FInference.CandidatesP.data := @FInference.Candidates[0];
      FInference.CandidatesP.size := FInference.VocabNum;
      FInference.CandidatesP.sorted := false;

      llama_sample_softmax(FContext, @FInference.CandidatesP);
      FInference.NewTokenId := llama_sample_token_greedy(FContext, @FInference.CandidatesP);


      if llama_token_is_eog(FModel, FInference.NewTokenId) then
      begin
        // <EOG>
        GetUsage();
        Inference_Stop();
        Exit;
      end;

      if (FInference.CurNum = FInference.LenNum) then
      begin
        // <MAX_TOKENS_REACHED>
        GetUsage();
        Inference_Stop();
        Exit;
      end;

      LTokenStr := Utils.SanitizeFromJson(TokenToPiece(FContext, FInference.NewTokenId, false));

      // User code is responsible to remove the leading whitespace of the first
      // non-BOS token when decoding multiple tokens.
      if FInference.FirstToken then
      begin
        if FInference.NewTokenId <> llama_token_bos(FModel) then
        begin
          LTokenStr := LTokenStr.TrimLeft;
        end;
        FInference.FirstToken := False;
      end;

      FInference.LTokenBuffer := FInference.LTokenBuffer + LTokenStr;

      LSkip := False;
      if IsPartEndsWith(FInference.LTokenBuffer, ['\n', '\r', '\b', '\t', '\f']) then
      begin
        FInference.PrevToken := FInference.PrevToken + LTokenStr;
        if IsAStopToken(FInference.LTokenBuffer, ['\n', '\r', '\b', '\t', '\f']) then
          begin
            LTokenStr := FInference.PrevToken;
            LTokenStr := Utils.SanitizeFromJson(LTokenStr);
            FInference.PrevToken := '';
          end
        else
          LSkip := True;
      end;

      if not LSkip then
      begin
      FInference.TokenStr := UTF8Encode(LTokenStr);

      FInferenceResponse := FInferenceResponse + FInference.TokenStr;

      OnInferenceNextToken();

      Result := FInference.TokenStr;
      end;

      FInference.Batch.n_tokens := 0;

      BatchAdd(FInference.Batch, FInference.NewTokenId, FInference.CurNum, [0], true);
      inc(FInference.CurNum);

      if llama_decode(FContext, FInference.Batch) = 1 then
      begin
        Inference_Stop();
        Exit;
      end;
    end;
  except
    on E: Exception do
    begin
      Error_Set('[%s] %s', ['Inference_GetNextToken', E.Message]);
      Result := '';
    end;
  end;

end;

procedure TLMEngine.Inference_Stop();
begin
  if FInference.Active then
  begin
    llama_batch_free(FInference.Batch);
    FInference := Default(TInference);
    OnInferenceEnd();
  end;
end;

function  TLMEngine.Inference_GetResponse(): UTF8String;
begin
  Result := FInferenceResponse;
end;

procedure TLMEngine.Inference_GetUsage(const ATokenInputSpeed, ATokenOutputSpeed: System.PSingle; const AInputTokens, AOutputTokens, ATotalTokens: PInteger);
begin
  if Assigned(ATokenInputSpeed) then
    ATokenInputSpeed^ := FUsage.TokenInputSpeed;

  if Assigned(ATokenOutputSpeed) then
    ATokenOutputSpeed^ := FUsage.TokenOutputSpeed;

  if Assigned(AInputTokens) then
    AInputTokens^ := FUsage.InputTokens;

  if Assigned(AOutputTokens) then
    AOutputTokens^ := FUsage.OutputTokens;

  if Assigned(ATotalTokens) then
    ATotalTokens^ := FUsage.TotalTokens;

end;

end.
