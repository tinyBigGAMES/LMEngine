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
  LF   = AnsiChar(#10);
  CR   = AnsiChar(#13);
  CRLF = LF+CR;

  // Virtual Keys
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

{@@
Summary:
  Process Windows messages.
Description:
  This function processes Windows messages.
Parameters:
  None.
Returns:
  None.
}
procedure Utils_ProcessMessages(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Mask out the first occurrence of a word found in text.
Description:
  This function masks out the first occurrence of a specified word found in the given text.
Parameters:
  AText - The text in which to search for the word.
  AWord - The word to be masked out.
Returns:
  A modified string with the first occurrence of the word masked out.
}
function Utils_MaskFirstFoundWord(const AText, AWord: PAnsiChar): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Encode a wide string to a UTF-8 string, return pointer to buffer.
Description:
  This function encodes a wide string (wchar_t) to a UTF-8 string and returns a pointer to the buffer containing the UTF-8 encoded string.
Parameters:
  AText - The wide string (wchar_t) to be encoded.
Returns:
  Pointer to the buffer containing the UTF-8 encoded string.
}
function UTF8_Encode(const AText: PWideChar): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Decode a UTF-8 string buffer to ANSI string.
Description:
  This function decodes a UTF-8 string buffer to an ANSI string and returns a pointer to the buffer containing the ANSI string.
Parameters:
  AText - The UTF-8 string buffer to be decoded.
Returns:
  Pointer to the buffer containing the ANSI string.
}
function UTF8_Decode(const AText: PAnsiChar): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Free memory allocated by UTF8_Encode/UTF8_Decode.
Description:
  This function frees the memory allocated by the UTF8_Encode and UTF8_Decode functions.
Parameters:
  AText - Pointer to the buffer to be freed.
Returns:
  None.
}
procedure UTF8_Free(const AText: PAnsiChar); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the cursor XY position on the console.
Description:
  This function retrieves the current cursor XY position on the console.
Parameters:
  X - Pointer to an integer to receive the X coordinate of the cursor.
  Y - Pointer to an integer to receive the Y coordinate of the cursor.
Returns:
  None.
}
procedure Console_GetCursorPos(X, Y: PInteger); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the cursor XY position on the console.
Description:
  This function sets the cursor XY position on the console.
Parameters:
  X - The X coordinate to set the cursor to.
  Y - The Y coordinate to set the cursor to.
Returns:
  None.
}
procedure Console_SetCursorPos(const X, Y: Integer); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Clear the console.
Description:
  This function clears the console.
Parameters:
  None.
Returns:
  None.
}
procedure Console_Clear(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Clear the current line of the console to a specified color.
Description:
  This function clears the current line of the console and sets it to the specified color.
Parameters:
  AColor - The color to set the cleared line to (default is FG_WHITE).
Returns:
  None.
}
procedure Console_ClearLine(const AColor: WORD=FG_WHITE); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Print text to the console in a specified color.
Description:
  This function prints the specified text to the console in the given color.
Parameters:
  AText - The text to be printed.
  AColor - The color to print the text in.
Returns:
  None.
}
procedure Console_Print(const AText: PAnsiChar; const AColor: WORD); cdecl; varargs; external LMENGINE_DLL;

{@@
Summary:
  Print text to the console in a specified color with a linefeed.
Description:
  This function prints the specified text to the console in the given color and appends a linefeed.
Parameters:
  AText - The text to be printed.
  AColor - The color to print the text in.
Returns:
  None.
}
procedure Console_PrintLn(const AText: PAnsiChar; const AColor: WORD); cdecl; varargs; external LMENGINE_DLL;

{@@
Summary:
  Clear keyboard states.
Description:
  This function clears the current keyboard states.
Parameters:
  None.
Returns:
  None.
}
procedure Console_ClearKeyStates(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Check if a key is being held down.
Description:
  This function checks if a specified key is currently being held down.
Parameters:
  AKey - The key to check.
Returns:
  True if the key is being held down, otherwise False.
}
function Console_IsKeyPressed(AKey: Byte): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Check if a key was released.
Description:
  This function checks if a specified key was released.
Parameters:
  AKey - The key to check.
Returns:
  True if the key was released, otherwise False.
}
function Console_WasKeyReleased(AKey: Byte): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Check if a key was pressed.
Description:
  This function checks if a specified key was pressed.
Parameters:
  AKey - The key to check.
Returns:
  True if the key was pressed, otherwise False.
}
function Console_WasKeyPressed(AKey: Byte): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Display a message on the console and wait for a key to be pressed to continue.
Description:
  This function displays a message on the console and waits for a key to be pressed to continue. Optionally, it can force a pause and set the text color.
Parameters:
  AForcePause - Whether to force a pause (default is False).
  AColor - The color of the message text (default is FG_WHITE).
  AText - The message text to display (default is nil).
Returns:
  None.
}
procedure Console_Pause(const AForcePause: Boolean=False; AColor: WORD=FG_WHITE; const AText: PAnsiChar=nil); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set a callback for each word spoken.
Description:
  This function sets a callback handler that is invoked for each word spoken.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for the spoken words.
Returns:
  None.
}
procedure Speech_SetWordCallback(const ASender: Pointer; const AHandler: SpeechWordCallback); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the word callback.
Description:
  This function retrieves the current callback handler for spoken words.
Parameters:
  None.
Returns:
  The current SpeechWordCallback handler.
}
function Speech_GetWordCallback(): SpeechWordCallback; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the number of voices on the system.
Description:
  This function returns the total number of voices available on the system.
Parameters:
  None.
Returns:
  The number of voices on the system as an integer.
}
function Speech_GetVoiceCount(): Integer; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get an attribute for a voice.
Description:
  This function retrieves a specific attribute of a voice by its index.
Parameters:
  AIndex - The index of the voice.
  AAttribute - The attribute to retrieve.
Returns:
  The attribute value as a string.
}
function Speech_GetVoiceAttribute(const AIndex: Integer; const AAttribute: Byte): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Change to a specified voice.
Description:
  This function changes the current voice to the specified voice by its index.
Parameters:
  AIndex - The index of the voice to change to.
Returns:
  None.
}
procedure Speech_ChangeVoice(const AIndex: Integer); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get index of active voice.
Description:
  This function retrieves the index of the currently active voice.
Parameters:
  None.
Returns:
  The index of the active voice as an integer.
}
function Speech_GetVoice(): Integer; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the voice volume (0-1).
Description:
  This function sets the volume of the voice, with a range from 0 to 1.
Parameters:
  AVolume - The volume level to set (0-1).
Returns:
  None.
}
procedure Speech_SetVolume(const AVolume: Single); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the voice volume (0-1).
Description:
  This function retrieves the current volume level of the voice.
Parameters:
  None.
Returns:
  The volume level as a single (0-1).
}
function Speech_GetVolume(): Single; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the voice speaking rate.
Description:
  This function sets the speaking rate of the voice.
Parameters:
  ARate - The speaking rate to set.
Returns:
  None.
}
procedure Speech_SetRate(const ARate: Single); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the voice speaking rate.
Description:
  This function retrieves the current speaking rate of the voice.
Parameters:
  None.
Returns:
  The speaking rate as a single.
}
function Speech_GetRate(): Single; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Clear the currently speaking voice.
Description:
  This function clears the currently speaking voice.
Parameters:
  None.
Returns:
  None.
}
procedure Speech_Clear(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Speak the text in the current voice, with the option to first purge any currently active speech.
Description:
  This function speaks the given text in the current voice, with an option to purge any currently active speech before speaking.
Parameters:
  AText - The text to be spoken.
  APurge - Boolean indicating whether to purge current speech first.
Returns:
  None.
}
procedure Speech_Say(const AText: PAnsiChar; const APurge: Boolean); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Check if any voice is currently active.
Description:
  This function checks if there is any active voice currently speaking.
Parameters:
  None.
Returns:
  True if any voice is active, otherwise False.
}
function Speech_Active(): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Pause the active voice.
Description:
  This function pauses the currently active voice.
Parameters:
  None.
Returns:
  None.
}
procedure Speech_Pause(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Resume the active voice that was paused.
Description:
  This function resumes the currently paused voice.
Parameters:
  None.
Returns:
  None.
}
procedure Speech_Resume(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Reset speech to a default and known state.
Description:
  This function resets the speech system to a default and known state.
Parameters:
  None.
Returns:
  None.
}
procedure Speech_Reset(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Add a word phrase to be substituted.
Description:
  This function adds a word or phrase to be substituted. Sometimes to make a word sound better, you have to alter the spelling. If that altered word is detected, it will substitute the defined word in the word callback.
Parameters:
  AWord - The word to be substituted.
  ASubstituteWord - The substitute word to be used.
Returns:
  None.
}
procedure Speech_SubstituteWord(const AWord, ASubstituteWord: PAnsiChar); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Return the version information string (full, major, minor, patch).
Description:
  This function retrieves the version information string based on the specified type.
Parameters:
  AType - The type of version information to retrieve (full, major, minor, patch).
Returns:
  The version information string.
}
function Version_Get(const AType: Byte): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Clear the current error message.
Description:
  This function clears the current error message.
Parameters:
  None.
Returns:
  None.
}
procedure Error_Clear(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the current error message.
Description:
  This function sets the current error message to the specified text.
Parameters:
  AText - The error message text to set.
Returns:
  None.
}
procedure Error_Set(const AText: PAnsiChar); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the current error message.
Description:
  This function retrieves the current error message.
Parameters:
  None.
Returns:
  The current error message as a string.
}
function Error_Get(): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the load model progress callback.
Description:
  This function retrieves the current callback handler for load model progress.
Parameters:
  None.
Returns:
  The current LoadModelProgressCallback handler.
}
function Callback_GetLoadModelProgress(): LoadModelProgressCallback; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the load model progress callback.
Description:
  This function sets the callback handler for load model progress.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for load model progress.
Returns:
  None.
}
procedure Callback_SetLoadModelProgress(const ASender: Pointer; const AHandler: LoadModelProgressCallback); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the load model callback.
Description:
  This function retrieves the current callback handler for loading models.
Parameters:
  None.
Returns:
  The current LoadModelCallback handler.
}
function Callback_GetLoadModel(): LoadModelCallback; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the load model callback.
Description:
  This function sets the callback handler for loading models.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for loading models.
Returns:
  None.
}
procedure Callback_SetLoadModel(const ASender: Pointer; const AHandler: LoadModelCallback); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the inference cancel callback.
Description:
  This function retrieves the current callback handler for inference cancellation.
Parameters:
  None.
Returns:
  The current InferenceCancelCallback handler.
}
function Callback_GetInferenceCancel(): InferenceCancelCallback; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the inference cancel callback.
Description:
  This function sets the callback handler for inference cancellation.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for inference cancellation.
Returns:
  None.
}
procedure Callback_SetInferenceCancel(const ASender: Pointer; const AHandler: InferenceCancelCallback); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the inference next token callback.
Description:
  This function retrieves the current callback handler for the next token in inference.
Parameters:
  None.
Returns:
  The current InferenceNextTokenCallback handler.
}
function Callback_GetInferenceNextToken(): InferenceNextTokenCallback; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the inference next token callback.
Description:
  This function sets the callback handler for the next token in inference.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for the next token in inference.
Returns:
  None.
}
procedure Callback_SetInferenceNextToken(const ASender: Pointer; const AHandler: InferenceNextTokenCallback); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the inference start callback.
Description:
  This function retrieves the current callback handler for the start of inference.
Parameters:
  None.
Returns:
  The current InferenceStartCallback handler.
}
function Callback_GetInferenceStart(): InferenceStartCallback; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the inference start callback.
Description:
  This function sets the callback handler for the start of inference.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for the start of inference.
Returns:
  None.
}
procedure Callback_SetInferenceStart(const ASender: Pointer; const AHandler: InferenceStartCallback); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the inference end callback.
Description:
  This function retrieves the current callback handler for the end of inference.
Parameters:
  None.
Returns:
  The current InferenceEndCallback handler.
}
function Callback_GetInferenceEnd(): InferenceEndCallback; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the inference end callback.
Description:
  This function sets the callback handler for the end of inference.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for the end of inference.
Returns:
  None.
}
procedure Callback_SetInferenceEnd(const ASender: Pointer; const AHandler: InferenceEndCallback); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the info callback.
Description:
  This function retrieves the current info callback handler.
Parameters:
  None.
Returns:
  The current InfoCallback handler.
}
function Callback_GetInfo(): InfoCallback; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the info callback.
Description:
  This function sets the info callback handler.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for info.
Returns:
  None.
}
procedure Callback_SetInfo(const ASender: Pointer; const AHandler: InfoCallback); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set configuration information (model path, GPU layers).
Description:
  This function sets configuration information including the model path and the number of GPU layers.
Parameters:
  AModelPath - The path to the model.
  ANumGPULayers - The number of GPU layers to use.
Returns:
  None.
}
procedure Config_Init(const AModelPath: PAnsiChar; const ANumGPULayers: Int32); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Save configuration information to a JSON file.
Description:
  This function saves the current configuration information to a specified JSON file.
Parameters:
  AFilename - The name of the file to save the configuration to.
Returns:
  True if the configuration was saved successfully, otherwise False.
}
function Config_Save(const AFilename: PAnsiChar): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Load configuration information from a JSON file.
Description:
  This function loads configuration information from a specified JSON file.
Parameters:
  AFilename - The name of the file to load the configuration from.
Returns:
  True if the configuration was loaded successfully, otherwise False.
}
function Config_Load(const AFilename: PAnsiChar): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Clear all inference messages.
Description:
  This function clears all messages related to inference.
Parameters:
  None.
Returns:
  None.
}
procedure Message_ClearAll(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Add a new inference message (system, user, assistant, tool).
Description:
  This function adds a new inference message with the specified role and content.
Parameters:
  ARole - The role of the message (system, user, assistant, tool).
  AContent - The content of the message.
Returns:
  The Index of the added message.
}
function Message_Add(const ARole, AContent: PAnsiChar): Int32; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Add a new inference unicode message (system, user, assistant, tool).
Description:
  This function adds a new inference unicode message with the specified role and content.
Parameters:
  ARole - The role of the message (system, user, assistant, tool).
  AContent - The content of the message.
Returns:
  The Index of the added message.
}
function  Message_AddW(const ARole: PAnsiChar; AContent: PWideChar): Int32; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the last user message added.
Description:
  This function retrieves the last user message that was added.
Parameters:
  None.
Returns:
  The last user message as a string.
}
function Message_GetLastUser(): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Build a prompt of messages that can be sent to the LLM to do inference on.
Description:
  This function builds a prompt from the messages that can be sent to the language model for inference.
Parameters:
  AModelName - The name of the model to use for building the prompt.
Returns:
  The built prompt as a string.
}
function Message_BuildInferencePrompt(const AModelName: PAnsiChar): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Clear all model defines.
Description:
  This function clears all model definitions.
Parameters:
  None.
Returns:
  None.
}
procedure Model_ClearDefines(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Define a model that can be used by the system for doing inference.
Description:
  This function defines a model with the specified parameters that can be used by the system for inference.
Parameters:
  AModelFilename - The filename of the model.
  AModelName - The name of the model.
  AMaxContext - The maximum context size for the model.
  ACustomTemplate - The custom template to use for the model.
  ACustomTemplateEnd - The custom end template to use for the model.
Returns:
  The index of the defined model.
}
function Model_Define(const AModelFilename, AModelName: PAnsiChar; const AMaxContext: UInt32; const ACustomTemplate, ACustomTemplateEnd: PAnsiChar): Int32; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Save all the model defines to a JSON file.
Description:
  This function saves all the model definitions to a specified JSON file.
Parameters:
  AFilename - The name of the file to save the model definitions to.
Returns:
  True if the model definitions were saved successfully, otherwise False.
}
function Model_SaveDefines(const AFilename: PAnsiChar): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Load model defines from a JSON file.
Description:
  This function loads model definitions from a specified JSON file.
Parameters:
  AFilename - The name of the file to load the model definitions from.
Returns:
  True if the model definitions were loaded successfully, otherwise False.
}
function Model_LoadDefines(const AFilename: PAnsiChar): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Load a model that has been defined from its reference name.
Description:
  This function loads a model that has been defined using its reference name.
Parameters:
  AModelName - The reference name of the model to load.
Returns:
  True if the model was loaded successfully, otherwise False.
}
function Model_Load(const AModelName: PAnsiChar): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Check if a model has been loaded.
Description:
  This function checks if a model is currently loaded.
Parameters:
  None.
Returns:
  True if a model is loaded, otherwise False.
}
function Model_IsLoaded(): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Unload loaded model, releasing all allocated resources.
Description:
  This function unloads the currently loaded model and releases all allocated resources.
Parameters:
  None.
Returns:
  None.
}
procedure Model_Unload(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Run inference on messages until complete. If the model is currently not loaded, it will automatically load.
Description:
  This function runs inference on the messages until completion. If the model is not currently loaded, it will automatically load the model.
Parameters:
  AModelName - The name of the model to use for inference.
  AMaxTokens - The maximum number of tokens for inference.
Returns:
  True if inference was successful, otherwise False.
}
function Inference_Run(const AModelName: PAnsiChar; const AMaxTokens: UInt32): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Start inference on messages. If the model is currently not loaded, it will automatically load.
Description:
  This function starts inference on the messages. If the model is not currently loaded, it will automatically load the model.
Parameters:
  AModelName - The name of the model to use for inference.
  AMaxTokens - The maximum number of tokens for inference.
Returns:
  True if inference started successfully, otherwise False.
}
function Inference_Start(const AModelName: PAnsiChar; const AMaxTokens: UInt32): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Check if inference is currently active.
Description:
  This function checks if inference is currently active.
Parameters:
  None.
Returns:
  True if inference is active, otherwise False.
}
function Inference_IsActive(): Boolean; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the next token of the currently active inference session.
Description:
  This function retrieves the next token from the currently active inference session.
Parameters:
  None.
Returns:
  The next token as a string.
}
function Inference_GetNextToken(): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Stop active inference processing.
Description:
  This function stops the currently active inference processing.
Parameters:
  None.
Returns:
  None.
}
procedure Inference_Stop(); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Return the entire inference response.
Description:
  This function returns the entire response from the inference session.
Parameters:
  None.
Returns:
  The entire inference response as a string.
}
function Inference_GetResponse(): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Return usage about the last inference (input/output/total tokens, input/output speed).
Description:
  This function returns usage information about the last inference, including input/output/total tokens and input/output speed.
Parameters:
  ATokenInputSpeed - Pointer to receive the token input speed.
  ATokenOutputSpeed - Pointer to receive the token output speed.
  AInputTokens - Pointer to receive the number of input tokens.
  AOutputTokens - Pointer to receive the number of output tokens.
  ATotalTokens - Pointer to receive the total number of tokens.
Returns:
  None.
}
procedure Inference_GetUsage(ATokenInputSpeed, ATokenOutputSpeed: System.PSingle; AInputTokens, AOutputTokens, ATotalTokens: PInteger); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Set the right console margin for token output response.
Description:
  This function sets the right margin for token output response on the console.
Parameters:
  AMargin - The right margin to set.
Returns:
  None.
}
procedure TokenResponse_SetRightMargin(const AMargin: Integer); cdecl; external LMENGINE_DLL;

{@@
Summary:
  Add a new token for response.
Description:
  This function adds a new token for the response.
Parameters:
  AToken - The token to add.
Returns:
  The index of the added token.
}
function TokenResponse_AddToken(const AToken: PAnsiChar): Integer; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Get the last word of token response.
Description:
  This function retrieves the last word from the token response.
Parameters:
  ATrimLeft - Boolean indicating whether to trim the left side of the word.
Returns:
  The last word as a string.
}
function TokenResponse_LastWord(const ATrimLeft: Boolean): PAnsiChar; cdecl; external LMENGINE_DLL;

{@@
Summary:
  Check if there are more tokens to respond to.
Description:
  This function checks if there are more tokens to respond to.
Parameters:
  None.
Returns:
  True if there are more tokens, otherwise False.
}
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
