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

unit LMEngine;

{$IFDEF FPC}
{$MODE DELPHIUNICODE}
{$ENDIF}

{$IFNDEF WIN64}
  {$MESSAGE Error 'Unsupported platform'}
{$ENDIF}

interface

const
  // Infero DLL
  LMENGINE_DLL = 'LMEngine.dll';

  // Console linefeed & carriage return
  LME_LF   = AnsiChar(#10);
  LME_CR   = AnsiChar(#13);
  LME_CRLF = LME_LF+LME_CR;

  // Virtual Keys
  LME_VKEY_ESCAPE  = 27;
  LME_VKEY_SPACE  = 32;

  // Primary console colors
  LME_FG_BLUE         = 1;
  LME_FG_GREEN        = 2;
  LME_FG_RED          = 4;
  LME_FG_INTENSITY    = 8;
  LME_BG_BLUE         = $10;
  LME_BG_GREEN        = $20;
  LME_BG_RED          = $40;
  LME_BG_INTENSITY    = $80;

  // Custom console color
  LME_FG_BRIGHTYELLOW = LME_FG_RED OR LME_FG_GREEN OR LME_FG_INTENSITY;
  LME_FG_YELLOW       = LME_FG_RED OR LME_FG_GREEN;
  LME_FG_WHITE        = LME_FG_RED OR LME_FG_GREEN OR LME_FG_BLUE;
  LME_FG_BRIGHTWHITE  = LME_FG_WHITE OR LME_FG_INTENSITY;
  LME_FG_DARKGREEN    = LME_FG_GREEN;
  LME_FG_LIGHTGREEN   = LME_FG_GREEN or LME_FG_INTENSITY;
  LME_FG_DARKGRAY     = LME_FG_INTENSITY;
  LME_FG_CYAN         = LME_FG_GREEN OR LME_FG_BLUE;
  LME_FG_MAGENTA      = LME_FG_RED OR LME_FG_BLUE;

  LME_BG_BRIGHTYELLOW = LME_BG_RED OR LME_BG_GREEN OR LME_BG_INTENSITY;
  LME_BG_YELLOW       = LME_BG_RED OR LME_BG_GREEN;
  LME_BG_WHITE        = LME_BG_RED OR LME_BG_GREEN OR LME_BG_BLUE;
  LME_BG_BRIGHTWHITE  = LME_BG_WHITE OR LME_BG_INTENSITY;
  LME_BG_DARKGREEN    = LME_BG_GREEN;
  LME_BG_LIGHTGREEN   = LME_BG_GREEN or LME_BG_INTENSITY;
  LME_BG_DARKGRAY     = LME_BG_INTENSITY;
  LME_BG_CYAN         = LME_BG_GREEN OR LME_FG_BLUE;
  LME_BG_MAGENTA      = LME_BG_RED OR LME_FG_BLUE;

  // Message roles
  LME_ROLE_SYSTEM    = 'system';
  LME_ROLE_USER      = 'user';
  LME_ROLE_ASSISTANT = 'assistant';
  LME_ROLE_TOOL      = 'tool';

  // Speech Voice Attributes
  LME_SPEECH_VOICEATTR_DESCRIPTION = 0;
  LME_SPEECH_VOICEATTR_NAME        = 1;
  LME_SPEECH_VOICEATTR_VENDOR      = 2;
  LME_SPEECH_VOICEATTR_AGE         = 3;
  LME_SPEECH_VOICEATTR_GENDER      = 4;
  LME_SPEECH_VOICEATTR_LANGUAGE    = 5;
  LME_SPEECH_VOICEATTR_ID          = 6;

  // Token Response
  LME_TOKENRESPONSE_WAIT    = 0;
  LME_TOKENRESPONSE_APPEND  = 1;
  LME_TOKENRESPONSE_NEWLINE = 2;

  // Version
  LME_VERSION_FULL  = 0;
  LME_VERSION_MAJOR = 1;
  LME_VERSION_MINOR = 2;
  LME_VERSION_PATCH = 3;

type
  PInt32 = ^PInteger;

  // Callbacks
  LME_SpeechWordCallback = procedure(const AWord, AText: PWideChar;
    const AUserData: Pointer); cdecl;

  LME_InferenceCancelCallback = function(
    const AUserData: Pointer): Boolean; cdecl;

  LME_InferenceTokenCallback = procedure(const AToken: PWideChar;
    const AUserData: Pointer); cdecl;

  LME_InfoCallback = procedure(const ALevel: Integer; const AText: PWideChar;
    const AUserData: Pointer); cdecl;

  LME_LoadModelProgressCallback = function(const AModelName: PWideChar;
    const AProgress: Single; const AUserData: Pointer): Boolean; cdecl;

  LME_LoadModelCallback = procedure(const AModelName: PWideChar;
    const ASuccess: Boolean; const AUserData: Pointer); cdecl;

  LME_InferenceStartCallback = procedure(const AUserData: Pointer); cdecl;

  LME_InferenceEndCallback = procedure(const AUserData: Pointer); cdecl;

/// <summary>
///   Prints text to the console.
/// </summary>
/// <param name="AText">
///   The text to be printed.
/// </param>
/// <param name="AColor">
///   The color of the text.
/// </param>
procedure LME_Print(const AText: PWideChar; const AColor: Integer); cdecl;
  varargs; external LMENGINE_DLL;

/// <summary>
///   Prints text to the console with a line feed and carriage return.
/// </summary>
/// <param name="AText">
///   The text to be printed.
/// </param>
/// <param name="AColor">
///   The color of the text.
/// </param>
procedure LME_PrintLn(const AText: PWideChar; const AColor: Integer); cdecl;
  varargs; external LMENGINE_DLL;

/// <summary>
///   Gets the console cursor X and Y position.
/// </summary>
/// <param name="X">
///   The X position of the cursor.
/// </param>
/// <param name="Y">
///   The Y position of the cursor.
/// </param>
procedure LME_GetCursorPos(X, Y: PInteger); cdecl; external LMENGINE_DLL;

/// <summary>
///   Sets the console cursor X and Y position.
/// </summary>
/// <param name="X">
///   The X position of the cursor.
/// </param>
/// <param name="Y">
///   The Y position of the cursor.
/// </param>
procedure LME_SetCursorPos(const X, Y: Integer); cdecl; external LMENGINE_DLL;

/// <summary>
///   Clears the current console screen.
/// </summary>
procedure LME_ClearConsole(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Clears the current console line.
/// </summary>
/// <param name="AColor">
///   The color to use when clearing the line.
/// </param>
procedure LME_ClearConsoleLine(const AColor: WORD); cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Clears the keyboard states.
/// </summary>
procedure LME_ClearKeyStates(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Checks if a key is currently held down.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key is held down, otherwise False.
/// </returns>
function LME_IsKeyPressed(AKey: Byte): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Checks if a key was recently released.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key was released, otherwise False.
/// </returns>
function LME_WasKeyReleased(AKey: Byte): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Checks if a key was recently pressed.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key was pressed, otherwise False.
/// </returns>
function LME_WasKeyPressed(AKey: Byte): Boolean; cdecl; external LMENGINE_DLL;

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
procedure LME_Pause(const AForcePause: Boolean=False; AColor: WORD=LME_FG_WHITE;
  const AText: PWideChar=nil); cdecl; external LMENGINE_DLL;

/// <summary>
///   Processes Windows messages.
/// </summary>
procedure LME_ProcessMessages(); cdecl; external LMENGINE_DLL;

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
function LME_MaskFirstFoundWord(const AText, AWord: PWideChar): PWideChar;
  cdecl; external LMENGINE_DLL;

/// <summary>
///   Sets the token response right margin.
/// </summary>
/// <param name="AMargin">
///   The right margin value.
/// </param>
procedure LME_SetTokenResponseRightMargin(const AMargin: Integer); cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Adds a new token to token response.
/// </summary>
/// <param name="AToken">
///   The token to add.
/// </param>
/// <returns>
///   An integer representing the token response.
/// </returns>
function LME_AddTokenResponseToken(const AToken: PWideChar): Integer; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Gets the last word from token response.
/// </summary>
/// <param name="ATrimLeft">
///   If True, trims the left side.
/// </param>
/// <returns>
///   The last word from the token response.
/// </returns>
function LME_LastTokenResponseWord(const ATrimLeft: Boolean): PWideChar; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Checks if all words have been processed in token response.
/// </summary>
/// <returns>
///   True if all words have been processed, otherwise False.
/// </returns>
function LME_FinalizeTokenResponse(): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Sets the speech word callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure LME_SetSpeechWordCallback(const AHandler: LME_SpeechWordCallback;
  const AUserData: Pointer); cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the speech word callback.
/// </summary>
/// <returns>
///   The current speech word callback.
/// </returns>
function LME_GetSpeechWordCallback(): LME_SpeechWordCallback; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Gets the speech voice count.
/// </summary>
/// <returns>
///   The number of available speech voices.
/// </returns>
function LME_GetSpeechVoiceCount(): Integer; cdecl; external LMENGINE_DLL;

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
function LME_GetSpeechVoiceAttribute(const AIndex: Integer;
  const AAttribute: Byte): PWideChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Changes the speech voice speed.
/// </summary>
/// <param name="AIndex">
///   The index of the speech voice.
/// </param>
procedure LME_ChangeSpeechVoice(const AIndex: Integer); cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Gets the current speech voice.
/// </summary>
/// <returns>
///   The index of the current speech voice.
/// </returns>
function LME_GetSpeechVoice(): Integer; cdecl; external LMENGINE_DLL;

/// <summary>
///   Sets the current speech voice volume.
/// </summary>
/// <param name="AVolume">
///   The volume level to set.
/// </param>
procedure LME_SetSpeechVolume(const AVolume: Single); cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Gets the current speech voice volume.
/// </summary>
/// <returns>
///   The current volume level.
/// </returns>
function LME_GetSpeechVolume(): Single; cdecl; external LMENGINE_DLL;

/// <summary>
///   Sets the current speech voice rate.
/// </summary>
/// <param name="ARate">
///   The rate to set.
/// </param>
procedure LME_SetSpeechRate(const ARate: Single); cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the current speech voice rate.
/// </summary>
/// <returns>
///   The current rate.
/// </returns>
function LME_GetSpeechRate(): Single; cdecl; external LMENGINE_DLL;

/// <summary>
///   Clears the current speech voice.
/// </summary>
procedure LME_ClearSpeech(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Speaks text in the current speech voice.
/// </summary>
/// <param name="AText">
///   The text to be spoken.
/// </param>
/// <param name="APurge">
///   If True, purges the current speech before speaking.
/// </param>
procedure LME_SaySpeech(const AText: PWideChar; const APurge: Boolean); cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Checks if the current speech voice is active.
/// </summary>
/// <returns>
///   True if the speech voice is active, otherwise False.
/// </returns>
function LME_IsSpeechActive(): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Pauses the current speech voice.
/// </summary>
procedure LME_PauseSpeech(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Resumes the current speech voice.
/// </summary>
procedure LME_ResumeSpeech(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Resets the current speech voice.
/// </summary>
procedure LME_ResetSpeech(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Adds a word phrase to be substituted in speech.
/// </summary>
/// <param name="AWord">
///   The word to be substituted.
/// </param>
/// <param name="ASubstituteWord">
///   The substitute word.
/// </param>
procedure LME_SubstituteSpeechWord(const AWord, ASubstituteWord: PWideChar);
  cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the version information.
/// </summary>
/// <param name="AType">
///   The type of version information to retrieve.
/// </param>
/// <returns>
///   The version information as a string.
/// </returns>
function LME_GetVersion(const AType: Byte): PWideChar; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Clears the last error message.
/// </summary>
procedure LME_ClearError(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Sets an error message.
/// </summary>
/// <param name="AText">
///   The error message to set.
/// </param>
procedure LME_SetError(const AText: PWideChar); cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the last error message.
/// </summary>
/// <returns>
///   The last error message as a string.
/// </returns>
function LME_GetError(): PWideChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the inference cancel callback.
/// </summary>
/// <returns>
///   The inference cancel callback.
/// </returns>
function LME_GetInferenceCancelCallback(): LME_InferenceCancelCallback; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Sets the inference cancel callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure LME_SetInferenceCancelCallback(
  const AHandler: LME_InferenceCancelCallback; const AUserData: Pointer);
  cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the inference token callback.
/// </summary>
/// <returns>
///   The inference token callback.
/// </returns>
function LME_GetInferenceTokenCallback(): LME_InferenceTokenCallback; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Sets the inference token callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure LME_SetInferenceTokenlCallback(
  const AHandler: LME_InferenceTokenCallback; const AUserData: Pointer); cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Gets the information callback.
/// </summary>
/// <returns>
///   The information callback.
/// </returns>
function LME_GetInfoCallback(): LME_InfoCallback; cdecl; external LMENGINE_DLL;

/// <summary>
///   Sets the information callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure LME_SetInfoCallback(const AHandler: LME_InfoCallback;
  const AUserData: Pointer); cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the load model progress callback.
/// </summary>
/// <returns>
///   The load model progress callback.
/// </returns>
function LME_GetLoadModelProgressCallback(): LME_LoadModelProgressCallback;
  cdecl; external LMENGINE_DLL;

/// <summary>
///   Sets the load model progress callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure LME_SetLoadModelProgressCallback(
  const AHandler: LME_LoadModelProgressCallback; const AUserData: Pointer);
  cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the load model callback.
/// </summary>
/// <returns>
///   The load model callback.
/// </returns>
function LME_GetLoadModelCallback(): LME_LoadModelCallback; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Sets the load model callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure LME_SetLoadModelCallback(const AHandler: LME_LoadModelCallback;
  const AUserData: Pointer); cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the inference start callback.
/// </summary>
/// <returns>
///   The inference start callback.
/// </returns>
function LME_GetInferenceStartCallback(): LME_InferenceStartCallback; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Sets the inference start callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure LME_SetInferenceStartCallback(
  const AHandler: LME_InferenceStartCallback; const AUserData: Pointer); cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Gets the inference end callback.
/// </summary>
/// <returns>
///   The inference end callback.
/// </returns>
function LME_GetInferenceEndCallback(): LME_InferenceEndCallback; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Sets the inference end callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
procedure LME_SetInferenceEndCallback(const AHandler: LME_InferenceEndCallback;
  const AUserData: Pointer); cdecl; external LMENGINE_DLL;

/// <summary>
///   Initializes configuration settings.
/// </summary>
/// <param name="AModelPath">
///   The path to the model.
/// </param>
/// <param name="ANumGPULayers">
///   The number of GPU layers.
/// </param>
/// <param name="ANumThreads">
///   The number of CPU threads.
/// </param>

procedure LME_InitConfig(const AModelPath: PWideChar;
  const ANumGPULayers, ANumThreads: Int32); cdecl; external LMENGINE_DLL;

/// <summary>
///   Saves configuration settings to a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to save the configuration to.
/// </param>
/// <returns>
///   True if the configuration was saved successfully, otherwise False.
/// </returns>
function LME_SaveConfig(const AFilename: PWideChar): Boolean; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Loads configuration settings from a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to load the configuration from.
/// </param>
/// <returns>
///   True if the configuration was loaded successfully, otherwise False.
/// </returns>
function LME_LoadConfig(const AFilename: PWideChar): Boolean; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Clears all inference messages.
/// </summary>
procedure LME_ClearAllMessages(); cdecl; external LMENGINE_DLL;

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
function LME_AddMessage(const ARole, AContent: PWideChar): Int32; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Gets the last user role inference message.
/// </summary>
/// <returns>
///   The last user role inference message.
/// </returns>
function LME_GetLastUserMessage(): PWideChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Returns an inference prompt for the specified model from current messages.
/// </summary>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <returns>
///   The inference prompt.
/// </returns>
function LME_BuildMessageInferencePrompt(
  const AModelName: PWideChar): PWideChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Clears all model definitions.
/// </summary>
procedure LME_ClearModelDefines(); cdecl; external LMENGINE_DLL;

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
function LME_DefineModel(const AModelFilename, AModelName: PWideChar;
  const AMaxContext: UInt32; const ATemplate,
  ATemplateEnd: PWideChar): Int32; cdecl; external LMENGINE_DLL;

/// <summary>
///   Saves all model definitions to a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to save the definitions to.
/// </param>
/// <returns>
///   True if the definitions were saved successfully, otherwise False.
/// </returns>
function LME_SaveModelDefines(const AFilename: PWideChar): Boolean; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Loads model definitions from a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to load the definitions from.
/// </param>
/// <returns>
///   True if the definitions were loaded successfully, otherwise False.
/// </returns>
function LME_LoadModelDefines(const AFilename: PWideChar): Boolean; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Loads the specified model.
/// </summary>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <returns>
///   True if the model was loaded successfully, otherwise False.
/// </returns>
function LME_LoadModel(const AModelName: PWideChar): Boolean; cdecl;
  external LMENGINE_DLL;

/// <summary>
///   Checks if a model is currently loaded.
/// </summary>
/// <returns>
///   True if a model is loaded, otherwise False.
/// </returns>
function LME_IsModelLoaded(): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Unloads the currently loaded model.
/// </summary>
procedure LME_UnloadModel(); cdecl; external LMENGINE_DLL;

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
function LME_RunInference(const AModelName: PWideChar;
  const AMaxTokens: UInt32): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the inference response from the currently loaded model.
/// </summary>
/// <returns>
///   The inference response.
/// </returns>
function LME_GetInferenceResponse(): PWideChar; cdecl; external LMENGINE_DLL;

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
procedure LME_GetInferenceStats(ATokenInputSpeed: PSingle;
  ATokenOutputSpeed: PSingle; AInputTokens: PInt32; AOutputTokens: PInt32;
  ATotalTokens: PInt32); cdecl; external LMENGINE_DLL;

type
  LME_LocalDb = type Pointer;

/// <summary>
///   Creates a new LocalDb object.
/// </summary>
/// <returns>
///   A new instance of LME_LocalDb.
/// </returns>
function  LME_LocalDb_New(): LME_LocalDb; cdecl; external LMENGINE_DLL;

/// <summary>
///   Destroys a LocalDb object.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to be destroyed.
/// </param>
procedure LME_LocalDb_Free(var ALocalDb: LME_LocalDb); cdecl; external LMENGINE_DLL;

/// <summary>
///   Checks if a LocalDb is open.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to check.
/// </param>
/// <returns>
///   True if the LocalDb is open, otherwise False.
/// </returns>
function  LME_LocalDb_IsOpen(const ALocalDb: LME_LocalDb): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Opens a LocalDb database file.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to open.
/// </param>
/// <param name="AFilename">
///   The filename of the database file to open.
/// </param>
/// <returns>
///   True if the database file was opened successfully, otherwise False.
/// </returns>
function  LME_LocalDb_Open(const ALocalDb: LME_LocalDb; const AFilename: PWideChar): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Closes a LocalDb database file.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to close.
/// </param>
procedure LME_LocalDb_Close(const ALocalDb: LME_LocalDb); cdecl; external LMENGINE_DLL;

/// <summary>
///   Clears SQL text from a LocalDb.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to clear SQL text from.
/// </param>
procedure LME_LocalDb_ClearSQLText(const ALocalDb: LME_LocalDb); cdecl; external LMENGINE_DLL;

/// <summary>
///   Adds SQL text to a LocalDb for processing.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to add SQL text to.
/// </param>
/// <param name="AText">
///   The SQL text to add.
/// </param>
procedure LME_LocalDb_AddSQLText(const ALocalDb: LME_LocalDb; const AText: PWideChar); cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets SQL text from a LocalDb.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to get SQL text from.
/// </param>
/// <returns>
///   The SQL text as a string.
/// </returns>
function  LME_LocalDb_GetSQLText(const ALocalDb: LME_LocalDb): PWideChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Sets SQL text in a LocalDb for processing. It will replace all existing text.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to set SQL text in.
/// </param>
/// <param name="AText">
///   The SQL text to set.
/// </param>
procedure LME_LocalDb_SetSQLText(const ALocalDb: LME_LocalDb; const AText: PWideChar); cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the prepared SQL text in a LocalDb. It will have macros and params expanded and set.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to get the prepared SQL text from.
/// </param>
/// <returns>
///   The prepared SQL text as a string.
/// </returns>
function  LME_LocalDb_GetPrepairedSQL(const ALocalDb: LME_LocalDb): PWideChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Clears all the macros defined in a LocalDb.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to clear macros from.
/// </param>
procedure LME_LocalDb_ClearMacros(const ALocalDb: LME_LocalDb); cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets a defined macro in a LocalDb.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to get the macro from.
/// </param>
/// <param name="AName">
///   The name of the macro to get.
/// </param>
/// <returns>
///   The macro value as a string.
/// </returns>
function  LME_LocalDb_GetMacro(const ALocalDb: LME_LocalDb; const AName: PWideChar): PWideChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Defines a macro in a LocalDb. A macro is declared in SQL text as &my_macro.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to define the macro in.
/// </param>
/// <param name="AName">
///   The name of the macro.
/// </param>
/// <param name="AValue">
///   The value of the macro.
/// </param>
procedure LME_LocalDb_SetMacro(const ALocalDb: LME_LocalDb; const AName, AValue: PWideChar); cdecl; external LMENGINE_DLL;

/// <summary>
///   Clears all params defined in a LocalDb.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to clear params from.
/// </param>
procedure LME_LocalDb_ClearParams(const ALocalDb: LME_LocalDb); cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets a defined param in a LocalDb.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to get the param from.
/// </param>
/// <param name="AName">
///   The name of the param to get.
/// </param>
/// <returns>
///   The param value as a string.
/// </returns>
function  LME_LocalDb_GetParam(const ALocalDb: LME_LocalDb; const AName: PWideChar): PWideChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Defines a param in a LocalDb. A param is declared in SQL text as :my_param.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to define the param in.
/// </param>
/// <param name="AName">
///   The name of the param.
/// </param>
/// <param name="AValue">
///   The value of the param.
/// </param>
procedure LME_LocalDb_SetParam(const ALocalDb: LME_LocalDb; const AName, AValue: PWideChar); cdecl; external LMENGINE_DLL;

/// <summary>
///   Returns the number of records in the last SQL operation in a LocalDb.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to get the record count from.
/// </param>
/// <returns>
///   The number of records in the last SQL operation.
/// </returns>
function  LME_LocalDb_GetRecordCount(const ALocalDb: LME_LocalDb): Integer; cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets a field value from the data returned in the last SQL operation in a LocalDb.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to get the field value from.
/// </param>
/// <param name="AIndex">
///   The index of the field.
/// </param>
/// <param name="AName">
///   The name of the field.
/// </param>
/// <returns>
///   The field value as a string.
/// </returns>
function  LME_LocalDb_GetField(const ALocalDb: LME_LocalDb; const AIndex: Cardinal; const AName: PWideChar): PWideChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Executes the current SQL text added in a LocalDb. All macros and params will be processed first.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to execute the SQL text in.
/// </param>
/// <returns>
///   True if the SQL text was executed successfully, otherwise False.
/// </returns>
function  LME_LocalDb_Execute(const ALocalDb: LME_LocalDb): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Directly executes the passed SQL text to a LocalDb. No macros and params will be processed.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to execute the SQL text in.
/// </param>
/// <param name="ASQL">
///   The SQL text to execute.
/// </param>
/// <returns>
///   True if the SQL text was executed successfully, otherwise False.
/// </returns>
function  LME_LocalDb_ExecuteSQL(const ALocalDb: LME_LocalDb; const ASQL: PWideChar): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the last error generated in a LocalDb.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to get the last error from.
/// </param>
/// <returns>
///   The last error message as a string.
/// </returns>
function  LME_LocalDb_GetLastError(const ALocalDb: LME_LocalDb): PWideChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Gets the JSON response text of the last SQL operation in a LocalDb.
/// </summary>
/// <param name="ALocalDb">
///   The LocalDb object to get the response text from.
/// </param>
/// <returns>
///   The JSON response text as a string.
/// </returns>
function  LME_LocalDb_GetResponseText(const ALocalDb: LME_LocalDb): PWideChar; cdecl; external LMENGINE_DLL;


implementation

uses
  Math;

initialization
{$IFNDEF FPC}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

  SetExceptionMask(GetExceptionMask + [exOverflow, exInvalidOp]);

end.
