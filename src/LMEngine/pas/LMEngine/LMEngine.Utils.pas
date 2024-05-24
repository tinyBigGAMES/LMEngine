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

unit LMEngine.Utils;

{$I LMEngine.Defines.inc}

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.IOUtils,
  System.DateUtils,
  System.Math,
  System.SyncObjs,
  System.Variants,
  System.Net.HttpClient,
  System.Win.ComObj,
  System.Json,
  Vcl.OleServer,
  WinApi.Windows,
  WinApi.Messages,
  WinApi.ShellAPI,
  WinApi.ActiveX,
  WinApi.MMSystem;

type
  { Console }
  Console = class
  public const
    LF   = #10;
    CR   = #13;
    CRLF = LF+CR;

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

  private class var
    FInputCodePage: Cardinal;
    FOutputCodePage: Cardinal;
    FKeyState: array [0..1, 0..255] of Boolean;
  public
    class constructor Create();
    class destructor Destroy();
    class procedure GetCursorPos(X, Y: PInteger);
    class procedure SetCursorPos(const X, Y: Integer);
    class procedure SetCursorVisible(const AVisible: Boolean);
    class procedure Clear();
    class function  ClearScreen(const AConsole: THandle): Boolean;
    class procedure SetTextColor(AColor: Word);
    class procedure ClearLine(AColor: Word);
    class procedure ClearLineFromCursor(AColor: Word);
    class procedure GetSize(AWidth: PInteger; AHeight: PInteger);
    class procedure SetTitle(const ATitle: string);
    class function  HasOutput: Boolean;
    class function  WasRunFrom(): Boolean;
    class function  IsStartedFromDelphiIDE(): Boolean;
    class procedure WaitForAnyKey();
    class function  AnyKeyPressed(): Boolean;
    class procedure ClearKeyStates();
    class function  IsKeyPressed(AKey: Byte): Boolean;
    class function  WasKeyReleased(AKey: Byte): Boolean;
    class function  WasKeyPressed(AKey: Byte): Boolean;
    class procedure Pause(const AForcePause: Boolean=False; aColor: WORD=Console.FG_WHITE; const aMsg: string='');
    class procedure ClearKeyboardBuffer();
    class function  ReadKey(): Char;
    class function  ReadLnX(const AAllowedChars: TSysCharSet; AMaxLength: Integer; const AColor:DWORD=Console.FG_WHITE): string;
    class function  WrapTextEx(const ALine: string; AMaxCol: Integer; const ABreakChars: TSysCharSet=[' ', '-', ',', ':', #9]): string;
    class procedure Print(const AMsg: string; const AArgs: array of const; const AColor: WORD=Console.FG_WHITE); overload;
    class procedure Print(const AMsg: string; const AColor: WORD=Console.FG_WHITE); overload;
    class procedure PrintLn(const AMsg: string; const AArgs: array of const; const AColor: WORD=Console.FG_WHITE); overload;
    class procedure PrintLn(const AMsg: string; const AColor: WORD=Console.FG_WHITE); overload;
    class procedure PrintLn(); overload;
    class procedure Print(); overload;
    class procedure Teletype(const AText: string; const AColor: WORD=Console.FG_WHITE; const AMargin: Integer=10; const AMinDelay: Integer=0; const AMaxDelay: Integer=3; const ABreakKey: Byte=VK_ESCAPE);
  end;

  { Utils }
  Utils = class
  private const
    CTempStaticBufferSize = 4096;
  private class var
    FCriticalSection: TCriticalSection;
    //FMarshaller: TMarshaller;
    FTempStaticBuffer: array[0..CTempStaticBufferSize - 1] of Byte;
  public
    class constructor Create();
    class destructor Destroy();
    class function  AsUTF8(const AText: string): Pointer;
    class function  GetTempStaticBuffer(): PByte;
    class function  GetTempStaticBufferSize(): Integer;
    class function  ResourceExist(const AInstance: HINST; const AResName: string): Boolean;
    class procedure EnterCriticalSection();
    class procedure LeaveCriticalSection();
    class procedure SetDefaultIcon(AWindow: HWND); overload;
    class function  RemoveDuplicates(const aText: string): string;
    class function  HudTextItem(const AKey: string; const AValue: string; const APaddingWidth: Cardinal=20; const ASeperator: string='-'): string;
    class procedure GotoURL(const AURL: string);
    class function  GetComputerName(): string;
    class function  GetLoggedUserName(): string;
    class function  GetOSVersion(): string;
    class function  GetNow(): string;
    class procedure GetDiskFreeSpace(const APath: string; var AFreeSpace: Int64; var ATotalSpace: Int64);
    class procedure GetMemoryFree(var AAvailMem: UInt64; var ATotalMem: UInt64);
    class function  GetVideoCardName(): string;
    class function  GetAppName(): string;
    class function  GetAppPath(): string;
    class function  GetCPUCount(): Integer;
    class function  GetAppVersionStr(): string;
    class function  GetAppVersionFullStr(): string;
    class function  GetModuleVersionFullStr(): string; overload;
    class function  GetModuleVersionFullStr(AFilename: string): string; overload;
    class function  HttpGet(const aURL: string; const aStatus: PString=nil): string;
    class function  RemoveQuotes(const AText: string): string;
    class function  GetEnvVarValue(const AVarName: string): string;
    class function  RandomRange(const AMin, AMax: Integer): Integer;
    class function  RandomRangef(const AMin, AMax: Single): Single;
    class function  RandomBool(): Boolean;
    class function  UnitToScalarValue(const AValue, AMaxValue: Double): Double;
    class procedure ProcessMessages();
    class function  GetPhysicalProcessorCount: DWORD;
    class function  SanitizeToJson(const aText: string): string;
    class function  SanitizeFromJson(const aText: string): string;
    class function  ExcludeLeadingURLDelimiter(const S: string): string;
    class function  IncludeTrailingURLDelimiter(const S: string): string;
    class function  CombineURL(const BaseURL, RelativeURL: string): string;
    class function  SecBetween(const ANow, AThen: TDateTime): Double;
    class function  TimeDifference(ANow, AThen: TDateTime): Double;
    class function  FormatSeconds(const ASeconds: Single): string;
    class function  MinutesToMilliseconds(const AMinutes: Double): Int64;
    class function  ReplaceString(const ASource, ASubStr, AReplaceStr: string; N: Integer): string;
    class function  ContainsText(const AText, ASubText: string): Boolean;
    class function  ReplaceFirstFoundWord(const AText, AWord: string; AReplaceChar: Char): string;
  end;

  { TAsyncProc }
  TAsyncProc = reference to procedure;

  { TAsyncThread }
  TAsyncThread = class(TThread)
  protected
    FTask: TAsyncProc;
    FWait: TAsyncProc;
    FFinished: Boolean;
  public
    property TaskProc: TAsyncProc read FTask write FTask;
    property WaitProc: TAsyncProc read FWait write FWait;
    property Finished: Boolean read FFinished;
    constructor Create(); virtual;
    destructor Destroy(); override;
    procedure Execute(); override;
  end;

  { Async }
  Async = class
  private type
    TBusyData = record
      Name: string;
      Thread: Pointer;
      Flag: Boolean;
    end;
  private class var
    FQueue: TList<TAsyncThread>;
    FBusy: TDictionary<string, TBusyData>;
  private
    class constructor Create();
    class destructor Destroy();
  public
    class procedure Clear(); static;
    class procedure Process(); static;
    class procedure Run(const AName: string; const ABackgroundTask: TAsyncProc; const AWaitForgroundTask: TAsyncProc); static;
    class function  Busy(const AName: string): Boolean; static;
    class procedure Suspend(); static;
    class procedure Resume(); static;
    class procedure Enter(); static;
    class procedure Leave(); static;
  end;

  { TTimer }
  TTimer = record
  private
    FLastTime: Double;
    FInterval: Double;
    FSpeed: Double;
  public
    class operator Initialize (out ADest: TTimer);
    function glfwGetTime: Double;
    procedure InitMS(const AValue: Double);
    procedure InitFPS(const AValue: Double);
    function Check(): Boolean;
    procedure Reset();
    function  Speed(): Double;
  end;
{$REGION ' SpeechLab '}
{ Speech }
const
  SVEStartInputStream = $00000002;
  SVEEndInputStream = $00000004;
  SVEVoiceChange = $00000008;
  SVEBookmark = $00000010;
  SVEWordBoundary = $00000020;
  SVEPhoneme = $00000040;
  SVESentenceBoundary = $00000080;
  SVEViseme = $00000100;
  SVEAudioLevel = $00000200;
  SVEPrivate = $00008000;
  SVEAllEvents = $000083FE;

  SVSFDefault = $00000000;
  SVSFlagsAsync = $00000001;
  SVSFPurgeBeforeSpeak = $00000002;
  SVSFIsFilename = $00000004;
  SVSFIsXML = $00000008;
  SVSFIsNotXML = $00000010;
  SVSFPersistXML = $00000020;
  SVSFNLPSpeakPunc = $00000040;
  SVSFParseSapi = $00000080;
  SVSFParseSsml = $00000100;
  SVSFParseAutodetect = $00000000;
  SVSFNLPMask = $00000040;
  SVSFParseMask = $00000180;
  SVSFVoiceMask = $000001FF;
  SVSFUnusedFlags = $FFFFFE00;

  SRSEDone = $00000001;
  SRSEIsSpeaking = $00000002;

type
  SpeechDataKeyLocation = TOleEnum;
  SpeechTokenContext = TOleEnum;
  SpeechTokenShellFolder = TOleEnum;
  ISpeechObjectToken = interface;
  SpeechVisemeFeature = TOleEnum;
  SpeechVisemeType = TOleEnum;
  SpeechRunState = TOleEnum;
  SpeechAudioFormatType = TOleEnum;
  SpeechStreamSeekPositionType = TOleEnum;
  SpeechVoiceEvents = TOleEnum;
  SpeechVoicePriority = TOleEnum;
  SpeechVoiceSpeakFlags = TOleEnum;

  ISpeechDataKey = interface(IDispatch)
    ['{CE17C09B-4EFA-44D5-A4C9-59D9585AB0CD}']
    procedure SetBinaryValue(const ValueName: WideString; Value: OleVariant); safecall;
    function GetBinaryValue(const ValueName: WideString): OleVariant; safecall;
    procedure SetStringValue(const ValueName: WideString; const Value: WideString); safecall;
    function GetStringValue(const ValueName: WideString): WideString; safecall;
    procedure SetLongValue(const ValueName: WideString; Value: Integer); safecall;
    function GetLongValue(const ValueName: WideString): Integer; safecall;
    function OpenKey(const SubKeyName: WideString): ISpeechDataKey; safecall;
    function CreateKey(const SubKeyName: WideString): ISpeechDataKey; safecall;
    procedure DeleteKey(const SubKeyName: WideString); safecall;
    procedure DeleteValue(const ValueName: WideString); safecall;
    function EnumKeys(Index: Integer): WideString; safecall;
    function EnumValues(Index: Integer): WideString; safecall;
  end;

  ISpeechObjectTokens = interface(IDispatch)
    ['{9285B776-2E7B-4BC0-B53E-580EB6FA967F}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechObjectToken; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechObjectTokenCategory = interface(IDispatch)
    ['{CA7EAC50-2D01-4145-86D4-5AE7D70F4469}']
    function Get_Id: WideString; safecall;
    procedure Set_Default(const TokenId: WideString); safecall;
    function Get_Default: WideString; safecall;
    procedure SetId(const Id: WideString; CreateIfNotExist: WordBool); safecall;
    function GetDataKey(Location: SpeechDataKeyLocation): ISpeechDataKey; safecall;
    function EnumerateTokens(const RequiredAttributes: WideString;
                             const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    property Id: WideString read Get_Id;
    property Default: WideString read Get_Default write Set_Default;
  end;

  ISpeechObjectToken = interface(IDispatch)
    ['{C74A3ADC-B727-4500-A84A-B526721C8B8C}']
    function Get_Id: WideString; safecall;
    function Get_DataKey: ISpeechDataKey; safecall;
    function Get_Category: ISpeechObjectTokenCategory; safecall;
    function GetDescription(Locale: Integer): WideString; safecall;
    procedure SetId(const Id: WideString; const CategoryID: WideString; CreateIfNotExist: WordBool); safecall;
    function GetAttribute(const AttributeName: WideString): WideString; safecall;
    function CreateInstance(const pUnkOuter: IUnknown; ClsContext: SpeechTokenContext): IUnknown; safecall;
    procedure Remove(const ObjectStorageCLSID: WideString); safecall;
    function GetStorageFileName(const ObjectStorageCLSID: WideString; const KeyName: WideString;
                                const FileName: WideString; Folder: SpeechTokenShellFolder): WideString; safecall;
    procedure RemoveStorageFileName(const ObjectStorageCLSID: WideString;
                                    const KeyName: WideString; DeleteFile: WordBool); safecall;
    function IsUISupported(const TypeOfUI: WideString; const ExtraData: OleVariant;
                           const Object_: IUnknown): WordBool; safecall;
    procedure DisplayUI(hWnd: Integer; const Title: WideString; const TypeOfUI: WideString;
                        const ExtraData: OleVariant; const Object_: IUnknown); safecall;
    function MatchesAttributes(const Attributes: WideString): WordBool; safecall;
    property Id: WideString read Get_Id;
    property DataKey: ISpeechDataKey read Get_DataKey;
    property Category: ISpeechObjectTokenCategory read Get_Category;
  end;

  ISpeechVoiceStatus = interface(IDispatch)
    ['{8BE47B07-57F6-11D2-9EEE-00C04F797396}']
    function Get_CurrentStreamNumber: Integer; safecall;
    function Get_LastStreamNumberQueued: Integer; safecall;
    function Get_LastHResult: Integer; safecall;
    function Get_RunningState: SpeechRunState; safecall;
    function Get_InputWordPosition: Integer; safecall;
    function Get_InputWordLength: Integer; safecall;
    function Get_InputSentencePosition: Integer; safecall;
    function Get_InputSentenceLength: Integer; safecall;
    function Get_LastBookmark: WideString; safecall;
    function Get_LastBookmarkId: Integer; safecall;
    function Get_PhonemeId: Smallint; safecall;
    function Get_VisemeId: Smallint; safecall;
    property CurrentStreamNumber: Integer read Get_CurrentStreamNumber;
    property LastStreamNumberQueued: Integer read Get_LastStreamNumberQueued;
    property LastHResult: Integer read Get_LastHResult;
    property RunningState: SpeechRunState read Get_RunningState;
    property InputWordPosition: Integer read Get_InputWordPosition;
    property InputWordLength: Integer read Get_InputWordLength;
    property InputSentencePosition: Integer read Get_InputSentencePosition;
    property InputSentenceLength: Integer read Get_InputSentenceLength;
    property LastBookmark: WideString read Get_LastBookmark;
    property LastBookmarkId: Integer read Get_LastBookmarkId;
    property PhonemeId: Smallint read Get_PhonemeId;
    property VisemeId: Smallint read Get_VisemeId;
  end;

  ISpeechWaveFormatEx = interface(IDispatch)
    ['{7A1EF0D5-1581-4741-88E4-209A49F11A10}']
    function Get_FormatTag: Smallint; safecall;
    procedure Set_FormatTag(FormatTag: Smallint); safecall;
    function Get_Channels: Smallint; safecall;
    procedure Set_Channels(Channels: Smallint); safecall;
    function Get_SamplesPerSec: Integer; safecall;
    procedure Set_SamplesPerSec(SamplesPerSec: Integer); safecall;
    function Get_AvgBytesPerSec: Integer; safecall;
    procedure Set_AvgBytesPerSec(AvgBytesPerSec: Integer); safecall;
    function Get_BlockAlign: Smallint; safecall;
    procedure Set_BlockAlign(BlockAlign: Smallint); safecall;
    function Get_BitsPerSample: Smallint; safecall;
    procedure Set_BitsPerSample(BitsPerSample: Smallint); safecall;
    function Get_ExtraData: OleVariant; safecall;
    procedure Set_ExtraData(ExtraData: OleVariant); safecall;
    property FormatTag: Smallint read Get_FormatTag write Set_FormatTag;
    property Channels: Smallint read Get_Channels write Set_Channels;
    property SamplesPerSec: Integer read Get_SamplesPerSec write Set_SamplesPerSec;
    property AvgBytesPerSec: Integer read Get_AvgBytesPerSec write Set_AvgBytesPerSec;
    property BlockAlign: Smallint read Get_BlockAlign write Set_BlockAlign;
    property BitsPerSample: Smallint read Get_BitsPerSample write Set_BitsPerSample;
    property ExtraData: OleVariant read Get_ExtraData write Set_ExtraData;
  end;

  ISpeechAudioFormat = interface(IDispatch)
    ['{E6E9C590-3E18-40E3-8299-061F98BDE7C7}']
    function Get_type_: SpeechAudioFormatType; safecall;
    procedure Set_type_(AudioFormat: SpeechAudioFormatType); safecall;
    function Get_Guid: WideString; safecall;
    procedure Set_Guid(const Guid: WideString); safecall;
    function GetWaveFormatEx: ISpeechWaveFormatEx; safecall;
    procedure SetWaveFormatEx(const SpeechWaveFormatEx: ISpeechWaveFormatEx); safecall;
    property type_: SpeechAudioFormatType read Get_type_ write Set_type_;
    property Guid: WideString read Get_Guid write Set_Guid;
  end;

  ISpeechBaseStream = interface(IDispatch)
    ['{6450336F-7D49-4CED-8097-49D6DEE37294}']
    function Get_Format: ISpeechAudioFormat; safecall;
    procedure _Set_Format(const AudioFormat: ISpeechAudioFormat); safecall;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer): Integer; safecall;
    function Write(Buffer: OleVariant): Integer; safecall;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType): OleVariant; safecall;
    property Format: ISpeechAudioFormat read Get_Format write _Set_Format;
  end;

  ISpeechVoice = interface(IDispatch)
    ['{269316D8-57BD-11D2-9EEE-00C04F797396}']
    function Get_Status: ISpeechVoiceStatus; safecall;
    function Get_Voice: ISpeechObjectToken; safecall;
    procedure _Set_Voice(const Voice: ISpeechObjectToken); safecall;
    function Get_AudioOutput: ISpeechObjectToken; safecall;
    procedure _Set_AudioOutput(const AudioOutput: ISpeechObjectToken); safecall;
    function Get_AudioOutputStream: ISpeechBaseStream; safecall;
    procedure _Set_AudioOutputStream(const AudioOutputStream: ISpeechBaseStream); safecall;
    function Get_Rate: Integer; safecall;
    procedure Set_Rate(Rate: Integer); safecall;
    function Get_Volume: Integer; safecall;
    procedure Set_Volume(Volume: Integer); safecall;
    procedure Set_AllowAudioOutputFormatChangesOnNextSet(Allow: WordBool); safecall;
    function Get_AllowAudioOutputFormatChangesOnNextSet: WordBool; safecall;
    function Get_EventInterests: SpeechVoiceEvents; safecall;
    procedure Set_EventInterests(EventInterestFlags: SpeechVoiceEvents); safecall;
    procedure Set_Priority(Priority: SpeechVoicePriority); safecall;
    function Get_Priority: SpeechVoicePriority; safecall;
    procedure Set_AlertBoundary(Boundary: SpeechVoiceEvents); safecall;
    function Get_AlertBoundary: SpeechVoiceEvents; safecall;
    procedure Set_SynchronousSpeakTimeout(msTimeout: Integer); safecall;
    function Get_SynchronousSpeakTimeout: Integer; safecall;
    function Speak(const Text: WideString; Flags: SpeechVoiceSpeakFlags): Integer; safecall;
    function SpeakStream(const Stream: ISpeechBaseStream; Flags: SpeechVoiceSpeakFlags): Integer; safecall;
    procedure Pause; safecall;
    procedure Resume; safecall;
    function Skip(const Type_: WideString; NumItems: Integer): Integer; safecall;
    function GetVoices(const RequiredAttributes: WideString; const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    function GetAudioOutputs(const RequiredAttributes: WideString;
                             const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    function WaitUntilDone(msTimeout: Integer): WordBool; safecall;
    function SpeakCompleteEvent: Integer; safecall;
    function IsUISupported(const TypeOfUI: WideString; const ExtraData: OleVariant): WordBool; safecall;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString; const TypeOfUI: WideString;
                        const ExtraData: OleVariant); safecall;
    property Status: ISpeechVoiceStatus read Get_Status;
    property Voice: ISpeechObjectToken read Get_Voice write _Set_Voice;
    property AudioOutput: ISpeechObjectToken read Get_AudioOutput write _Set_AudioOutput;
    property AudioOutputStream: ISpeechBaseStream read Get_AudioOutputStream write _Set_AudioOutputStream;
    property Rate: Integer read Get_Rate write Set_Rate;
    property Volume: Integer read Get_Volume write Set_Volume;
    property AllowAudioOutputFormatChangesOnNextSet: WordBool read Get_AllowAudioOutputFormatChangesOnNextSet write Set_AllowAudioOutputFormatChangesOnNextSet;
    property EventInterests: SpeechVoiceEvents read Get_EventInterests write Set_EventInterests;
    property Priority: SpeechVoicePriority read Get_Priority write Set_Priority;
    property AlertBoundary: SpeechVoiceEvents read Get_AlertBoundary write Set_AlertBoundary;
    property SynchronousSpeakTimeout: Integer read Get_SynchronousSpeakTimeout write Set_SynchronousSpeakTimeout;
  end;

  TSpVoiceStartStream = procedure(ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpVoiceEndStream = procedure(ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant) of object;
  TSpVoiceVoiceChange = procedure(ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant; const VoiceObjectToken: ISpeechObjectToken) of object;
  TSpVoiceBookmark = procedure(ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;  const Bookmark: WideString; BookmarkId: Integer) of object;
  TSpVoiceWord = procedure(ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant; CharacterPosition: Integer; Length: Integer) of object;
  TSpVoiceSentence = procedure(ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant; CharacterPosition: Integer; Length: Integer) of object;
  TSpVoicePhoneme = procedure(ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant; Duration: Integer; NextPhoneId: Smallint; Feature: SpeechVisemeFeature; CurrentPhoneId: Smallint) of object;
  TSpVoiceViseme = procedure(ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant; Duration: Integer; NextVisemeId: SpeechVisemeType; Feature: SpeechVisemeFeature; CurrentVisemeId: SpeechVisemeType) of object;
  TSpVoiceAudioLevel = procedure(ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant; AudioLevel: Integer) of object;
  TSpVoiceEnginePrivate = procedure(ASender: TObject; StreamNumber: Integer; StreamPosition: Integer; EngineData: OleVariant) of object;

  { TSpVoice }
  TSpVoice = class(TOleServer)
  private
    FOnStartStream: TSpVoiceStartStream;
    FOnEndStream: TSpVoiceEndStream;
    FOnVoiceChange: TSpVoiceVoiceChange;
    FOnBookmark: TSpVoiceBookmark;
    FOnWord: TSpVoiceWord;
    FOnSentence: TSpVoiceSentence;
    FOnPhoneme: TSpVoicePhoneme;
    FOnViseme: TSpVoiceViseme;
    FOnAudioLevel: TSpVoiceAudioLevel;
    FOnEnginePrivate: TSpVoiceEnginePrivate;
    FIntf: ISpeechVoice;
    function GetDefaultInterface: ISpeechVoice;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_Status: ISpeechVoiceStatus;
    function Get_Voice: ISpeechObjectToken;
    procedure _Set_Voice(const Voice: ISpeechObjectToken);
    function Get_AudioOutput: ISpeechObjectToken;
    procedure _Set_AudioOutput(const AudioOutput: ISpeechObjectToken);
    function Get_AudioOutputStream: ISpeechBaseStream;
    procedure _Set_AudioOutputStream(const AudioOutputStream: ISpeechBaseStream);
    function Get_Rate: Integer;
    procedure Set_Rate(Rate: Integer);
    function Get_Volume: Integer;
    procedure Set_Volume(Volume: Integer);
    procedure Set_AllowAudioOutputFormatChangesOnNextSet(Allow: WordBool);
    function Get_AllowAudioOutputFormatChangesOnNextSet: WordBool;
    function Get_EventInterests: SpeechVoiceEvents;
    procedure Set_EventInterests(EventInterestFlags: SpeechVoiceEvents);
    procedure Set_Priority(Priority: SpeechVoicePriority);
    function Get_Priority: SpeechVoicePriority;
    procedure Set_AlertBoundary(Boundary: SpeechVoiceEvents);
    function Get_AlertBoundary: SpeechVoiceEvents;
    procedure Set_SynchronousSpeakTimeout(msTimeout: Integer);
    function Get_SynchronousSpeakTimeout: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpeechVoice);
    procedure Disconnect; override;
    function Speak(const Text: WideString; Flags: SpeechVoiceSpeakFlags): Integer;
    function SpeakStream(const Stream: ISpeechBaseStream; Flags: SpeechVoiceSpeakFlags): Integer;
    procedure Pause;
    procedure Resume;
    function Skip(const Type_: WideString; NumItems: Integer): Integer;
    function GetVoices(const RequiredAttributes: WideString; const OptionalAttributes: WideString): ISpeechObjectTokens;
    function GetAudioOutputs(const RequiredAttributes: WideString;
                             const OptionalAttributes: WideString): ISpeechObjectTokens;
    function WaitUntilDone(msTimeout: Integer): WordBool;
    function SpeakCompleteEvent: Integer;
    function IsUISupported(const TypeOfUI: WideString): WordBool; overload;
    function IsUISupported(const TypeOfUI: WideString; const ExtraData: OleVariant): WordBool; overload;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString; const TypeOfUI: WideString); overload;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString; const TypeOfUI: WideString;
                        const ExtraData: OleVariant); overload;
    property DefaultInterface: ISpeechVoice read GetDefaultInterface;
    property Status: ISpeechVoiceStatus read Get_Status;
    property Voice: ISpeechObjectToken read Get_Voice write _Set_Voice;
    property AudioOutput: ISpeechObjectToken read Get_AudioOutput write _Set_AudioOutput;
    property AudioOutputStream: ISpeechBaseStream read Get_AudioOutputStream write _Set_AudioOutputStream;
    property AllowAudioOutputFormatChangesOnNextSet: WordBool read Get_AllowAudioOutputFormatChangesOnNextSet write Set_AllowAudioOutputFormatChangesOnNextSet;
    property Rate: Integer read Get_Rate write Set_Rate;
    property Volume: Integer read Get_Volume write Set_Volume;
    property EventInterests: SpeechVoiceEvents read Get_EventInterests write Set_EventInterests;
    property Priority: SpeechVoicePriority read Get_Priority write Set_Priority;
    property AlertBoundary: SpeechVoiceEvents read Get_AlertBoundary write Set_AlertBoundary;
    property SynchronousSpeakTimeout: Integer read Get_SynchronousSpeakTimeout write Set_SynchronousSpeakTimeout;
  published
    property OnStartStream: TSpVoiceStartStream read FOnStartStream write FOnStartStream;
    property OnEndStream: TSpVoiceEndStream read FOnEndStream write FOnEndStream;
    property OnVoiceChange: TSpVoiceVoiceChange read FOnVoiceChange write FOnVoiceChange;
    property OnBookmark: TSpVoiceBookmark read FOnBookmark write FOnBookmark;
    property OnWord: TSpVoiceWord read FOnWord write FOnWord;
    property OnSentence: TSpVoiceSentence read FOnSentence write FOnSentence;
    property OnPhoneme: TSpVoicePhoneme read FOnPhoneme write FOnPhoneme;
    property OnViseme: TSpVoiceViseme read FOnViseme write FOnViseme;
    property OnAudioLevel: TSpVoiceAudioLevel read FOnAudioLevel write FOnAudioLevel;
    property OnEnginePrivate: TSpVoiceEnginePrivate read FOnEnginePrivate write FOnEnginePrivate;
  end;
{$ENDREGION}

  { Speech }
  Speech = class
  public type
    VoiceAttributeEvent = (vaDescription, vaName, vaVendor, vaAge, vaGender, vaLanguage, vaId);
    WordEvent = procedure(const ASender: Pointer; const AWord, AText: PAnsiChar); cdecl;
  protected type
    TOnWordEvent = record
      Sender: Pointer;
      Handler: WordEvent;
    end;
  protected class var
    FSpVoice: TSpVoice;
    FVoiceList: TInterfaceList;
    FVoiceDescList: TStringList;
    FPaused: Boolean;
    FText: string;
    FWord: string;
    FVoice: Integer;
    FSubList: TDictionary<string, string>;
    FOnWord: TOnWordEvent;
    FVolume: Single;
    class procedure DoOnWord(ASender: TObject; AStreamNumber: Integer; AStreamPosition: OleVariant; ACharacterPosition, ALength: Integer);
    class procedure DoSpeak(AText: string; AFlags: Integer);
    class procedure EnumVoices();
    class procedure FreeVoices();
  public
    class constructor Create();
    class destructor Destroy();
  public
    class procedure SetOnWordEvent(const ASender: Pointer; const AHandler: Speech.WordEvent);
    class function  GetOnWordEvent(): Speech.WordEvent;
    class function  GetVoiceCount(): Integer;
    class function  GetVoiceAttribute(const AIndex: Integer; const AAttribute: VoiceAttributeEvent): string;
    class procedure ChangeVoice(const AIndex: Integer);
    class function  GetVoice(): Integer;
    class procedure SetVolume(const AVolume: Single);
    class function  GetVolume(): Single;
    class procedure SetRate(const ARate: Single);
    class function  GetRate(): Single;
    class procedure Clear();
    class procedure Say(const AText: string; const APurge: Boolean);
    class procedure SayXML(const AText: string; const APurge: Boolean);
    class function  Active(): Boolean;
    class procedure Pause();
    class procedure Resume();
    class procedure Reset();
    class procedure SubstituteWord(const AWord: string; const ASubstituteWord: string);
  end;

  { TJsonHelper }
  TJsonObject = System.Json.TJSONObject;
  TJsonArray = System.Json.TJSONArray;

  TJsonValueType = (jvtString, jvtObject);

  TJsonHelper = class helper for TJsonObject
  private
    function GetBool(AParam: string): Boolean;
    procedure SetBool(AParam: string; const Value: Boolean);
    function GetString(AParam: string): string;
    procedure SetString(AParam: string; const Value: string);
    function GetObject(AName: string): TJsonObject;
    procedure SetObject(AName: string; const Value: TJsonObject);
    function GetArray(AName: string): TJSONArray;
    procedure SetArray(AName: string; const Value: TJSONArray);
    function GetNames(AIndex: integer): string;
    function GetTypes(AName: string): TJsonValueType;
    function GetInteger(AParam: string): integer;
    procedure SetInteger(AParam: string; const Value: integer);
    function GetFloat(AParam: string): Double;
    procedure SetFloat(AParam: string; const Value: Double);

  public
    function Contains(AName: string): Boolean;
    function IsNull(AName: string): Boolean;
    procedure Assign(ASource: TJSONValue);
    procedure FromJSON(AJson: string);

    function AddObject(const AName: string): TJsonObject;
    function AddArray(const AName: string): TJsonArray;

    class function Parse(const AData: string): TJsonObject; overload;
    class function ParseJSONArray(const AJSONArrayStr: string): TJSONArray;

    property Types[AName: string]: TJsonValueType read GetTypes;
    property Names[AIndex: integer]: string read GetNames;
    property B[AParam: string]: Boolean read GetBool write SetBool;
    property S[AParam: string]: string read GetString write SetString;
    property I[AParam: string]: Integer read GetInteger write SetInteger;
    property F[AParam: string]: Double read GetFloat write SetFloat;
    property O[AName: string]: TJsonObject read GetObject write SetObject;
    property A[AName: string]: TJSONArray read GetArray write SetArray;
  end;

  { TVirtualBuffer }
  TVirtualBuffer<T> = class(TCustomMemoryStream)
  protected
    FHandle: THandle;
    FName: string;
    procedure Clear();
    function  GetItem(AIndex: Integer): T;
    procedure SetItem(AIndex: Integer; AValue: T);
  public
    property Item[AIndex: Integer]: T read GetItem write SetItem;
    constructor Create(aSize: Cardinal);
    destructor Destroy(); override;
    function Write(const aBuffer; aCount: Longint): Longint; override;
    function Write(const aBuffer: TBytes; aOffset, aCount: Longint): Longint; override;
    procedure SaveToFile(aFilename: string);
    property Name: string read FName;
    function  Eob(): Boolean;
    function  ReadString(): string;
    class function LoadFromFile(const aFilename: string): TVirtualBuffer<T>;
  end;

  { TMapMemoryToArrayOf }
  TMapMemoryToArrayOf<T> = class(TObject)
  protected
    FMemory: Pointer;
    function  GetItem(AIndex: Integer): T;
    procedure SetItem(AIndex: Integer; AValue: T);
  public
    constructor Create(const AMemory: Pointer);
    destructor Destroy(); override;
    property Item[AIndex: Integer]: T read GetItem write SetItem;
  end;

  { TTokenResponse }

  // AddToken return messages - for TResponse.AddToken
  //  paWait = No new (full) words, just wait for more incoming tokens
  //  Append = Append existing line with latest word
  //  NewLine = start new line then print the latest word
  TTokenPrintAction = (paWait, paAppend, paNewline);

  { TResponse
    Helper to handle incoming tokens during streaming
      Example uses:
      - Tabulate tokens into full words based on wordbreaks
      - Control wordwrap/linechanges for console or custom GUI without wordwrap functionality
        (Does change the print resolution from Token to logical words)
  }
  TTokenResponse = record
  private
    FRaw: string;                  // Full response as is
    FTokens: array of string;      // Actual tokens
    //FLineLengthMax: Integer;       // Define confined space, in chars for fixed width font
    FWordBreaks: array of char;    // What is considered a logical word-break
    FLineBreaks: array of char;    // What is considered a logical line-break
    FWords: array of String;       // Response but as array of "words"
    FWord: string;                // Current word accumulating
    FLine: string;                // Current line accumulating
    FFinalized: Boolean;          // Know the finalization is done
    FRightMargin: Integer;
    function HandleLineBreaks(const AToken: string): Boolean;
    function SplitWord(const AWord: string; var APrefix, ASuffix: string): Boolean;
    function GetLineLengthMax(): Integer;
  public
    class operator Initialize (out ADest: TTokenResponse);
    procedure SetRightMargin(const AMargin: Integer);
    function AddToken(const aToken: string): TTokenPrintAction;
    function LastWord(const ATrimLeft: Boolean=False): string;
    function Finalize: Boolean;
  end;


  { TBaseObject }
  TBaseObject = class
  public
    constructor Create(); virtual;
    destructor Destroy(); override;
    procedure Run(); virtual;
  end;

  TBaseObjectClass = class of TBaseObject;

procedure RunObject(const AObject: TBaseObjectClass);

implementation

var
  FMarshaller: TMarshaller;

{ Console }
class constructor Console.Create();
begin
  // save current console codepage
  FInputCodePage := GetConsoleCP();
  FOutputCodePage := GetConsoleOutputCP();

  // set code page to UTF8
  SetConsoleCP(CP_UTF8);
  SetConsoleOutputCP(CP_UTF8);

  // clear keyboard
  ClearKeyStates();
  ClearKeyboardBuffer();
end;

class destructor Console.Destroy();
begin
  // restore code page
  SetConsoleCP(FInputCodePage);
  SetConsoleOutputCP(FOutputCodePage);
end;

class procedure Console.GetCursorPos(X, Y: PInteger);
var
  hConsole: THandle;
  BufferInfo: TConsoleScreenBufferInfo;
begin
  hConsole := GetStdHandle(STD_OUTPUT_HANDLE);
  if hConsole = INVALID_HANDLE_VALUE then
    Exit;

  if not GetConsoleScreenBufferInfo(hConsole, BufferInfo) then
    Exit;

  if Assigned(X) then
    X^ := BufferInfo.dwCursorPosition.X;
  if Assigned(Y) then
    Y^ := BufferInfo.dwCursorPosition.Y;
end;

class procedure Console.SetCursorPos(const X, Y: Integer);
var
  hConsole: THandle;
  Coord: TCoord;
begin
  hConsole := GetStdHandle(STD_OUTPUT_HANDLE);
  if hConsole = INVALID_HANDLE_VALUE then
    Exit;

  Coord.X := X;
  Coord.Y := Y;
  SetConsoleCursorPosition(hConsole, Coord);
end;

class procedure Console.SetCursorVisible(const AVisible: Boolean);
var
  ConsoleInfo: TConsoleCursorInfo;
  ConsoleHandle: THandle;
begin
  ConsoleHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  ConsoleInfo.dwSize := 25; // You can adjust cursor size if needed
  ConsoleInfo.bVisible := AVisible;
  SetConsoleCursorInfo(ConsoleHandle, ConsoleInfo);
end;

class procedure Console.Clear();
begin
  // Clear the console screen
  Win32Check(ClearScreen(GetStdHandle(STD_OUTPUT_HANDLE)));
end;

class function  Console.ClearScreen(const AConsole: THandle): Boolean;
var
  csbi: TConsoleScreenBufferInfo;
  ConsoleSize: DWORD;
  Coord: TCoord;
  CharsWritten: DWORD;
begin
  Result := False;
  if GetConsoleScreenBufferInfo(AConsole, csbi) then
  begin
    ConsoleSize := csbi.dwSize.X * csbi.dwSize.Y;
    Coord.X := 0;
    Coord.Y := 0;

    if FillConsoleOutputCharacter(AConsole, ' ', ConsoleSize, Coord, CharsWritten) then
      if FillConsoleOutputAttribute(AConsole, csbi.wAttributes, ConsoleSize, Coord, CharsWritten) then
        Result := SetConsoleCursorPosition(AConsole, Coord);
  end;
end;

class procedure Console.SetTextColor(AColor: Word);
var
  LConsoleHandle: THandle;
begin
  LConsoleHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  SetConsoleTextAttribute(LConsoleHandle, AColor);
end;

class procedure Console.ClearLine(AColor: Word);
var
  LConsoleOutput: THandle;
  LConsoleInfo: TConsoleScreenBufferInfo;
  LNumCharsWritten: DWORD;
  LCoord: TCoord;
begin
  LConsoleOutput := GetStdHandle(STD_OUTPUT_HANDLE);

  if GetConsoleScreenBufferInfo(LConsoleOutput, LConsoleInfo) then
  begin
    LCoord.X := 0;
    LCoord.Y := LConsoleInfo.dwCursorPosition.Y;

    SetTextColor(AColor);
    FillConsoleOutputCharacter(LConsoleOutput, ' ', LConsoleInfo.dwSize.X,
      LCoord, LNumCharsWritten);
    SetConsoleCursorPosition(LConsoleOutput, LCoord);
  end;
end;

class procedure Console.ClearLineFromCursor(AColor: Word);
var
  LConsoleOutput: THandle;
  LConsoleInfo: TConsoleScreenBufferInfo;
  LNumCharsWritten: DWORD;
  LCoord: TCoord;
begin
  LConsoleOutput := GetStdHandle(STD_OUTPUT_HANDLE);

  if GetConsoleScreenBufferInfo(LConsoleOutput, LConsoleInfo) then
  begin
    LCoord.X := 0;
    LCoord.Y := LConsoleInfo.dwCursorPosition.Y;

    SetTextColor(AColor);
    FillConsoleOutputCharacter(LConsoleOutput, ' ', LConsoleInfo.dwSize.X
      - LConsoleInfo.dwCursorPosition.X, LCoord, LNumCharsWritten);
    SetConsoleCursorPosition(LConsoleOutput, LCoord);
  end;
end;

class procedure  Console.GetSize(AWidth: PInteger; AHeight: PInteger);
var
  LConsoleInfo: TConsoleScreenBufferInfo;
begin
  GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), LConsoleInfo);
  if Assigned(AWidth) then
    AWidth^ := LConsoleInfo.dwSize.X;

  if Assigned(AHeight) then
  AHeight^ := LConsoleInfo.dwSize.Y;
end;

class procedure Console.SetTitle(const ATitle: string);
begin
  WinApi.Windows.SetConsoleTitle(PChar(ATitle));
end;

class function  Console.HasOutput(): Boolean;
var
  LStdOut: THandle;
  LMode: DWORD;
begin
  LStdOut := GetStdHandle(STD_OUTPUT_HANDLE);
  Result := (LStdOut <> INVALID_HANDLE_VALUE) and GetConsoleMode(LStdOut, LMode);
end;

class function  Console.WasRunFrom(): Boolean;
var
  LStartInfo: TStartupInfo;
begin
  LStartInfo.cb := SizeOf(TStartupInfo);
  GetStartupInfo(LStartInfo);
  Result := ((LStartInfo.dwFlags and STARTF_USESHOWWINDOW) = 0);
end;

class function  Console.IsStartedFromDelphiIDE(): Boolean;
begin
  Result := (GetEnvironmentVariable('BDS') <> '');
end;

class procedure Console.WaitForAnyKey();
var
  LInputRec: TInputRecord;
  LNumRead: Cardinal;
  LOldMode: DWORD;
  LStdIn: THandle;
begin
  LStdIn := GetStdHandle(STD_INPUT_HANDLE);
  GetConsoleMode(LStdIn, LOldMode);
  SetConsoleMode(LStdIn, 0);
  repeat
    ReadConsoleInput(LStdIn, LInputRec, 1, LNumRead);
  until (LInputRec.EventType and KEY_EVENT <> 0) and
    LInputRec.Event.KeyEvent.bKeyDown;
  SetConsoleMode(LStdIn, LOldMode);
end;

class function  Console.AnyKeyPressed(): Boolean;
var
  LNumberOfEvents     : DWORD;
  LBuffer             : TInputRecord;
  LNumberOfEventsRead : DWORD;
  LStdHandle           : THandle;
begin
  Result:=false;
  LStdHandle := GetStdHandle(STD_INPUT_HANDLE);
  LNumberOfEvents:=0;
  GetNumberOfConsoleInputEvents(LStdHandle,LNumberOfEvents);
  if LNumberOfEvents<> 0 then
  begin
    PeekConsoleInput(LStdHandle,LBuffer,1,LNumberOfEventsRead);
    if LNumberOfEventsRead <> 0 then
    begin
      if LBuffer.EventType = KEY_EVENT then
      begin
        if LBuffer.Event.KeyEvent.bKeyDown then
          Result:=true
        else
          FlushConsoleInputBuffer(LStdHandle);
      end
      else
      FlushConsoleInputBuffer(LStdHandle);
    end;
  end;
end;

class procedure Console.ClearKeyStates();
begin
  FillChar(FKeyState, SizeOf(FKeyState), 0);
  ClearKeyboardBuffer;
end;

class function  Console.IsKeyPressed(AKey: Byte): Boolean;
begin
  Result := (GetAsyncKeyState(AKey) and $8000) <> 0;
end;

class function  Console.WasKeyReleased(AKey: Byte): Boolean;
begin
  Result := False;
  if IsKeyPressed(AKey) and (not FKeyState[1, AKey]) then
  begin
    FKeyState[1, AKey] := True;
    Result := True;
  end
  else if (not IsKeyPressed(AKey)) and (FKeyState[1, AKey]) then
  begin
    FKeyState[1, AKey] := False;
    Result := False;
  end;
end;

class function  Console.WasKeyPressed(AKey: Byte): Boolean;
begin
  Result := False;
  if IsKeyPressed(AKey) and (not FKeyState[1, AKey]) then
  begin
    FKeyState[1, AKey] := True;
    Result := False;
  end
  else if (not IsKeyPressed(AKey)) and (FKeyState[1, AKey]) then
  begin
    FKeyState[1, AKey] := False;
    Result := True;
  end;
end;

class procedure Console.Pause(const AForcePause: Boolean; aColor: WORD; const aMsg: string);
var
  LDoPause: Boolean;
begin
  if not HasOutput then Exit;

  ClearKeyboardBuffer;
  ClearKeyStates;

  if not AForcePause then
  begin
    LDoPause := True;
    if WasRunFrom then LDoPause := False;
    if IsStartedFromDelphiIDE then LDoPause := True;
    if not LDoPause then Exit;
  end;

  PrintLn();
  if aMsg.IsEmpty then
    Print('Press any key to continue... ', AColor)
  else
    Print(aMsg, AColor);
  WaitForAnyKey();
  PrintLn();
end;

class procedure Console.ClearKeyboardBuffer();
var
  LInputRecord: TInputRecord;
  LEventsRead: DWORD;
  LMsg: TMsg;
begin
  while PeekConsoleInput(GetStdHandle(STD_INPUT_HANDLE), LInputRecord, 1, LEventsRead) and (LEventsRead > 0) do
  begin
    ReadConsoleInput(GetStdHandle(STD_INPUT_HANDLE), LInputRecord, 1, LEventsRead);
  end;

  while PeekMessage(LMsg, 0, WM_KEYFIRST, WM_KEYLAST, PM_REMOVE) do
  begin
    // No operation; just removing messages from the queue
  end;
end;

class function  Console.ReadKey(): Char;
var
  LInputRecord: TInputRecord;
  LEventsRead: DWORD;
begin
  repeat
    ReadConsoleInput(GetStdHandle(STD_INPUT_HANDLE), LInputRecord, 1, LEventsRead);
  until (LInputRecord.EventType = KEY_EVENT) and LInputRecord.Event.KeyEvent.bKeyDown;
  Result := LInputRecord.Event.KeyEvent.UnicodeChar;
end;

class function  Console.ReadLnX(const AAllowedChars: TSysCharSet; AMaxLength: Integer; const AColor: DWORD): string;
var
  LInputChar: Char;
begin
  Result := '';

  repeat
    LInputChar := ReadKey;

    if CharInSet(LInputChar, AAllowedChars) then
    begin
      if Length(Result) < AMaxLength then
      begin
        if not CharInSet(LInputChar, [#10, #0, #13, #8])  then
        begin
          Print(LInputChar, AColor);
          Result := Result + LInputChar;
        end;
      end;
    end;
    if LInputChar = #8 then
    begin
      if Length(Result) > 0 then
      begin
        Print(#8 + ' ' + #8);
        Delete(Result, Length(Result), 1);
      end;
    end;
  until (LInputChar = #13);

  PrintLn();
end;

class function  Console.WrapTextEx(const ALine: string; AMaxCol: Integer; const ABreakChars: TSysCharSet=[' ', '-', ',', ':', #9]): string;
var
  LText: string;
  LPos: integer;
  LChar: Char;
  LLen: Integer;
  I: Integer;
begin
  LText := ALine.Trim;

  LPos := 0;
  LLen := 0;

  while LPos < LText.Length do
  begin
    Inc(LPos);

    LChar := LText[LPos];

    if LChar = #10 then
    begin
      LLen := 0;
      continue;
    end;

    Inc(LLen);

    if LLen >= AMaxCol then
    begin
      for I := LPos downto 1 do
      begin
        LChar := LText[I];

        if CharInSet(LChar, ABreakChars) then
        begin
          LText.Insert(I, #10);
          Break;
        end;
      end;

      LLen := 0;
    end;
  end;

  Result := LText;
end;

class procedure Console.Print(const AMsg: string; const AArgs: array of const; const AColor: WORD);
begin
  if not HasOutput then Exit;
  SetTextColor(AColor);
  Write(Format(AMsg, AArgs));
  SetTextColor(FG_WHITE);
end;

class procedure Console.Print(const AMsg: string; const AColor: WORD);
begin
  //Print(AMsg, [], AColor);
  if not HasOutput then Exit;
  SetTextColor(AColor);
  Write(AMsg);
  SetTextColor(FG_WHITE);
end;

class procedure Console.PrintLn(const AMsg: string; const AArgs: array of const; const AColor: WORD);
begin
  if not HasOutput then Exit;
  SetTextColor(AColor);
  WriteLn(Format(AMsg, AArgs));
  SetTextColor(FG_WHITE);
end;

class procedure Console.PrintLn(const AMsg: string; const AColor: WORD);
begin
  //PrintLn(AMsg, [], AColor);
  if not HasOutput then Exit;
  SetTextColor(AColor);
  WriteLn(AMsg);
  SetTextColor(FG_WHITE);
end;

class procedure Console.PrintLn();
begin
  PrintLn('');
end;

class procedure Console.Print();
begin
  Print('');
end;

class procedure Console.Teletype(const AText: string; const AColor: WORD; const AMargin: Integer; const AMinDelay: Integer; const AMaxDelay: Integer; const ABreakKey: Byte);
const
  {$J+}
  LDelay: Integer = 0;
  {$J-}
var
  LText: string;
  LMaxCol: Integer;
  LChar: Char;
  LWidth: Integer;
begin
  GetSize(@LWidth, nil);
  //LMaxCol := GetWidth - AMargin;
  LMaxCol := LWidth - AMargin;

  LText := WrapTextEx(AText, LMaxCol);

  for LChar in LText do
  begin
    Utils.ProcessMessages();
    Print(LChar, [], AColor);
    if not Utils.RandomBool then
      LDelay := Utils.RandomRange(AMinDelay, AMaxDelay);
    timeBeginPeriod(0);
    Sleep(LDelay);
    timeBeginPeriod(0);
    if IsKeyPressed(ABreakKey) then
    begin
      ClearKeyboardBuffer;
      Break;
    end;
  end;
end;

{ Utils }
class constructor Utils.Create();
begin
  // turn on memory leak detection
  ReportMemoryLeaksOnShutdown := True;


  // init critical section
  FCriticalSection := TCriticalSection.Create();
end;

class destructor Utils.Destroy();
begin
  // free critical section object
  FCriticalSection.Free();
end;

class function  Utils.AsUTF8(const AText: string): Pointer;
begin
  Result := FMarshaller.AsUtf8(AText).ToPointer;
end;

class function  Utils.GetTempStaticBuffer(): PByte;
begin
  Result := @FTempStaticBuffer[0];
end;

class function  Utils.GetTempStaticBufferSize(): Integer;
begin
  Result := CTempStaticBufferSize;
end;

class function  Utils.ResourceExist(const AInstance: HINST; const AResName: string): Boolean;
begin
  Result := Boolean((FindResource(HInstance, PChar(AResName), RT_RCDATA) <> 0));
end;

class procedure Utils.EnterCriticalSection();
begin
  FCriticalSection.Enter;
end;

class procedure Utils.LeaveCriticalSection();
begin
  FCriticalSection.Leave;
end;

class procedure Utils.SetDefaultIcon(AWindow: HWND);
var
  IconHandle: HICON;
begin
  IconHandle := LoadIcon(HInstance, 'MAINICON');
  if IconHandle <> 0 then
  begin
    SendMessage(aWindow, WM_SETICON, ICON_BIG, IconHandle);
  end;
end;

class function Utils.RemoveDuplicates(const aText: string): string;
var
  i, l: integer;
begin
  Result := '';
  l := Length(aText);
  for i := 1 to l do
  begin
    if (Pos(aText[i], result) = 0) then
    begin
      result := result + aText[i];
    end;
  end;
end;

class function  Utils.HudTextItem(const AKey: string; const AValue: string; const APaddingWidth: Cardinal=20; const ASeperator: string='-'): string;
begin
  Result := Format('%s %s %s', [aKey.PadRight(APaddingWidth), aSeperator, aValue]);
end;

class procedure Utils.GotoURL(const AURL: string);
begin
  if AURL.IsEmpty then Exit;
  ShellExecute(0, 'OPEN', PChar(AURL), '', '', SW_SHOWNORMAL);
end;

class function  Utils.GetComputerName(): string;
var
  LLength: dword;
begin
  LLength := 253;
  SetLength(Result, LLength+1);
  if not WinApi.Windows.GetComputerName(PChar(Result), LLength) then Result := 'Not detected!';
  Result := PChar(result);
end;

class function  Utils.GetLoggedUserName(): string;
const
  cnMaxUserNameLen = 254;
var
  sUserName     : string;
  dwUserNameLen : DWord;
begin
  dwUserNameLen := cnMaxUserNameLen-1;
  SetLength( sUserName, cnMaxUserNameLen );
  GetUserName(PChar( sUserName ),dwUserNameLen );
  SetLength( sUserName, dwUserNameLen );
  Result := sUserName;
end;

class function  Utils.GetOSVersion(): string;
begin
  Result := TOSVersion.ToString;
end;

class function  Utils.GetNow(): string;
begin
  Result := DateTimeToStr(Now());
end;

class procedure Utils.GetDiskFreeSpace(const APath: string; var AFreeSpace: Int64; var ATotalSpace: Int64);
begin
  GetDiskFreeSpaceEx(PChar(aPath), aFreeSpace, aTotalSpace, nil);
end;

class procedure Utils.GetMemoryFree(var AAvailMem: UInt64; var ATotalMem: UInt64);
var
  LMemStatus: MemoryStatusEx;
begin
 FillChar (LMemStatus, SizeOf(MemoryStatusEx), #0);
 LMemStatus.dwLength := SizeOf(MemoryStatusEx);
 GlobalMemoryStatusEx (LMemStatus);
 aAvailMem := LMemStatus.ullAvailPhys;
 aTotalMem := LMemStatus.ullTotalPhys;
end;

class function  Utils.GetVideoCardName(): string;
const
  WbemUser = '';
  WbemPassword = '';
  WbemComputer = 'localhost';
  wbemFlagForwardOnly = $00000020;
var
  LFSWbemLocator: OLEVariant;
  LFWMIService: OLEVariant;
  LFWbemObjectSet: OLEVariant;
  LFWbemObject: OLEVariant;
  LEnum: IEnumvariant;
  LValue: LongWord;
begin;
  try
    LFSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
    LFWMIService := LFSWbemLocator.ConnectServer(WbemComputer, 'root\CIMV2',
      WbemUser, WbemPassword);
    LFWbemObjectSet := LFWMIService.ExecQuery
      ('SELECT Name,PNPDeviceID  FROM Win32_VideoController', 'WQL',
      wbemFlagForwardOnly);
    LEnum := IUnknown(LFWbemObjectSet._NewEnum) as IEnumvariant;
    while LEnum.Next(1, LFWbemObject, LValue) = 0 do
    begin
      result := String(LFWbemObject.Name);
      LFWbemObject := Unassigned;
    end;
  except
  end;
end;

class function  Utils.GetAppName(): string;
begin
  Result := Format('%s %s',[TPath.GetFileNameWithoutExtension(ParamStr(0)),GetAppVersionFullStr]);
end;

class function  Utils.GetAppPath(): string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

class function  Utils.GetCPUCount(): Integer;
begin
  Result := CPUCount;
end;

class function  Utils.GetAppVersionStr(): string;
var
  LRec: LongRec;
  LVer : Cardinal;
begin
  LVer := GetFileVersion(ParamStr(0));
  if LVer <> Cardinal(-1) then
  begin
    LRec := LongRec(LVer);
    Result := Format('%d.%d', [LRec.Hi, LRec.Lo]);
  end
  else Result := '';
end;

class function  Utils.GetAppVersionFullStr(): string;
begin
  GetModuleVersionFullStr(ParamStr(0));
end;

const
  GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS = $00000004;
  GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT = $00000002;

function GetModuleHandleEx(dwFlags: DWORD; lpModuleName: LPCSTR; var phModule: HMODULE): BOOL; stdcall; external 'kernel32.dll' name 'GetModuleHandleExA';

function GetCurrentDLLFilename: string;
var
  ModuleName: array[0..MAX_PATH] of Char;
  ModuleHandle: HMODULE;
begin
  ModuleHandle := 0;
  if GetModuleHandleEx(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS or GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, @GetCurrentDLLFilename, ModuleHandle) then
  begin
    if GetModuleFileName(ModuleHandle, ModuleName, SizeOf(ModuleName)) > 0 then
      Result := ModuleName
    else
      Result := '';
    FreeLibrary(ModuleHandle);  // Decrement the reference count
  end
  else
    Result := '';
end;

class function  Utils.GetModuleVersionFullStr(): string;
begin
  Result := GetModuleVersionFullStr(GetCurrentDLLFilename());
end;

class function  Utils.GetModuleVersionFullStr(AFilename: string): string;
var
  LExe: string;
  LSize, LHandle: DWORD;
  LBuffer: TBytes;
  LFixedPtr: PVSFixedFileInfo;
begin
  Result := '';
  if not TFile.Exists(aFilename) then Exit;
  LExe := aFilename;
  LSize := GetFileVersionInfoSize(PChar(LExe), LHandle);
  if LSize = 0 then
  begin
    //RaiseLastOSError;
    //no version info in file
    Exit;
  end;
  SetLength(LBuffer, LSize);
  if not GetFileVersionInfo(PChar(LExe), LHandle, LSize, LBuffer) then
    RaiseLastOSError;
  if not VerQueryValue(LBuffer, '\', Pointer(LFixedPtr), LSize) then
    RaiseLastOSError;

  (*
  if (LongRec(LFixedPtr.dwFileVersionLS).Hi = 0) and (LongRec(LFixedPtr.dwFileVersionLS).Lo = 0) then
  begin
    Result := Format('%d.%d',
    [LongRec(LFixedPtr.dwFileVersionMS).Hi,   //major
     LongRec(LFixedPtr.dwFileVersionMS).Lo]); //minor
  end
  else if (LongRec(LFixedPtr.dwFileVersionLS).Lo = 0) then
  begin
    Result := Format('%d.%d.%d',
    [LongRec(LFixedPtr.dwFileVersionMS).Hi,   //major
     LongRec(LFixedPtr.dwFileVersionMS).Lo,   //minor
     LongRec(LFixedPtr.dwFileVersionLS).Hi]); //release
  end
  else
  begin
    Result := Format('%d.%d.%d.%d',
    [LongRec(LFixedPtr.dwFileVersionMS).Hi,   //major
     LongRec(LFixedPtr.dwFileVersionMS).Lo,   //minor
     LongRec(LFixedPtr.dwFileVersionLS).Hi,   //release
     LongRec(LFixedPtr.dwFileVersionLS).Lo]); //build
  end;
  *)

  Result := Format('%d.%d.%d',
  [LongRec(LFixedPtr.dwFileVersionMS).Hi,   //major
   LongRec(LFixedPtr.dwFileVersionMS).Lo,   //minor
   LongRec(LFixedPtr.dwFileVersionLS).Hi]); //release
end;

class function  Utils.HttpGet(const aURL: string; const aStatus: PString=nil): string;
var
  LHttp: THTTPClient;
  LResponse: IHTTPResponse;
begin
  LHttp := THTTPClient.Create;
  try
    LResponse := LHttp.Get(aURL);
    Result := LResponse.ContentAsString;
    if Assigned(aStatus) then
      aStatus^ := LResponse.StatusText;
  finally
    LHttp.Free();
  end;
end;

class function  Utils.RemoveQuotes(const AText: string): string;
var
  S: string;
begin
  S := AnsiDequotedStr(aText, '"');
  Result := AnsiDequotedStr(S, '''');
end;

class function Utils.GetEnvVarValue(const AVarName: string): string;
var
  LBufSize: Integer;
begin
  LBufSize := GetEnvironmentVariable(PChar(AVarName), nil, 0);
  if LBufSize > 0 then
    begin
      SetLength(Result, LBufSize - 1);
      GetEnvironmentVariable(PChar(AVarName), PChar(Result), LBufSize);
    end
  else
    Result := '';
end;

function _RandomRange(const aFrom, aTo: Integer): Integer;
var
  LFrom: Integer;
  LTo: Integer;
begin
  LFrom := aFrom;
  LTo := aTo;

  if AFrom > ATo then
    Result := Random(LFrom - LTo) + ATo
  else
    Result := Random(LTo - LFrom) + AFrom;
end;

class function  Utils.RandomRange(const AMin, AMax: Integer): Integer;
begin
  Result := _RandomRange(AMin, AMax + 1);
end;

class function  Utils.RandomRangef(const AMin, AMax: Single): Single;
var
  LNum: Single;
begin
  LNum := _RandomRange(0, MaxInt) / MaxInt;
  Result := AMin + (LNum * (AMax - AMin));
end;

class function  Utils.RandomBool(): Boolean;
begin
  Result := Boolean(RandomRange(0, 2) = 1);
end;

class function  Utils.UnitToScalarValue(const AValue, AMaxValue: Double): Double;
var
  LGain: Double;
  LFactor: Double;
  LVolume: Double;
begin
  LGain := (EnsureRange(AValue, 0.0, 1.0) * 50) - 50;
  LFactor := Power(10, LGain * 0.05);
  LVolume := EnsureRange(AMaxValue * LFactor, 0, AMaxValue);
  Result := LVolume;
end;

class procedure Utils.ProcessMessages();
var
  LMsg: TMsg;
begin
  while Integer(PeekMessage(LMsg, 0, 0, 0, PM_REMOVE)) <> 0 do
  begin
    TranslateMessage(LMsg);
    DispatchMessage(LMsg);
  end;
end;

class function Utils.GetPhysicalProcessorCount: DWORD;
var
  BufferSize: DWORD;
  Buffer: PSYSTEM_LOGICAL_PROCESSOR_INFORMATION;
  ProcessorInfo: PSYSTEM_LOGICAL_PROCESSOR_INFORMATION;
  Offset: DWORD;
begin
  Result := 0;
  BufferSize := 0;

  // Call GetLogicalProcessorInformation with buffer size set to 0 to get required buffer size
  if not GetLogicalProcessorInformation(nil, BufferSize) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) then
  begin
    // Allocate buffer
    GetMem(Buffer, BufferSize);
    try
      // Call GetLogicalProcessorInformation again with allocated buffer
      if GetLogicalProcessorInformation(Buffer, BufferSize) then
      begin
        ProcessorInfo := Buffer;
        Offset := 0;

        // Loop through processor information to count physical processors
        while Offset + SizeOf(SYSTEM_LOGICAL_PROCESSOR_INFORMATION) <= BufferSize do
        begin
          if ProcessorInfo.Relationship = RelationProcessorCore then
            Inc(Result);

          Inc(ProcessorInfo);
          Inc(Offset, SizeOf(SYSTEM_LOGICAL_PROCESSOR_INFORMATION));
        end;
      end;
    finally
      FreeMem(Buffer);
    end;
  end;
end;

class function  Utils.SanitizeToJson(const aText: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(aText) do
  begin
    case aText[i] of
      '\': Result := Result + '\\';
      '"': Result := Result + '\"';
      '/': Result := Result + '\/';
      #8:  Result := Result + '\b';
      #9:  Result := Result + '\t';
      #10: Result := Result + '\n';
      #12: Result := Result + '\f';
      #13: Result := Result + '\r';
      else
        Result := Result + aText[i];
    end;
  end;
  Result := Result;
end;

class function  Utils.SanitizeFromJson(const aText: string): string;
var
  LText: string;
begin
  LText := aText;
  LText := LText.Replace('\n', #10);
  LText := LText.Replace('\r', #13);
  LText := LText.Replace('\b', #8);
  LText := LText.Replace('\t', #9);
  LText := LText.Replace('\f', #12);
  LText := LText.Replace('\/', '/');
  LText := LText.Replace('\"', '"');
  LText := LText.Replace('\\', '\');
  Result := LText;
end;

class function Utils.ExcludeLeadingURLDelimiter(const S: string): string;
begin
  Result := S;
  while (Length(Result) > 0) and (Result[1] = '/') do
    Delete(Result, 1, 1);
end;

class function Utils.IncludeTrailingURLDelimiter(const S: string): string;
begin
  Result := S;
  if (Length(Result) > 0) and (Result[Length(Result)] <> '/') then
    Result := Result + '/';
end;

class function Utils.CombineURL(const BaseURL, RelativeURL: string): string;
begin
  // Remove trailing slashes from BaseURL and leading slashes from RelativeURL
  Result := IncludeTrailingURLDelimiter(BaseURL) + ExcludeLeadingURLDelimiter(RelativeURL);
end;

class function Utils.SecBetween(const ANow, AThen: TDateTime): Double;
begin
  Result := Abs(DateTimeToMilliseconds(ANow) - DateTimeToMilliseconds(AThen)) / (MSecsPerSec);
end;

class function Utils.TimeDifference(ANow, AThen: TDateTime): Double;
var
  SecondsDiff: Double;
begin
  SecondsDiff := SecBetween(ANow, AThen); // Requires DateUtils unit
  if SecondsDiff < 60 then
    Result := SecondsDiff
  else
    Result := SecondsDiff / 60; // Convert to minutes
end;

class function Utils.FormatSeconds(const ASeconds: Single): string;
begin
  if ASeconds < 60 then
    Result := Format('%3.1fs', [ASeconds])
  else
    Result := Format('%3.1fm', [ASeconds / 60]);
end;

class function Utils.MinutesToMilliseconds(const AMinutes: Double): Int64;
begin
  Result := Round(AMinutes * 60000);
end;

class function Utils.ReplaceString(const ASource, ASubStr, AReplaceStr: string; N: Integer): string;
var
  LPosEx, LPosStart, LCount: Integer;
begin
  Result := ASource;
  LCount := 0;
  LPosStart := 1;
  repeat
    LPosEx := PosEx(ASubStr, Result, LPosStart);
    if LPosEx > 0 then
    begin
      Inc(LCount);
      if LCount = N then
      begin
        Delete(Result, LPosEx, Length(ASubStr));
        Insert(AReplaceStr, Result, LPosEx);
        Break;
      end;
      LPosStart := LPosEx + Length(ASubStr);
    end;
  until LPosEx = 0;
end;

class function Utils.ContainsText(const AText, ASubText: string): Boolean;
begin
  Result := Pos(UpperCase(ASubText), UpperCase(AText)) > 0;
end;

class function Utils.ReplaceFirstFoundWord(const AText, AWord: string; AReplaceChar: Char): string;
var
  LStartPos: Integer;
  LReplacement: string;
begin
  // Find the position of the first occurrence of AWord in AText
  LStartPos := Pos(AWord, AText);

  // If the word is found
  if LStartPos > 0 then
  begin
    // Create a replacement string of ^ characters with the same length as AWord
    LReplacement := StringOfChar(AReplaceChar, Length(AWord));
    // Replace the first occurrence of AWord with the replacement string
    Result := AText;
    Delete(Result, LStartPos, Length(AWord));
    Insert(LReplacement, Result, LStartPos);
  end
  else
  begin
    // If the word is not found, return the original text
    Result := AText;
  end;
end;


{ Async }
constructor TAsyncThread.Create();
begin
  inherited Create(True);

  FTask := nil;
  FWait := nil;
  FFinished := False;
end;

destructor TAsyncThread.Destroy();
begin
  inherited;
end;

procedure TAsyncThread.Execute();
begin
  FFinished := False;

  if Assigned(FTask) then
  begin
    FTask();
  end;

  FFinished := True;
end;

class constructor Async.Create();
begin
  FQueue := TList<TAsyncThread>.Create;
  FBusy := TDictionary<string, TBusyData>.Create;
end;

class destructor Async.Destroy();
begin
  FBusy.Free();
  FQueue.Free();
end;

class procedure Async.Clear();
begin
  FBusy.Clear();
  FQueue.Clear();
end;

class procedure Async.Process();
var
  LAsyncThread: TAsyncThread;
  LAsyncThread2: TAsyncThread;
  LIndex: TBusyData;
  LBusy: TBusyData;
begin
  Enter();

  if TThread.CurrentThread.ThreadID = MainThreadID then
  begin
    for LAsyncThread in FQueue do
    begin
      if Assigned(LAsyncThread) then
      begin
        if LAsyncThread.Finished then
        begin
          LAsyncThread.WaitFor();
          LAsyncThread.WaitProc();
          FQueue.Remove(LAsyncThread);
          for LIndex in FBusy.Values do
          begin
            if Lindex.Thread = LAsyncThread then
            begin
              LBusy := LIndex;
              LBusy.Flag := False;
              FBusy.AddOrSetValue(LBusy.Name, LBusy);
              Break;
            end;
          end;
          LAsyncThread2 := LAsyncThread;
          FreeAndNil(LAsyncThread2);
        end;
      end;
    end;
    FQueue.Pack;
  end;

  Leave();
end;

class procedure Async.Run(const AName: string; const ABackgroundTask: TAsyncProc; const AWaitForgroundTask: TAsyncProc);
var
  LAsyncThread: TAsyncThread;
  LBusy: TBusyData;
begin
  if not Assigned(ABackgroundTask) then Exit;
  if not Assigned(AWaitForgroundTask) then Exit;
  if AName.IsEmpty then Exit;
  if Busy(AName) then Exit;
  Enter;
  LAsyncThread := TAsyncThread.Create;
  LAsyncThread.TaskProc := ABackgroundTask;
  LAsyncThread.WaitProc := AWaitForgroundTask;
  FQueue.Add(LAsyncThread);
  LBusy.Name := AName;
  LBusy.Thread := LAsyncThread;
  LBusy.Flag := True;
  FBusy.AddOrSetValue(AName, LBusy);
  LAsyncThread.Start;
  Leave;
end;

class function  Async.Busy(const AName: string): Boolean;
var
  LBusy: TBusyData;
begin
  Result := False;
  if AName.IsEmpty then Exit;
  Enter;
  FBusy.TryGetValue(AName, LBusy);
  Leave;
  Result := LBusy.Flag;
end;

class procedure Async.Suspend();
var
  LAsyncThread: TAsyncThread;
begin
  for LAsyncThread in FQueue do
  begin
    if not LAsyncThread.Suspended then
      LAsyncThread.Suspend;
  end;
end;

class procedure Async.Resume();
var
  LAsyncThread: TAsyncThread;
begin
  for LAsyncThread in FQueue do
  begin
    if LAsyncThread.Suspended then
      LAsyncThread.Resume;
  end;
end;

class procedure Async.Enter();
begin
  Utils.EnterCriticalSection();
end;

class procedure Async.Leave();
begin
  Utils.LeaveCriticalSection();
end;

{ TTimer }
class operator TTimer.Initialize (out ADest: TTimer);
begin
  ADest.FLastTime := 0;
  ADest.FInterval := 0;
  ADest.FSpeed := 0;
end;

function TTimer.glfwGetTime: Double;
begin
  Result := Now * MSecsPerDay / 1000;
end;

procedure TTimer.InitMS(const AValue: Double);
begin
  FInterval := AValue / 1000.0; // convert milliseconds to seconds
  FLastTime := glfwGetTime;
  FSpeed := AValue;
end;

procedure TTimer.InitFPS(const AValue: Double);
begin
  if AValue > 0 then
    FInterval := 1.0 / AValue
  else
    FInterval := 0; // Prevent division by zero if FPS is not positive
  FLastTime := glfwGetTime;
  FSpeed := AValue;
end;

function TTimer.Check(): Boolean;
begin
  Result := (glfwGetTime - FLastTime) >= FInterval;
  if Result then
    FLastTime := glfwGetTime; // Auto-reset on check
end;

procedure TTimer.Reset();
begin
  FLastTime := glfwGetTime;
end;

function  TTimer.Speed(): Double;
begin
  Result := FSpeed;
end;

{$REGION ' SpeechLib '}
{ TSpVoice }
procedure TSpVoice.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{96749377-3391-11D2-9EE3-00C04F797396}';
    IntfIID:   '{269316D8-57BD-11D2-9EEE-00C04F797396}';
    EventIID:  '{A372ACD1-3BEF-4BBD-8FFB-CB3E2B416AF8}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpVoice.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as ISpeechVoice;
  end;
end;

procedure TSpVoice.ConnectTo(svrIntf: ISpeechVoice);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TSpVoice.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TSpVoice.GetDefaultInterface: ISpeechVoice;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSpVoice.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSpVoice.Destroy;
begin
  inherited Destroy;
end;

procedure TSpVoice.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnStartStream) then
         FOnStartStream(Self,
                        Params[0] {Integer},
                        Params[1] {OleVariant});
    2: if Assigned(FOnEndStream) then
         FOnEndStream(Self,
                      Params[0] {Integer},
                      Params[1] {OleVariant});
    3: if Assigned(FOnVoiceChange) then
         FOnVoiceChange(Self,
                        Params[0] {Integer},
                        Params[1] {OleVariant},
                        IUnknown(TVarData(Params[2]).VPointer) as ISpeechObjectToken {const ISpeechObjectToken});
    4: if Assigned(FOnBookmark) then
         FOnBookmark(Self,
                     Params[0] {Integer},
                     Params[1] {OleVariant},
                     Params[2] {const WideString},
                     Params[3] {Integer});
    5: if Assigned(FOnWord) then
         FOnWord(Self,
                 Params[0] {Integer},
                 Params[1] {OleVariant},
                 Params[2] {Integer},
                 Params[3] {Integer});
    7: if Assigned(FOnSentence) then
         FOnSentence(Self,
                     Params[0] {Integer},
                     Params[1] {OleVariant},
                     Params[2] {Integer},
                     Params[3] {Integer});
    6: if Assigned(FOnPhoneme) then
         FOnPhoneme(Self,
                    Params[0] {Integer},
                    Params[1] {OleVariant},
                    Params[2] {Integer},
                    Params[3] {Smallint},
                    Params[4] {SpeechVisemeFeature},
                    Params[5] {Smallint});
    8: if Assigned(FOnViseme) then
         FOnViseme(Self,
                   Params[0] {Integer},
                   Params[1] {OleVariant},
                   Params[2] {Integer},
                   Params[3] {SpeechVisemeType},
                   Params[4] {SpeechVisemeFeature},
                   Params[5] {SpeechVisemeType});
    9: if Assigned(FOnAudioLevel) then
         FOnAudioLevel(Self,
                       Params[0] {Integer},
                       Params[1] {OleVariant},
                       Params[2] {Integer});
    10: if Assigned(FOnEnginePrivate) then
         FOnEnginePrivate(Self,
                          Params[0] {Integer},
                          Params[1] {Integer},
                          Params[2] {OleVariant});
  end; {case DispID}
end;

function TSpVoice.Get_Status: ISpeechVoiceStatus;
begin
  Result := DefaultInterface.Status;
end;

function TSpVoice.Get_Voice: ISpeechObjectToken;
begin
  Result := DefaultInterface.Voice;
end;

procedure TSpVoice._Set_Voice(const Voice: ISpeechObjectToken);
begin
  DefaultInterface.Voice := Voice;
end;

function TSpVoice.Get_AudioOutput: ISpeechObjectToken;
begin
  Result := DefaultInterface.AudioOutput;
end;

procedure TSpVoice._Set_AudioOutput(const AudioOutput: ISpeechObjectToken);
begin
  DefaultInterface.AudioOutput := AudioOutput;
end;

function TSpVoice.Get_AudioOutputStream: ISpeechBaseStream;
begin
  Result := DefaultInterface.AudioOutputStream;
end;

procedure TSpVoice._Set_AudioOutputStream(const AudioOutputStream: ISpeechBaseStream);
begin
  DefaultInterface.AudioOutputStream := AudioOutputStream;
end;

function TSpVoice.Get_Rate: Integer;
begin
  Result := DefaultInterface.Rate;
end;

procedure TSpVoice.Set_Rate(Rate: Integer);
begin
  DefaultInterface.Rate := Rate;
end;

function TSpVoice.Get_Volume: Integer;
begin
  Result := DefaultInterface.Volume;
end;

procedure TSpVoice.Set_Volume(Volume: Integer);
begin
  DefaultInterface.Volume := Volume;
end;

procedure TSpVoice.Set_AllowAudioOutputFormatChangesOnNextSet(Allow: WordBool);
begin
  DefaultInterface.AllowAudioOutputFormatChangesOnNextSet := Allow;
end;

function TSpVoice.Get_AllowAudioOutputFormatChangesOnNextSet: WordBool;
begin
  Result := DefaultInterface.AllowAudioOutputFormatChangesOnNextSet;
end;

function TSpVoice.Get_EventInterests: SpeechVoiceEvents;
begin
  Result := DefaultInterface.EventInterests;
end;

procedure TSpVoice.Set_EventInterests(EventInterestFlags: SpeechVoiceEvents);
begin
  DefaultInterface.EventInterests := EventInterestFlags;
end;

procedure TSpVoice.Set_Priority(Priority: SpeechVoicePriority);
begin
  DefaultInterface.Priority := Priority;
end;

function TSpVoice.Get_Priority: SpeechVoicePriority;
begin
  Result := DefaultInterface.Priority;
end;

procedure TSpVoice.Set_AlertBoundary(Boundary: SpeechVoiceEvents);
begin
  DefaultInterface.AlertBoundary := Boundary;
end;

function TSpVoice.Get_AlertBoundary: SpeechVoiceEvents;
begin
  Result := DefaultInterface.AlertBoundary;
end;

procedure TSpVoice.Set_SynchronousSpeakTimeout(msTimeout: Integer);
begin
  DefaultInterface.SynchronousSpeakTimeout := msTimeout;
end;

function TSpVoice.Get_SynchronousSpeakTimeout: Integer;
begin
  Result := DefaultInterface.SynchronousSpeakTimeout;
end;

function TSpVoice.Speak(const Text: WideString; Flags: SpeechVoiceSpeakFlags): Integer;
begin
  Result := DefaultInterface.Speak(Text, Flags);
end;

function TSpVoice.SpeakStream(const Stream: ISpeechBaseStream; Flags: SpeechVoiceSpeakFlags): Integer;
begin
  Result := DefaultInterface.SpeakStream(Stream, Flags);
end;

procedure TSpVoice.Pause;
begin
  DefaultInterface.Pause;
end;

procedure TSpVoice.Resume;
begin
  DefaultInterface.Resume;
end;

function TSpVoice.Skip(const Type_: WideString; NumItems: Integer): Integer;
begin
  Result := DefaultInterface.Skip(Type_, NumItems);
end;

function TSpVoice.GetVoices(const RequiredAttributes: WideString;
                            const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.GetVoices(RequiredAttributes, OptionalAttributes);
end;

function TSpVoice.GetAudioOutputs(const RequiredAttributes: WideString;
                                  const OptionalAttributes: WideString): ISpeechObjectTokens;
begin
  Result := DefaultInterface.GetAudioOutputs(RequiredAttributes, OptionalAttributes);
end;

function TSpVoice.WaitUntilDone(msTimeout: Integer): WordBool;
begin
  Result := DefaultInterface.WaitUntilDone(msTimeout);
end;

function TSpVoice.SpeakCompleteEvent: Integer;
begin
  Result := DefaultInterface.SpeakCompleteEvent;
end;

function TSpVoice.IsUISupported(const TypeOfUI: WideString): WordBool;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.IsUISupported(TypeOfUI, EmptyParam);
end;

function TSpVoice.IsUISupported(const TypeOfUI: WideString; const ExtraData: OleVariant): WordBool;
begin
  Result := DefaultInterface.IsUISupported(TypeOfUI, ExtraData);
end;

procedure TSpVoice.DisplayUI(hWndParent: Integer; const Title: WideString;
                             const TypeOfUI: WideString);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.DisplayUI(hWndParent, Title, TypeOfUI, EmptyParam);
end;

procedure TSpVoice.DisplayUI(hWndParent: Integer; const Title: WideString;
                             const TypeOfUI: WideString; const ExtraData: OleVariant);
begin
  DefaultInterface.DisplayUI(hWndParent, Title, TypeOfUI, ExtraData);
end;
{$ENDREGION}

{  Speech }
class procedure Speech.DoOnWord(ASender: TObject; AStreamNumber: Integer; AStreamPosition: OleVariant; ACharacterPosition, ALength: Integer);
var
  LWord: string;
begin
  if FText.IsEmpty then Exit;
  LWord := FText.Substring(ACharacterPosition, ALength);
  if not FSubList.TryGetValue(LWord, FWord) then
    FWord := LWord;
  if Assigned(FOnWord.Handler) then
  begin
    FOnWord.Handler(FOnWord.Sender, Utils.AsUTF8(FWord), Utils.AsUTF8(FText));
  end;
end;

class procedure Speech.DoSpeak(AText: string; AFlags: Integer);
begin
  if FSpVoice = nil then Exit;
  if AText.IsEmpty then Exit;
  if FPaused then Resume;
  FSpVoice.Speak(AText, AFlags);
  FText := AText;
end;

class procedure Speech.EnumVoices;
var
  LI: Integer;
  LSOToken: ISpeechObjectToken;
  LSOTokens: ISpeechObjectTokens;
begin
  FVoiceList := TInterfaceList.Create;
  FVoiceDescList := TStringList.Create;
  LSOTokens := FSpVoice.GetVoices('', '');
  for LI := 0 to LSOTokens.Count - 1 do
  begin
    LSOToken := LSOTokens.Item(LI);
    FVoiceDescList.Add(LSOToken.GetDescription(0));
    FVoiceList.Add(LSOToken);
  end;
end;

class procedure Speech.FreeVoices;
begin
  FreeAndNil(FVoiceDescList);
  FreeAndNil(FVoiceList);
end;

class constructor Speech.Create;
begin
  CoInitialize(nil);
  inherited;
  FPaused := False;
  FText := '';
  FWord := '';
  FVoice := 0;
  FSpVoice := TSpVoice.Create(nil);
  FSpVoice.EventInterests := SVEAllEvents;
  EnumVoices;
  //FSpVoice.OnStartStream := OnStartStream;
  FSpVoice.OnWord := DoOnWord;
  FSubList := TDictionary<string, string>.Create;
  FVolume := 1;
end;

class destructor Speech.Destroy;
begin
  FreeVoices();
  FreeAndNil(FSubList);
  FreeAndNil(FSpVoice);
  inherited;
  CoUninitialize();
end;

class procedure Speech.SetOnWordEvent(const ASender: Pointer; const AHandler: Speech.WordEvent);
begin
  FOnWord.Sender := ASender;
  FOnWord.Handler := AHandler;
end;

class function  Speech.GetOnWordEvent(): Speech.WordEvent;
begin
  Result := FOnWord.Handler;
end;

class function Speech.GetVoiceCount: Integer;
begin
  Result := FVoiceList.Count;
end;

class function Speech.GetVoiceAttribute(const AIndex: Integer; const AAttribute: VoiceAttributeEvent): string;
var
  LSOToken: ISpeechObjectToken;

  function GetAttr(const aItem: string): string;
  begin
    if aItem = 'Id' then
      Result := LSOToken.Id
    else
      Result := LSOToken.GetAttribute(aItem);
  end;

begin
  Result := '';
  if (AIndex < 0) or (AIndex > FVoiceList.Count - 1) then
    Exit;
  LSOToken := ISpeechObjectToken(FVoiceList.Items[AIndex]);
  case AAttribute of
    vaDescription:
      Result := FVoiceDescList[AIndex];
    vaName:
      Result := GetAttr('Name');
    vaVendor:
      Result := GetAttr('Vendor');
    vaAge:
      Result := GetAttr('Age');
    vaGender:
      Result := GetAttr('Gender');
    vaLanguage:
      Result := GetAttr('Language');
    vaId:
      Result := GetAttr('Id');
  end;
end;

class procedure Speech.ChangeVoice(const AIndex: Integer);
var
  LSOToken: ISpeechObjectToken;
begin
  if (AIndex < 0) or (AIndex > FVoiceList.Count - 1) then Exit;
  if AIndex = FVoice then Exit;
  LSOToken := ISpeechObjectToken(FVoiceList.Items[AIndex]);
  FSpVoice.Voice := LSOToken;
  FVoice := AIndex;
end;

class function Speech.GetVoice: Integer;
begin
  Result := FVoice;
end;

class procedure Speech.SetVolume(const AVolume: Single);
begin
  if FSpVoice = nil then   Exit;
  FVolume := EnsureRange(AVolume, 0, 1);
  FSpVoice.Volume := Round(Utils.UnitToScalarValue(FVolume, 100));
end;

class function Speech.GetVolume: Single;
begin
  Result := 0;
  if FSpVoice = nil then Exit;
  Result := FVolume;
end;

class procedure Speech.SetRate(const ARate: Single);
var
  LVolume: Integer;
  LRate: Single;
begin
  if FSpVoice = nil then Exit;

  LRate := EnsureRange(ARate, 0, 1);

  LVolume := Round(20.0 * LRate) - 10;

  if LVolume < -10 then
    LVolume := -10
  else if LVolume > 10 then
    LVolume := 10;

  FSpVoice.Rate := LVolume;
end;

class function Speech.GetRate: Single;
begin
  Result := 0;
  if FSpVoice = nil then Exit;
  Result := (FSpVoice.Rate + 10.0) / 20.0;
end;

class procedure Speech.Say(const AText: string; const APurge: Boolean);
var
  LFlag: Integer;
  LText: string;
begin
  LFlag := SVSFlagsAsync;
  LText := AText;
  if APurge then
    LFlag := LFlag or SVSFPurgeBeforeSpeak;
  DoSpeak(LText, LFlag);
end;

class procedure Speech.SayXML(const AText: string; const APurge: Boolean);
var
  LFlag: Integer;
  LText: string;
begin
  LFlag := SVSFlagsAsync or SVSFIsXML;
  if APurge then
    LFlag := LFlag or SVSFPurgeBeforeSpeak;
  LText := AText;
  DoSpeak(AText, LFlag);
end;

class procedure Speech.Clear();
begin
  if FSpVoice = nil then Exit;
  if Active then
  begin
    FSpVoice.Skip('Sentence', MaxInt);
    Say(' ', True);
  end;
  FText := '';
end;

class function Speech.Active(): Boolean;
begin
  Result := False;
  if FSpVoice = nil then Exit;
  Result := Boolean(FSpVoice.Status.RunningState <> SRSEDone);
end;

class procedure Speech.Pause();
begin
  if FSpVoice = nil then Exit;
  FSpVoice.Pause;
  FPaused := True;
end;

class procedure Speech.Resume();
begin
  if FSpVoice = nil then Exit;
  FSpVoice.Resume;
  FPaused := False;
end;

class procedure Speech.Reset();
begin
  Clear;
  FreeAndNil(FSpVoice);
  FPaused := False;
  FText := '';
  FWord := '';
  FSpVoice := TSpVoice.Create(nil);
  FSpVoice.EventInterests := SVEAllEvents;
  EnumVoices;
  //FSpVoice.OnStartStream := OnStartStream;
  FSpVoice.OnWord := DoOnWord;
end;

class procedure Speech.SubstituteWord(const AWord: string; const ASubstituteWord: string);
var
  LWord: string;
  LSubstituteWord: string;
begin
  LWord := AWord;
  LSubstituteWord := ASubstituteWord;
  if LWord.IsEmpty then Exit;
  if LSubstituteWord.IsEmpty then Exit;
  FSubList.TryAdd(LWord, LSubstituteWord);
end;

{ TJsonHelper }
procedure TJsonHelper.Assign(ASource: TJSONValue);
begin
  FromJSON(ASource.ToJSON);
end;

function TJsonHelper.Contains(AName: string): Boolean;
begin
  Result := FindValue(AName) <> nil;
end;

procedure TJsonHelper.FromJSON(AJson: string);
begin
  Parse(BytesOf(AJson), 0);
end;

function TJsonHelper.AddObject(const AName: string): TJsonObject;
begin
  Result := TJsonObject.Create();
  AddPair(AName, Result);
end;

function TJsonHelper.AddArray(const AName: string): TJsonArray;
begin
  Result := TJsonArray.Create();
  AddPair(AName, Result);
end;

class function TJsonHelper.Parse(const AData: string): TJsonObject;
begin
  Result := TJSONObject.ParseJSONValue(AData) as TJSONObject;
end;

class function TJsonHelper.ParseJSONArray(const AJSONArrayStr: string): TJSONArray;
begin
  Result := TJSONArray.ParseJSONValue(AJSONArrayStr) as TJSONArray;
end;

function TJsonHelper.GetArray(AName: string): TJSONArray;
begin
  Result := FindValue(AName) as TJsonArray;
  if Result = nil then
  begin
    Result := TJSONArray.Create;
    AddPair(AName, Result);
  end;
end;

function TJsonHelper.GetBool(AParam: string): Boolean;
var
  AValue: TJSONValue;
begin
  Result := False;
  AValue := FindValue(AParam);
  if AValue <> nil then
    Result := AValue.AsType<Boolean> = True;
end;

function TJsonHelper.GetInteger(AParam: string): integer;
var
  AValue: TJSONValue;
begin
  Result := 0;

  AValue := FindValue(AParam);
  if AValue <> nil then
    Result := AValue.AsType<Integer>;
end;

function TJsonHelper.GetNames(AIndex: integer): string;
begin
  Result := Pairs[AIndex].JsonString.Value;
end;

function TJsonHelper.GetObject(AName: string): TJsonObject;
begin
  Result := Values[AName] as TJSONObject;
  if Result = nil then
  begin
    Result := TJsonObject.Create;
    AddPair(AName, TJsonObject.Create);
  end;
end;

function TJsonHelper.GetString(AParam: string): string;
var
  AValue: TJSONValue;
begin
  Result := '';
  AValue := FindValue(AParam);
  if AValue <> nil then
    Result := AValue.AsType<string>;


end;

function TJsonHelper.IsNull(AName: string): Boolean;
begin
  Result := Values[AName] is TJSONNull;
end;

procedure TJsonHelper.SetArray(AName: string; const Value: TJSONArray);
begin
  AddPair(AName, Value);
end;

procedure TJsonHelper.SetBool(AParam: string; const Value: Boolean);
begin
  AddPair(AParam, TJSONBool.Create(Value));
end;

procedure TJsonHelper.SetInteger(AParam: string; const Value: integer);
begin
  AddPair(AParam, TJSONNumber.Create(Value));
end;

function TJsonHelper.GetFloat(AParam: string): Double;
begin
  Result := StrToFloatDef(AParam, 0);
end;

procedure TJsonHelper.SetFloat(AParam: string; const Value: Double);
begin
  AddPair(AParam, TJSONNumber.Create(Value));
end;

procedure TJsonHelper.SetObject(AName: string; const Value: TJsonObject);
begin
  AddPair(AName, Value)
end;

procedure TJsonHelper.SetString(AParam: string; const Value: string);
begin
  AddPair(AParam, TJSONString.Create(Value));
end;

function TJsonHelper.GetTypes(AName: string): TJsonValueType;
var
  APair: TJSONValue;
begin
  Result := jvtObject;
  APair := GetValue(AName);
  if APair is TJsonObject then Result := jvtObject;
  if APair is TJSONString then Result := jvtString;

end;

{ TVirtualBuffer }
procedure TVirtualBuffer<T>.Clear();
begin
  if (Memory <> nil) then
  begin
    if not UnmapViewOfFile(Memory) then
      raise Exception.Create('Error deallocating mapped memory');
  end;

  if (FHandle <> 0) then
  begin
    if not CloseHandle(FHandle) then
      raise Exception.Create('Error freeing memory mapping handle');
  end;
end;

function  TVirtualBuffer<T>.GetItem(AIndex: Integer): T;
begin
  Move((PByte(Memory) + AIndex * SizeOf(T))^, Result, SizeOf(T));
end;

procedure TVirtualBuffer<T>.SetItem(AIndex: Integer; AValue: T);
begin
  Move(AValue,  (PByte(Memory) + AIndex * SizeOf(T))^, SizeOf(T));
end;

constructor TVirtualBuffer<T>.Create(aSize: Cardinal);
var
  P: Pointer;
  LSize: Cardinal;
begin
  inherited Create;
  LSize := SizeOf(T) * ASize;
  FName := TPath.GetGUIDFileName;
  FHandle := CreateFileMapping(INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, LSize, PChar(FName));
  if FHandle = 0 then
    begin
      Clear;
      raise Exception.Create('Error creating memory mapping');
      FHandle := 0;
    end
  else
    begin
      P := MapViewOfFile(FHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
      if P = nil then
        begin
          Clear;
          raise Exception.Create('Error creating memory mapping');
        end
      else
        begin
          Self.SetPointer(P, LSize);
          Position := 0;
        end;
    end;
end;

destructor TVirtualBuffer<T>.Destroy();
begin
  Clear;
  inherited;
end;

function TVirtualBuffer<T>.Write(const aBuffer; aCount: Longint): Longint;
var
  Pos: Int64;
begin
  if (Position >= 0) and (aCount >= 0) then
  begin
    Pos := Position + aCount;
    if Pos > 0 then
    begin
      if Pos > Size then
      begin
        Result := 0;
        Exit;
      end;
      System.Move(aBuffer, (PByte(Memory) + Position)^, aCount);
      Position := Pos;
      Result := aCount;
      Exit;
    end;
  end;
  Result := 0;
end;

function TVirtualBuffer<T>.Write(const aBuffer: TBytes; aOffset, aCount: Longint): Longint;
var
  Pos: Int64;
begin
  if (Position >= 0) and (aCount >= 0) then
  begin
    Pos := Position + aCount;
    if Pos > 0 then
    begin
      if Pos > Size then
      begin
        Result := 0;
        Exit;
      end;
      System.Move(aBuffer[aOffset], (PByte(Memory) + Position)^, aCount);
      Position := Pos;
      Result := aCount;
      Exit;
    end;
  end;
  Result := 0;
end;

procedure TVirtualBuffer<T>.SaveToFile(aFilename: string);
var
  LStream: TFileStream;
begin
  LStream := TFile.Create(aFilename);
  try
    LStream.Write(Memory^, Size);
  finally
    LStream.Free;
  end;
end;

class function TVirtualBuffer<T>.LoadFromFile(const aFilename: string): TVirtualBuffer<T>;
var
  LStream: TStream;
  LBuffer: TVirtualBuffer<T>;
begin
  Result := nil;
  if aFilename.IsEmpty then Exit;
  if not TFile.Exists(aFilename) then Exit;
  LStream := TFile.OpenRead(aFilename);
  try
    LBuffer := TVirtualBuffer<T>.Create(LStream.Size);
    if LBuffer <> nil then
    begin
      LBuffer.CopyFrom(LStream);
    end;
  finally
    FreeAndNil(LStream);
  end;
  Result := LBuffer;
end;

function  TVirtualBuffer<T>.Eob(): Boolean;
begin
  Result := Boolean(Position >= Size);
end;

function  TVirtualBuffer<T>.ReadString(): string;
var
  LLength: LongInt;
begin
  Read(LLength, SizeOf(LLength));
  SetLength(Result, LLength);
  if LLength > 0 then Read(Result[1], LLength * SizeOf(Char));
end;

{ TMapMemoryToArrayOf }
function  TMapMemoryToArrayOf<T>.GetItem(AIndex: Integer): T;
begin
  Move((PByte(FMemory) + AIndex * SizeOf(T))^, Result, SizeOf(T));
end;

procedure TMapMemoryToArrayOf<T>.SetItem(AIndex: Integer; AValue: T);
begin
  Move(AValue,  (PByte(FMemory) + AIndex * SizeOf(T))^, SizeOf(T));
end;

constructor TMapMemoryToArrayOf<T>.Create(const AMemory: Pointer);
begin
  inherited Create;
  FMemory := AMemory;
end;

destructor TMapMemoryToArrayOf<T>.Destroy();
begin
  inherited;
end;

{ TTokenResponse }
class operator TTokenResponse.Initialize (out ADest: TTokenResponse);
begin
  // Defaults
  ADest.FRaw := '';
  SetLength(ADest.FTokens, 0);
  SetLength(ADest.FWordBreaks, 0);
  SetLength(ADest.FLineBreaks, 0);
  SetLength(ADest.FWords, 0);
  ADest.FWord := '';
  ADest.FLine := '';
  ADest.FFinalized := False;
  ADest.FRightMargin := 10;

  // If stream output is sent to a destination without wordwrap,
  // the TTokenResponse will find wordbreaks and split into lines by full words

  // Stream is tabulated into full words based on these break characters
  // !Syntax requires at least one!
  SetLength(ADest.FWordBreaks, 4);
  ADest.FWordBreaks[0] := ' ';
  ADest.FWordBreaks[1] := '-';
  ADest.FWordBreaks[2] := ',';
  ADest.FWordBreaks[3] := '.';

  // Stream may contain forced line breaks
  // !Syntax requires at least one!
  SetLength(ADest.FLineBreaks, 2);
  ADest.FLineBreaks[0] := #13;
  ADest.FLineBreaks[1] := #10;


  ADest.SetRightMargin(10);
end;

function TTokenResponse.AddToken(const aToken: string): TTokenPrintAction;
var
  LPrefix, LSuffix: string;
begin
  // Keep full original response
  FRaw := FRaw + aToken;                    // As continuous string
  Setlength(FTokens, Length(FTokens)+1);    // Make space
  FTokens[Length(FTokens)-1] := aToken;     // As an array

  // Accumulate "word"
  FWord := FWord + aToken;

  // If stream contains linebreaks, print token out without added linebreaks
  if HandleLineBreaks(aToken) then
    exit(TTokenPrintAction.paAppend)

  // Check if a natural break exists, also split if word is longer than the allowed space
  // and print out token with or without linechange as needed
  else if SplitWord(FWord, LPrefix, LSuffix) or FFinalized then
    begin
      // On last call when Finalized we want access to the line change logic only
      // Bad design (fix on top of a fix) Would be better to separate word slipt and line logic from eachother
      if not FFinalized then
        begin
          Setlength(FWords, Length(FWords)+1);        // Make space
          FWords[Length(FWords)-1] := LPrefix;        // Add new word to array
          FWord := LSuffix;                         // Keep the remainder of the split
        end;

      // Word was split, so there is something that can be printed

      // Need for a new line?
      if Length(FLine) + Length(LastWord) > GetLineLengthMax() then
        begin
          Result  := TTokenPrintAction.paNewline;
          FLine   := LastWord;                  // Reset Line (will be new line and then the word)
        end
      else
        begin
          Result  := TTokenPrintAction.paAppend;
          FLine   := FLine + LastWord;          // Append to the line
        end;
    end
  else
    begin
      Result := TTokenPrintAction.paWait;
    end;
end;

function TTokenResponse.HandleLineBreaks(const AToken: string): Boolean;
var
  LLetter, LLineBreak: Integer;
begin
  Result := false;

  for LLetter := Length(AToken) downto 1 do                   // We are interested in the last possible linebreak
  begin
    for LLineBReak := 0 to Length(Self.FLineBreaks)-1 do       // Iterate linebreaks
    begin
      if AToken[LLetter] = FLineBreaks[LLineBreak] then        // If linebreak was found
      begin
        // Split into a word by last found linechange (do note the stored word may have more linebreak)
        Setlength(FWords, Length(FWords)+1);                          // Make space
        FWords[Length(FWords)-1] := FWord + LeftStr(AToken, Length(AToken)-LLetter); // Add new word to array

        // In case aToken did not end after last LF
        // Word and new line will have whatever was after the last linebreak
        FWord := RightStr(AToken, Length(AToken)-LLetter);
        FLine := FWord;

        // No need to go further
        exit(true);
      end;
    end;
  end;
end;

function TTokenResponse.Finalize: Boolean;
begin
  // Buffer may contain something, if so make it into a word
  if FWord <> ''  then
    begin
      Setlength(FWords, Length(FWords)+1);      // Make space
      FWords[Length(FWords)-1] := FWord;        // Add new word to array
      Self.FFinalized := True;                // Remember Finalize was done (affects how last AddToken-call behaves)
      exit(true);
    end
  else
    Result := false;
end;

function TTokenResponse.LastWord(const ATrimLeft: Boolean): string;
begin
  Result := FWords[Length(FWords)-1];
  if ATrimLeft then
    Result := Result.TrimLeft;
end;

function TTokenResponse.SplitWord(const AWord: string; var APrefix, ASuffix: string): Boolean;
var
  LLetter, LSeparator: Integer;
begin
  Result := false;

  for LLetter := 1 to Length(AWord) do               // Iterate whole word
  begin
    for LSeparator := 0 to Length(FWordBreaks)-1 do   // Iterate all separating characters
    begin
      if AWord[LLetter] = FWordBreaks[LSeparator] then // check for natural break
      begin
        // Let the world know there's stuff that can be a reason for a line change
        Result := True;

        APrefix := LeftStr(AWord, LLetter);
        ASuffix := RightStr(AWord, Length(AWord)-LLetter);
      end;
    end;
  end;

  // Maybe the word is too long but there was no natural break, then cut it to LineLengthMax
  if Length(AWord) > GetLineLengthMax() then
  begin
    Result := True;
    APrefix := LeftStr(AWord, GetLineLengthMax());
    ASuffix := RightStr(AWord, Length(AWord)-GetLineLengthMax());
  end;
end;

function TTokenResponse.GetLineLengthMax(): Integer;
begin
  Console.GetSize(@Result, nil);
  Result := Result - FRightMargin;
end;

procedure TTokenResponse.SetRightMargin(const AMargin: Integer);
var
  LWidth: Integer;
begin
  Console.GetSize(@LWidth, nil);
  FRightMargin := EnsureRange(AMargin, 1, LWidth);
end;

{ TBaseObject }
procedure RunObject(const AObject: TBaseObjectClass);
var
  LObject: TBaseObject;
begin
  LObject := AObject.Create();
  try
    LObject.Run();
  finally
    LObject.Free();
  end;
end;

constructor TBaseObject.Create();
begin
  inherited;
end;

destructor TBaseObject.Destroy();
begin
  inherited;
end;

procedure TBaseObject.Run();
begin
end;

initialization
begin
  //CoInitialize(nil);
end;

finalization
begin
  //CoUninitialize();
end;

end.
