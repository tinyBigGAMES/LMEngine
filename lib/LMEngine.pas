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
  /// <summary>
  ///   Name of inference DLL
  /// </summary>
  LMENGINE_DLL = 'LMEngine.dll';

  // Console linefeed & carriage return
  LF   = AnsiChar(#10);
  CR   = AnsiChar(#13);
  CRLF = LF+CR;

  // Virtual Keys

  /// <summary>
  ///   Keycode for escape key
  /// </summary>
  VK_ESC = 27;

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
  // Callbacks
  SpeechWordCallback = procedure(const ASender: Pointer; const AWord, AText: PAnsiChar); cdecl;
  LoadModelProgressCallback = function(const ASender: Pointer; const AModelName: PAnsiChar; const AProgress: Single): Boolean; cdecl;
  LoadModelCallback = procedure(const ASender: Pointer; const AModelName: PAnsiChar; const ASuccess: Boolean); cdecl;
  InferenceCancelCallback = function(const ASender: Pointer): Boolean; cdecl;
  InferenceNextTokenCallback = procedure(const ASender: Pointer; const AToken: PAnsiChar); cdecl;
  InfoCallback = procedure(const ASender: Pointer; const ALevel: Integer; const AText: PAnsiChar); cdecl;
  InferenceStartCallback = procedure(const ASender: Pointer); cdecl;
  InferenceEndCallback = procedure(const ASender: Pointer); cdecl;

/// <summary>
///   Process Windows messages. This function processes Windows messages.
/// </summary>
procedure Utils_ProcessMessages(); cdecl; external LMENGINE_DLL;

/// <summary>
///   This function masks out the first occurrence of a specified word found in the given text.
/// </summary>
/// <param name="AText">
///   The text in which to search for the word.
/// </param>
/// <param name="AWord">
///   The word to be masked out.
/// </param>
/// <returns>
///   A modified string with the first occurrence of the word masked out.
/// </returns>
function Utils_MaskFirstFoundWord(const AText, AWord: PAnsiChar): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Encode a wide string to a UTF-8 string, return pointer to buffer.
///   This function encodes a wide string (wchar_t) to a UTF-8 string and returns a pointer to the buffer containing the UTF-8 encoded string.
/// </summary>
/// <param name="AText">
///   The wide string (wchar_t) to be encoded.
/// </param>
/// <returns>
///   Pointer to the buffer containing the UTF-8 encoded string.
/// </returns>
function UTF8_Encode(const AText: PWideChar): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Decode a UTF-8 string buffer to ANSI string.
///   This function decodes a UTF-8 string buffer to an ANSI string and returns a pointer to the buffer containing the ANSI string.
/// </summary>
/// <param name="AText">
///   The UTF-8 string buffer to be decoded.
/// </param>
/// <returns>
///   Pointer to the buffer containing the ANSI string.
/// </returns>
function UTF8_Decode(const AText: PAnsiChar): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Free memory allocated by UTF8_Encode/UTF8_Decode.
///   This function frees the memory allocated by the UTF8_Encode and UTF8_Decode functions.
/// </summary>
/// <param name="AText">
///   Pointer to the buffer to be freed.
/// </param>
procedure UTF8_Free(const AText: PAnsiChar); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the cursor XY position on the console.
///   This function retrieves the current cursor XY position on the console.
/// </summary>
/// <param name="X">
///   Pointer to an integer to receive the X coordinate of the cursor.
/// </param>
/// <param name="Y">
///   Pointer to an integer to receive the Y coordinate of the cursor.
/// </param>
procedure Console_GetCursorPos(X, Y: PInteger); cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the cursor XY position on the console.
///   This function sets the cursor XY position on the console.
/// </summary>
/// <param name="X">
///   The X coordinate to set the cursor to.
/// </param>
/// <param name="Y">
///   The Y coordinate to set the cursor to.
/// </param>
procedure Console_SetCursorPos(const X, Y: Integer); cdecl; external LMENGINE_DLL;

/// <summary>
///   Clear the console.
///   This function clears the console.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Console_Clear(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Clear the current line of the console to a specified color.
///   This function clears the current line of the console and sets it to the specified color.
/// </summary>
/// <param name="AColor">
///   The color to set the cleared line to (default is FG_WHITE).
/// </param>
procedure Console_ClearLine(const AColor: WORD=FG_WHITE); cdecl; external LMENGINE_DLL;

/// <summary>
///   Print text to the console in a specified color.
///   This function prints the specified text to the console in the given color.
/// </summary>
/// <param name="AText">
///   The text to be printed.
/// </param>
/// <param name="AColor">
///   The color to print the text in.
/// </param>
procedure Console_Print(const AText: PAnsiChar; const AColor: WORD); cdecl; varargs; external LMENGINE_DLL;

/// <summary>
///   Print text to the console in a specified color with a linefeed.
///   This function prints the specified text to the console in the given color and appends a linefeed.
/// </summary>
/// <param name="AText">
///   The text to be printed.
/// </param>
/// <param name="AColor">
///   The color to print the text in.
/// </param>
procedure Console_PrintLn(const AText: PAnsiChar; const AColor: WORD); cdecl; varargs; external LMENGINE_DLL;

/// <summary>
///   Clear keyboard states.
///   This function clears the current keyboard states.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Console_ClearKeyStates(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Check if a key is being held down.
///   This function checks if a specified key is currently being held down.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key is being held down, otherwise False.
/// </returns>
function Console_IsKeyPressed(AKey: Byte): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Check if a key was released.
///   This function checks if a specified key was released.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key was released, otherwise False.
/// </returns>
function Console_WasKeyReleased(AKey: Byte): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Check if a key was pressed.
///   This function checks if a specified key was pressed.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key was pressed, otherwise False.
/// </returns>
function Console_WasKeyPressed(AKey: Byte): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Display a message on the console and wait for a key to be pressed to continue.
///   This function displays a message on the console and waits for a key to be pressed to continue. Optionally, it can force a pause and set the text color.
/// </summary>
/// <param name="AForcePause">
///   Whether to force a pause (default is False).
/// </param>
/// <param name="AColor">
///   The color of the message text (default is FG_WHITE).
/// </param>
/// <param name="AText">
///   The message text to display (default is nil).
/// </param>
procedure Console_Pause(const AForcePause: Boolean=False; AColor: WORD=FG_WHITE; const AText: PAnsiChar=nil); cdecl; external LMENGINE_DLL;

/// <summary>
///   Set a callback for each word spoken.
///   This function sets a callback handler that is invoked for each word spoken.
/// </summary>
/// <param name="ASender">
///   Pointer to the sender object.
/// </param>
/// <param name="AHandler">
///   The callback handler for the spoken words.
/// </param>
procedure Speech_SetWordCallback(const ASender: Pointer; const AHandler: SpeechWordCallback); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the word callback.
///   This function retrieves the current callback handler for spoken words.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The current SpeechWordCallback handler.
/// </returns>
function Speech_GetWordCallback(): SpeechWordCallback; cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the number of voices on the system.
///   This function returns the total number of voices available on the system.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The number of voices on the system as an integer.
/// </returns>
function Speech_GetVoiceCount(): Integer; cdecl; external LMENGINE_DLL;

/// <summary>
///   Get an attribute for a voice.
///   This function retrieves a specific attribute of a voice by its index.
/// </summary>
/// <param name="AIndex">
///   The index of the voice.
/// </param>
/// <param name="AAttribute">
///   The attribute to retrieve.
/// </param>
/// <returns>
///   The attribute value as a string.
/// </returns>
function Speech_GetVoiceAttribute(const AIndex: Integer; const AAttribute: Byte): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Change to a specified voice.
///   This function changes the current voice to the specified voice by its index.
/// </summary>
/// <param name="AIndex">
///   The index of the voice to change to.
/// </param>
procedure Speech_ChangeVoice(const AIndex: Integer); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get index of active voice.
///   This function retrieves the index of the currently active voice.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The index of the active voice as an integer.
/// </returns>
function Speech_GetVoice(): Integer; cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the voice volume (0-1).
///   This function sets the volume of the voice, with a range from 0 to 1.
/// </summary>
/// <param name="AVolume">
///   The volume level to set (0-1).
/// </param>
procedure Speech_SetVolume(const AVolume: Single); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the voice volume (0-1).
///   This function retrieves the current volume level of the voice.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The volume level as a single (0-1).
/// </returns>
function Speech_GetVolume(): Single; cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the voice speaking rate.
///   This function sets the speaking rate of the voice.
/// </summary>
/// <param name="ARate">
///   The speaking rate to set.
/// </param>
procedure Speech_SetRate(const ARate: Single); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the voice speaking rate.
///   This function retrieves the current speaking rate of the voice.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The speaking rate as a single.
/// </returns>
function Speech_GetRate(): Single; cdecl; external LMENGINE_DLL;

/// <summary>
///   Clear the currently speaking voice.
///   This function clears the currently speaking voice.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Speech_Clear(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Speak the text in the current voice, with the option to first purge any currently active speech.
///   This function speaks the given text in the current voice, with an option to purge any currently active speech before speaking.
/// </summary>
/// <param name="AText">
///   The text to be spoken.
/// </param>
/// <param name="APurge">
///   Boolean indicating whether to purge current speech first.
/// </param>
procedure Speech_Say(const AText: PAnsiChar; const APurge: Boolean); cdecl; external LMENGINE_DLL;

/// <summary>
///   Check if any voice is currently active.
///   This function checks if there is any active voice currently speaking.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   True if any voice is active, otherwise False.
/// </returns>
function Speech_Active(): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Pause the active voice.
///   This function pauses the currently active voice.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Speech_Pause(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Resume the active voice that was paused.
///   This function resumes the currently paused voice.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Speech_Resume(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Reset speech to a default and known state.
///   This function resets the speech system to a default and known state.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Speech_Reset(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Add a word phrase to be substituted.
///   This function adds a word or phrase to be substituted. Sometimes to make a word sound better, you have to alter the spelling. If that altered word is detected, it will substitute the defined word in the word callback.
/// </summary>
/// <param name="AWord">
///   The word to be substituted.
/// </param>
/// <param name="ASubstituteWord">
///   The substitute word to be used.
/// </param>
procedure Speech_SubstituteWord(const AWord, ASubstituteWord: PAnsiChar); cdecl; external LMENGINE_DLL;

/// <summary>
///   Return the version information string (full, major, minor, patch).
///   This function retrieves the version information string based on the specified type.
/// </summary>
/// <param name="AType">
///   The type of version information to retrieve (full, major, minor, patch).
/// </param>
/// <returns>
///   The version information string.
/// </returns>
function Version_Get(const AType: Byte): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Clear the current error message.
///   This function clears the current error message.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Error_Clear(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the current error message.
///   This function sets the current error message to the specified text.
/// </summary>
/// <param name="AText">
///   The error message text to set.
/// </param>
procedure Error_Set(const AText: PAnsiChar); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the current error message.
///   This function retrieves the current error message.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The current error message as a string.
/// </returns>
function Error_Get(): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the load model progress callback.
///   This function retrieves the current callback handler for load model progress.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The current LoadModelProgressCallback handler.
/// </returns>
function Callback_GetLoadModelProgress(): LoadModelProgressCallback; cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the load model progress callback.
///   This function sets the callback handler for load model progress.
/// </summary>
/// <param name="ASender">
///   Pointer to the sender object.
/// </param>
/// <param name="AHandler">
///   The callback handler for load model progress.
/// </param>
procedure Callback_SetLoadModelProgress(const ASender: Pointer; const AHandler: LoadModelProgressCallback); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the load model callback.
///   This function retrieves the current callback handler for loading models.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The current LoadModelCallback handler.
/// </returns>
function Callback_GetLoadModel(): LoadModelCallback; cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the load model callback.
///   This function sets the callback handler for loading models.
/// </summary>
/// <param name="ASender">
///   Pointer to the sender object.
/// </param>
/// <param name="AHandler">
///   The callback handler for loading models.
/// </param>
procedure Callback_SetLoadModel(const ASender: Pointer; const AHandler: LoadModelCallback); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the inference cancel callback.
///   This function retrieves the current callback handler for inference cancellation.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The current InferenceCancelCallback handler.
/// </returns>
function Callback_GetInferenceCancel(): InferenceCancelCallback; cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the inference cancel callback.
///   This function sets the callback handler for inference cancellation.
/// </summary>
/// <param name="ASender">
///   Pointer to the sender object.
/// </param>
/// <param name="AHandler">
///   The callback handler for inference cancellation.
/// </param>
procedure Callback_SetInferenceCancel(const ASender: Pointer; const AHandler: InferenceCancelCallback); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the inference next token callback.
///   This function retrieves the current callback handler for the next token in inference.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The current InferenceNextTokenCallback handler.
/// </returns>
function Callback_GetInferenceNextToken(): InferenceNextTokenCallback; cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the inference next token callback.
///   This function sets the callback handler for the next token in inference.
/// </summary>
/// <param name="ASender">
///   Pointer to the sender object.
/// </param>
/// <param name="AHandler">
///   The callback handler for the next token in inference.
/// </param>
procedure Callback_SetInferenceNextToken(const ASender: Pointer; const AHandler: InferenceNextTokenCallback); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the inference start callback.
///   This function retrieves the current callback handler for the start of inference.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The current InferenceStartCallback handler.
/// </returns>
function Callback_GetInferenceStart(): InferenceStartCallback; cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the inference start callback.
///   This function sets the callback handler for the start of inference.
/// </summary>
/// <param name="ASender">
///   Pointer to the sender object.
/// </param>
/// <param name="AHandler">
///   The callback handler for the start of inference.
/// </param>
procedure Callback_SetInferenceStart(const ASender: Pointer; const AHandler: InferenceStartCallback); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the inference end callback.
///   This function retrieves the current callback handler for the end of inference.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The current InferenceEndCallback handler.
/// </returns>
function Callback_GetInferenceEnd(): InferenceEndCallback; cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the inference end callback.
///   This function sets the callback handler for the end of inference.
/// </summary>
/// <param name="ASender">
///   Pointer to the sender object.
/// </param>
/// <param name="AHandler">
///   The callback handler for the end of inference.
/// </param>
procedure Callback_SetInferenceEnd(const ASender: Pointer; const AHandler: InferenceEndCallback); cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the info callback.
///   This function retrieves the current info callback handler.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The current InfoCallback handler.
/// </returns>
function Callback_GetInfo(): InfoCallback; cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the info callback.
///   This function sets the info callback handler.
/// </summary>
/// <param name="ASender">
///   Pointer to the sender object.
/// </param>
/// <param name="AHandler">
///   The callback handler for info.
/// </param>
procedure Callback_SetInfo(const ASender: Pointer; const AHandler: InfoCallback); cdecl; external LMENGINE_DLL;

/// <summary>
///   Set configuration information (model path, GPU layers).
///   This function sets configuration information including the model path and the number of GPU layers.
/// </summary>
/// <param name="AModelPath">
///   The path to the model.
/// </param>
/// <param name="ANumGPULayers">
///   The number of GPU layers to use.
/// </param>
procedure Config_Init(const AModelPath: PAnsiChar; const ANumGPULayers: Int32); cdecl; external LMENGINE_DLL;

/// <summary>
///   Save configuration information to a JSON file.
///   This function saves the current configuration information to a specified JSON file.
/// </summary>
/// <param name="AFilename">
///   The name of the file to save the configuration to.
/// </param>
/// <returns>
///   True if the configuration was saved successfully, otherwise False.
/// </returns>
function Config_Save(const AFilename: PAnsiChar): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Load configuration information from a JSON file.
///   This function loads configuration information from a specified JSON file.
/// </summary>
/// <param name="AFilename">
///   The name of the file to load the configuration from.
/// </param>
/// <returns>
///   True if the configuration was loaded successfully, otherwise False.
/// </returns>
function Config_Load(const AFilename: PAnsiChar): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Clear all inference messages.
///   This function clears all messages related to inference.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Message_ClearAll(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Add a new inference message (system, user, assistant, tool).
///   This function adds a new inference message with the specified role and content.
/// </summary>
/// <param name="ARole">
///   The role of the message (system, user, assistant, tool).
/// </param>
/// <param name="AContent">
///   The content of the message.
/// </param>
/// <returns>
///   The Index of the added message.
/// </returns>
function Message_Add(const ARole, AContent: PAnsiChar): Int32; cdecl; external LMENGINE_DLL;

/// <summary>
///   Add a new inference unicode message (system, user, assistant, tool).
///   This function adds a new inference unicode message with the specified role and content.
/// </summary>
/// <param name="ARole">
///   The role of the message (system, user, assistant, tool).
/// </param>
/// <param name="AContent">
///   The content of the message.
/// </param>
/// <returns>
///   The Index of the added message.
/// </returns>
function  Message_AddW(const ARole: PAnsiChar; AContent: PWideChar): Int32; cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the last user message added.
///   This function retrieves the last user message that was added.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The last user message as a string.
/// </returns>
function Message_GetLastUser(): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Build a prompt of messages that can be sent to the LLM to do inference on.
///   This function builds a prompt from the messages that can be sent to the language model for inference.
/// </summary>
/// <param name="AModelName">
///   The name of the model to use for building the prompt.
/// </param>
/// <returns>
///   The built prompt as a string.
/// </returns>
function Message_BuildInferencePrompt(const AModelName: PAnsiChar): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Clear all model defines.
///   This function clears all model definitions.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Model_ClearDefines(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Define a model that can be used by the system for doing inference.
///   This function defines a model with the specified parameters that can be used by the system for inference.
/// </summary>
/// <param name="AModelFilename">
///   The filename of the model.
/// </param>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <param name="AMaxContext">
///   The maximum context size for the model.
/// </param>
/// <param name="ACustomTemplate">
///   The custom template to use for the model.
/// </param>
/// <param name="ACustomTemplateEnd">
///   The custom end template to use for the model.
/// </param>
/// <returns>
///   The index of the defined model.
/// </returns>
function Model_Define(const AModelFilename, AModelName: PAnsiChar; const AMaxContext: UInt32; const ACustomTemplate, ACustomTemplateEnd: PAnsiChar): Int32; cdecl; external LMENGINE_DLL;

/// <summary>
///   Save all the model defines to a JSON file.
///   This function saves all the model definitions to a specified JSON file.
/// </summary>
/// <param name="AFilename">
///   The name of the file to save the model definitions to.
/// </param>
/// <returns>
///   True if the model definitions were saved successfully, otherwise False.
/// </returns>
function Model_SaveDefines(const AFilename: PAnsiChar): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Load model defines from a JSON file.
///   This function loads model definitions from a specified JSON file.
/// </summary>
/// <param name="AFilename">
///   The name of the file to load the model definitions from.
/// </param>
/// <returns>
///   True if the model definitions were loaded successfully, otherwise False.
/// </returns>
function Model_LoadDefines(const AFilename: PAnsiChar): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Load a model that has been defined from its reference name.
///   This function loads a model that has been defined using its reference name.
/// </summary>
/// <param name="AModelName">
///   The reference name of the model to load.
/// </param>
/// <returns>
///   True if the model was loaded successfully, otherwise False.
/// </returns>
function Model_Load(const AModelName: PAnsiChar): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Check if a model has been loaded.
///   This function checks if a model is currently loaded.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   True if a model is loaded, otherwise False.
/// </returns>
function Model_IsLoaded(): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Unload loaded model, releasing all allocated resources.
///   This function unloads the currently loaded model and releases all allocated resources.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Model_Unload(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Run inference on messages until complete. If the model is currently not loaded, it will automatically load.
///   This function runs inference on the messages until completion. If the model is not currently loaded, it will automatically load the model.
/// </summary>
/// <param name="AModelName">
///   The name of the model to use for inference.
/// </param>
/// <param name="AMaxTokens">
///   The maximum number of tokens for inference.
/// </param>
/// <returns>
///   True if inference was successful, otherwise False.
/// </returns>
function Inference_Run(const AModelName: PAnsiChar; const AMaxTokens: UInt32): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Start inference on messages. If the model is currently not loaded, it will automatically load.
///   This function starts inference on the messages. If the model is not currently loaded, it will automatically load the model.
/// </summary>
/// <param name="AModelName">
///   The name of the model to use for inference.
/// </param>
/// <param name="AMaxTokens">
///   The maximum number of tokens for inference.
/// </param>
/// <returns>
///   True if inference started successfully, otherwise False.
/// </returns>
function Inference_Start(const AModelName: PAnsiChar; const AMaxTokens: UInt32): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Check if inference is currently active.
///   This function checks if inference is currently active.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   True if inference is active, otherwise False.
/// </returns>
function Inference_IsActive(): Boolean; cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the next token of the currently active inference session.
///   This function retrieves the next token from the currently active inference session.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The next token as a string.
/// </returns>
function Inference_GetNextToken(): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Stop active inference processing.
///   This function stops the currently active inference processing.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
procedure Inference_Stop(); cdecl; external LMENGINE_DLL;

/// <summary>
///   Return the entire inference response.
///   This function returns the entire response from the inference session.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   The entire inference response as a string.
/// </returns>
function Inference_GetResponse(): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Return usage about the last inference (input/output/total tokens, input/output speed).
///   This function returns usage information about the last inference, including input/output/total tokens and input/output speed.
/// </summary>
/// <param name="ATokenInputSpeed">
///   Pointer to receive the token input speed.
/// </param>
/// <param name="ATokenOutputSpeed">
///   Pointer to receive the token output speed.
/// </param>
/// <param name="AInputTokens">
///   Pointer to receive the number of input tokens.
/// </param>
/// <param name="AOutputTokens">
///   Pointer to receive the number of output tokens.
/// </param>
/// <param name="ATotalTokens">
///   Pointer to receive the total number of tokens.
/// </param>
procedure Inference_GetUsage(ATokenInputSpeed, ATokenOutputSpeed: System.PSingle; AInputTokens, AOutputTokens, ATotalTokens: PInteger); cdecl; external LMENGINE_DLL;

/// <summary>
///   Set the right console margin for token output response.
///   This function sets the right margin for token output response on the console.
/// </summary>
/// <param name="AMargin">
///   The right margin to set.
/// </param>
procedure TokenResponse_SetRightMargin(const AMargin: Integer); cdecl; external LMENGINE_DLL;

/// <summary>
///   Add a new token for response.
///   This function adds a new token for the response.
/// </summary>
/// <param name="AToken">
///   The token to add.
/// </param>
/// <returns>
///   The index of the added token.
/// </returns>
function TokenResponse_AddToken(const AToken: PAnsiChar): Integer; cdecl; external LMENGINE_DLL;

/// <summary>
///   Get the last word of token response.
///   This function retrieves the last word from the token response.
/// </summary>
/// <param name="ATrimLeft">
///   Boolean indicating whether to trim the left side of the word.
/// </param>
/// <returns>
///   The last word as a string.
/// </returns>
function TokenResponse_LastWord(const ATrimLeft: Boolean): PAnsiChar; cdecl; external LMENGINE_DLL;

/// <summary>
///   Check if there are more tokens to respond to.
///   This function checks if there are more tokens to respond to.
/// </summary>
/// <param name="">
/// 
///   None.
/// </param>
/// <returns>
///   True if there are more tokens, otherwise False.
/// </returns>
function TokenResponse_Finalize(): Boolean; cdecl; external LMENGINE_DLL;

implementation

uses
  Math;

initialization
{$IFNDEF FPC}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

  SetExceptionMask(GetExceptionMask + [exOverflow, exInvalidOp]);

end.
