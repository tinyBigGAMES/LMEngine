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


unit lme;

{$IFDEF FPC}
{$MODE DELPHIUNICODE}
{$ENDIF}

{$IFNDEF WIN64}
  {$MESSAGE Error 'Unsupported platform'}
{$ENDIF}

interface

const
  // Infero DLL
  LME_DLL = 'lme.dll';

  // Console linefeed & carriage return
  LF   = AnsiChar(#10);
  CR   = AnsiChar(#13);
  CRLF = LF+CR;

  // Virtual Keys
  VKEY_ESCAPE  = 27;
  VKEY_SPACE  = 32;

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

  // Message roles
  ROLE_SYSTEM    = 'system';
  ROLE_USER      = 'user';
  ROLE_ASSISTANT = 'assistant';
  ROLE_TOOL      = 'tool';

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

  // Version
  VERSION_FULL  = 0;
  VERSION_MAJOR = 1;
  VERSION_MINOR = 2;
  VERSION_PATCH = 3;

type
  PInt32 = ^PInteger;

  // Callbacks
  SpeechWordCallback = procedure(const AWord, AText: PWideChar;
    const AUserData: Pointer); cdecl;

  InferenceCancelCallback = function(
    const AUserData: Pointer): Boolean; cdecl;

  InferenceTokenCallback = procedure(const AToken: PWideChar;
    const AUserData: Pointer); cdecl;

  InfoCallback = procedure(const ALevel: Integer; const AText: PWideChar;
    const AUserData: Pointer); cdecl;

  LoadModelProgressCallback = function(const AModelName: PWideChar;
    const AProgress: Single; const AUserData: Pointer): Boolean; cdecl;

  LoadModelCallback = procedure(const AModelName: PWideChar;
    const ASuccess: Boolean; const AUserData: Pointer); cdecl;

  InferenceStartCallback = procedure(const AUserData: Pointer); cdecl;

  InferenceEndCallback = procedure(const AUserData: Pointer); cdecl;

/// <summary>
///   Prints text to the console.
/// </summary>
/// <param name="AText">
///   The text to be printed.
/// </param>
/// <param name="AColor">
///   The color of the text.
/// </param>
procedure Print(const AText: PWideChar; const AColor: Integer); cdecl;
  varargs; external LME_DLL;

/// <summary>
///   Prints text to the console with a line feed and carriage return.
/// </summary>
/// <param name="AText">
///   The text to be printed.
/// </param>
/// <param name="AColor">
///   The color of the text.
/// </param>
procedure PrintLn(const AText: PWideChar; const AColor: Integer); cdecl;
  varargs; external LME_DLL;

/// <summary>
///   Gets the console cursor X and Y position.
/// </summary>
/// <param name="X">
///   The X position of the cursor.
/// </param>
/// <param name="Y">
///   The Y position of the cursor.
/// </param>
procedure GetCursorPostion(X, Y: PInteger); cdecl; external LME_DLL;

/// <summary>
///   Sets the console cursor X and Y position.
/// </summary>
/// <param name="X">
///   The X position of the cursor.
/// </param>
/// <param name="Y">
///   The Y position of the cursor.
/// </param>
procedure SetCursorPostion(const X, Y: Integer); cdecl; external LME_DLL;

/// <summary>
///   Clears the current console screen.
/// </summary>
procedure ClearConsole(); cdecl; external LME_DLL;

/// <summary>
///   Clears the current console line.
/// </summary>
/// <param name="AColor">
///   The color to use when clearing the line.
/// </param>
procedure ClearConsoleLine(const AColor: WORD); cdecl;
  external LME_DLL;

/// <summary>
///   Clears the keyboard states.
/// </summary>
procedure ClearKeyStates(); cdecl; external LME_DLL;

/// <summary>
///   Checks if a key is currently held down.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key is held down, otherwise False.
/// </returns>
function IsKeyPressed(AKey: Byte): Boolean; cdecl; external LME_DLL;

/// <summary>
///   Checks if a key was recently released.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key was released, otherwise False.
/// </returns>
function WasKeyReleased(AKey: Byte): Boolean; cdecl; external LME_DLL;

/// <summary>
///   Checks if a key was recently pressed.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key was pressed, otherwise False.
/// </returns>
function WasKeyPressed(AKey: Byte): Boolean; cdecl; external LME_DLL;

/// <summary>
///   Pauses execution until any key is pressed.
/// </summary>
/// <param name="AForcePause">
///   If True, forces a pause.
/// </param>
/// <param name="AColor">
///   The color to use during the pause.
/// </param>
/// <param name="AText">
///   The text to display during the pause.
/// </param>
procedure Pause(const AForcePause: Boolean=False; AColor: WORD=FG_WHITE;
  const AText: PWideChar=nil); cdecl; external LME_DLL;

/// <summary>
///   Processes Windows messages.
/// </summary>
procedure ProcessMessages(); cdecl; external LME_DLL;

/// <summary>
///   Masks out the first word found in a text string.
/// </summary>
/// <param name="AText">
///   The text to search.
/// </param>
/// <param name="AWord">
///   The word to mask.
/// </param>
/// <returns>
///   The modified text with the first found word masked.
/// </returns>
function MaskFirstFoundWord(const AText, AWord: PWideChar): PWideChar;
  cdecl; external LME_DLL;

/// <summary>
///   Sets the token response right margin.
/// </summary>
/// <param name="AMargin">
///   The right margin value.
/// </param>
procedure SetTokenResponseRightMargin(const AMargin: Integer); cdecl;
  external LME_DLL;

/// <summary>
///   Adds a new token to token response.
/// </summary>
/// <param name="AToken">
///   The token to add.
/// </param>
/// <returns>
///   An integer representing the token response.
/// </returns>
function AddTokenResponseToken(const AToken: PWideChar): Integer; cdecl;
  external LME_DLL;

/// <summary>
///   Gets the last word from token response.
/// </summary>
/// <param name="ATrimLeft">
///   If True, trims the left side.
/// </param>
/// <returns>
///   The last word from the token response.
/// </returns>
function LastTokenResponseWord(const ATrimLeft: Boolean): PWideChar; cdecl;
  external LME_DLL;

/// <summary>
///   Checks if all words have been processed in token response.
/// </summary>
/// <returns>
///   True if all words have been processed, otherwise False.
/// </returns>
function FinalizeTokenResponse(): Boolean; cdecl; external LME_DLL;

/// <summary>
///   Sets the speech word callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure SetSpeechWordCallback(const AHandler: SpeechWordCallback;
  const AUserData: Pointer); cdecl; external LME_DLL;

/// <summary>
///   Gets the speech word callback.
/// </summary>
/// <returns>
///   The current speech word callback.
/// </returns>
function GetSpeechWordCallback(): SpeechWordCallback; cdecl;
  external LME_DLL;

/// <summary>
///   Gets the speech voice count.
/// </summary>
/// <returns>
///   The number of available speech voices.
/// </returns>
function GetSpeechVoiceCount(): Integer; cdecl; external LME_DLL;

/// <summary>
///   Gets a speech voice attribute.
/// </summary>
/// <param name="AIndex">
///   The index of the speech voice.
/// </param>
/// <param name="AAttribute">
///   The attribute to retrieve.
/// </param>
/// <returns>
///   The attribute value as a string.
/// </returns>
function GetSpeechVoiceAttribute(const AIndex: Integer;
  const AAttribute: Byte): PWideChar; cdecl; external LME_DLL;

/// <summary>
///   Changes the speech voice speed.
/// </summary>
/// <param name="AIndex">
///   The index of the speech voice.
/// </param>
procedure ChangeSpeechVoice(const AIndex: Integer); cdecl;
  external LME_DLL;

/// <summary>
///   Gets the current speech voice.
/// </summary>
/// <returns>
///   The index of the current speech voice.
/// </returns>
function GetSpeechVoice(): Integer; cdecl; external LME_DLL;

/// <summary>
///   Sets the current speech voice volume.
/// </summary>
/// <param name="AVolume">
///   The volume level to set.
/// </param>
procedure SetSpeechVolume(const AVolume: Single); cdecl;
  external LME_DLL;

/// <summary>
///   Gets the current speech voice volume.
/// </summary>
/// <returns>
///   The current volume level.
/// </returns>
function GetSpeechVolume(): Single; cdecl; external LME_DLL;

/// <summary>
///   Sets the current speech voice rate.
/// </summary>
/// <param name="ARate">
///   The rate to set.
/// </param>
procedure SetSpeechRate(const ARate: Single); cdecl; external LME_DLL;

/// <summary>
///   Gets the current speech voice rate.
/// </summary>
/// <returns>
///   The current rate.
/// </returns>
function GetSpeechRate(): Single; cdecl; external LME_DLL;

/// <summary>
///   Clears the current speech voice.
/// </summary>
procedure ClearSpeech(); cdecl; external LME_DLL;

/// <summary>
///   Speaks text in the current speech voice.
/// </summary>
/// <param name="AText">
///   The text to be spoken.
/// </param>
/// <param name="APurge">
///   If True, purges the current speech before speaking.
/// </param>
procedure SaySpeech(const AText: PWideChar; const APurge: Boolean); cdecl;
  external LME_DLL;

/// <summary>
///   Checks if the current speech voice is active.
/// </summary>
/// <returns>
///   True if the speech voice is active, otherwise False.
/// </returns>
function IsSpeechActive(): Boolean; cdecl; external LME_DLL;

/// <summary>
///   Pauses the current speech voice.
/// </summary>
procedure PauseSpeech(); cdecl; external LME_DLL;

/// <summary>
///   Resumes the current speech voice.
/// </summary>
procedure ResumeSpeech(); cdecl; external LME_DLL;

/// <summary>
///   Resets the current speech voice.
/// </summary>
procedure ResetSpeech(); cdecl; external LME_DLL;

/// <summary>
///   Adds a word phrase to be substituted in speech.
/// </summary>
/// <param name="AWord">
///   The word to be substituted.
/// </param>
/// <param name="ASubstituteWord">
///   The substitute word.
/// </param>
procedure SubstituteSpeechWord(const AWord, ASubstituteWord: PWideChar);
  cdecl; external LME_DLL;

/// <summary>
///   Gets the version information.
/// </summary>
/// <param name="AType">
///   The type of version information to retrieve.
/// </param>
/// <returns>
///   The version information as a string.
/// </returns>
function GetVersionInfo(const AType: Byte): PWideChar; cdecl;
  external LME_DLL;

/// <summary>
///   Clears the last error message.
/// </summary>
procedure ClearError(); cdecl; external LME_DLL;

/// <summary>
///   Sets an error message.
/// </summary>
/// <param name="AText">
///   The error message to set.
/// </param>
procedure SetError(const AText: PWideChar); cdecl; external LME_DLL;

/// <summary>
///   Gets the last error message.
/// </summary>
/// <returns>
///   The last error message as a string.
/// </returns>
function GetError(): PWideChar; cdecl; external LME_DLL;

/// <summary>
///   Gets the inference cancel callback.
/// </summary>
/// <returns>
///   The inference cancel callback.
/// </returns>
function GetInferenceCancelCallback(): InferenceCancelCallback; cdecl;
  external LME_DLL;

/// <summary>
///   Sets the inference cancel callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure SetInferenceCancelCallback(
  const AHandler: InferenceCancelCallback; const AUserData: Pointer);
  cdecl; external LME_DLL;

/// <summary>
///   Gets the inference token callback.
/// </summary>
/// <returns>
///   The inference token callback.
/// </returns>
function GetInferenceTokenCallback(): InferenceTokenCallback; cdecl;
  external LME_DLL;

/// <summary>
///   Sets the inference token callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure SetInferenceTokenlCallback(
  const AHandler: InferenceTokenCallback; const AUserData: Pointer); cdecl;
  external LME_DLL;

/// <summary>
///   Gets the information callback.
/// </summary>
/// <returns>
///   The information callback.
/// </returns>
function GetInfoCallback(): InfoCallback; cdecl; external LME_DLL;

/// <summary>
///   Sets the information callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure SetInfoCallback(const AHandler: InfoCallback;
  const AUserData: Pointer); cdecl; external LME_DLL;

/// <summary>
///   Gets the load model progress callback.
/// </summary>
/// <returns>
///   The load model progress callback.
/// </returns>
function GetLoadModelProgressCallback(): LoadModelProgressCallback;
  cdecl; external LME_DLL;

/// <summary>
///   Sets the load model progress callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure SetLoadModelProgressCallback(
  const AHandler: LoadModelProgressCallback; const AUserData: Pointer);
  cdecl; external LME_DLL;

/// <summary>
///   Gets the load model callback.
/// </summary>
/// <returns>
///   The load model callback.
/// </returns>
function GetLoadModelCallback(): LoadModelCallback; cdecl;
  external LME_DLL;

/// <summary>
///   Sets the load model callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure SetLoadModelCallback(const AHandler: LoadModelCallback;
  const AUserData: Pointer); cdecl; external LME_DLL;

/// <summary>
///   Gets the inference start callback.
/// </summary>
/// <returns>
///   The inference start callback.
/// </returns>
function GetInferenceStartCallback(): InferenceStartCallback; cdecl;
  external LME_DLL;

/// <summary>
///   Sets the inference start callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure SetInferenceStartCallback(
  const AHandler: InferenceStartCallback; const AUserData: Pointer); cdecl;
  external LME_DLL;

/// <summary>
///   Gets the inference end callback.
/// </summary>
/// <returns>
///   The inference end callback.
/// </returns>
function GetInferenceEndCallback(): InferenceEndCallback; cdecl;
  external LME_DLL;

/// <summary>
///   Sets the inference end callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure SetInferenceEndCallback(const AHandler: InferenceEndCallback;
  const AUserData: Pointer); cdecl; external LME_DLL;

/// <summary>
///   Initializes configuration settings.
/// </summary>
/// <param name="AModelPath">
///   The path to the model.
/// </param>
/// <param name="ANumGPULayers">
///   The number of GPU layers.
/// </param>
procedure InitConfig(const AModelPath: PWideChar;
  const ANumGPULayers: Int32); cdecl; external LME_DLL;

/// <summary>
///   Saves configuration settings to a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to save the configuration to.
/// </param>
/// <returns>
///   True if the configuration was saved successfully, otherwise False.
/// </returns>
function SaveConfig(const AFilename: PWideChar): Boolean; cdecl;
  external LME_DLL;

/// <summary>
///   Loads configuration settings from a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to load the configuration from.
/// </param>
/// <returns>
///   True if the configuration was loaded successfully, otherwise False.
/// </returns>
function LoadConfig(const AFilename: PWideChar): Boolean; cdecl;
  external LME_DLL;

/// <summary>
///   Clears all inference messages.
/// </summary>
procedure ClearAllMessages(); cdecl; external LME_DLL;

/// <summary>
///   Adds a new inference message.
/// </summary>
/// <param name="ARole">
///   The role of the message.
/// </param>
/// <param name="AContent">
///   The content of the message.
/// </param>
/// <returns>
///   The message ID.
/// </returns>
function AddMessage(const ARole, AContent: PWideChar): Int32; cdecl;
  external LME_DLL;

/// <summary>
///   Gets the last user role inference message.
/// </summary>
/// <returns>
///   The last user role inference message.
/// </returns>
function GetLastUserMessage(): PWideChar; cdecl; external LME_DLL;

/// <summary>
///   Returns an inference prompt for the specified model from current messages.
/// </summary>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <returns>
///   The inference prompt.
/// </returns>
function BuildMessageInferencePrompt(
  const AModelName: PWideChar): PWideChar; cdecl; external LME_DLL;

/// <summary>
///   Clears all model definitions.
/// </summary>
procedure ClearModelDefines(); cdecl; external LME_DLL;

/// <summary>
///   Adds a model definition.
/// </summary>
/// <param name="AModelFilename">
///   The filename of the model.
/// </param>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <param name="AMaxContext">
///   The maximum context size.
/// </param>
/// <param name="ATemplate">
///   The template for the model.
/// </param>
/// <param name="ATemplateEnd">
///   The end template for the model.
/// </param>
/// <returns>
///   The model ID.
/// </returns>
function DefineModel(const AModelFilename, AModelName: PWideChar;
  const AMaxContext: UInt32; const ATemplate,
  ATemplateEnd: PWideChar): Int32; cdecl; external LME_DLL;

/// <summary>
///   Saves all model definitions to a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to save the definitions to.
/// </param>
/// <returns>
///   True if the definitions were saved successfully, otherwise False.
/// </returns>
function SaveModelDefines(const AFilename: PWideChar): Boolean; cdecl;
  external LME_DLL;

/// <summary>
///   Loads model definitions from a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to load the definitions from.
/// </param>
/// <returns>
///   True if the definitions were loaded successfully, otherwise False.
/// </returns>
function LoadModelDefines(const AFilename: PWideChar): Boolean; cdecl;
  external LME_DLL;

/// <summary>
///   Loads the specified model.
/// </summary>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <returns>
///   True if the model was loaded successfully, otherwise False.
/// </returns>
function LoadModel(const AModelName: PWideChar): Boolean; cdecl;
  external LME_DLL;

/// <summary>
///   Checks if a model is currently loaded.
/// </summary>
/// <returns>
///   True if a model is loaded, otherwise False.
/// </returns>
function IsModelLoaded(): Boolean; cdecl; external LME_DLL;

/// <summary>
///   Unloads the currently loaded model.
/// </summary>
procedure UnloadModel(); cdecl; external LME_DLL;

/// <summary>
///   Runs inference on the currently loaded model.
/// </summary>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <param name="AMaxTokens">
///   The maximum number of tokens.
/// </param>
/// <returns>
///   True if the inference was run successfully, otherwise False.
/// </returns>
function RunInference(const AModelName: PWideChar;
  const AMaxTokens: UInt32): Boolean; cdecl; external LME_DLL;

/// <summary>
///   Gets the inference response from the currently loaded model.
/// </summary>
/// <returns>
///   The inference response.
/// </returns>
function GetInferenceResponse(): PWideChar; cdecl; external LME_DLL;

/// <summary>
///   Returns inference statistics.
/// </summary>
/// <param name="ATokenInputSpeed">
///   The input token speed.
/// </param>
/// <param name="ATokenOutputSpeed">
///   The output token speed.
/// </param>
/// <param name="AInputTokens">
///   The number of input tokens.
/// </param>
/// <param name="AOutputTokens">
///   The number of output tokens.
/// </param>
/// <param name="ATotalTokens">
///   The total number of tokens.
/// </param>
procedure GetInferenceStats(ATokenInputSpeed: PSingle;
  ATokenOutputSpeed: PSingle; AInputTokens: PInt32; AOutputTokens: PInt32;
  ATotalTokens: PInt32); cdecl; external LME_DLL;

implementation

uses
  Math;

initialization
{$IFNDEF FPC}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

  SetExceptionMask(GetExceptionMask + [exOverflow, exInvalidOp]);

end.
