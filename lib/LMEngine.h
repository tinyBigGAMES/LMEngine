/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
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
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#ifndef LMENGINE_H
#define LMENGINE_H

// check for supported platform
#ifndef _WIN64
#error "Unsupported platform"
#endif

// link in LMEngine.lib
#pragma comment(lib,"LMEngine.lib")

#ifdef __cplusplus
extern "C" {
#endif

#include <stdbool.h>
#include <wchar.h>

// Console linefeed & carriage return
#define LF   '\n'
#define CR   '\r'
#define CRLF "\n\r"

// Virtual Keys
#define VK_ESC 27

// Primary console colors
#define FG_BLUE         1
#define FG_GREEN        2
#define FG_RED          4
#define FG_INTENSITY    8
#define BG_BLUE         16
#define BG_GREEN        32
#define BG_RED          64
#define BG_INTENSITY    128

// Custom console color
#define FG_BRIGHTYELLOW (FG_RED | FG_GREEN | FG_INTENSITY)
#define FG_YELLOW       (FG_RED | FG_GREEN)
#define FG_WHITE        (FG_RED | FG_GREEN | FG_BLUE)
#define FG_BRIGHTWHITE  (FG_WHITE | FG_INTENSITY)
#define FG_DARKGREEN    FG_GREEN
#define FG_LIGHTGREEN   (FG_GREEN | FG_INTENSITY)
#define FG_DARKGRAY     FG_INTENSITY
#define FG_CYAN         (FG_GREEN | FG_BLUE)
#define FG_MAGENTA      (FG_RED | FG_BLUE)

#define BG_BRIGHTYELLOW (BG_RED | BG_GREEN | BG_INTENSITY)
#define BG_YELLOW       (BG_RED | BG_GREEN)
#define BG_WHITE        (BG_RED | BG_GREEN | BG_BLUE)
#define BG_BRIGHTWHITE  (BG_WHITE | BG_INTENSITY)
#define BG_DARKGREEN    BG_GREEN
#define BG_LIGHTGREEN   (BG_GREEN | BG_INTENSITY)
#define BG_DARKGRAY     BG_INTENSITY
#define BG_CYAN         (BG_GREEN | FG_BLUE)
#define BG_MAGENTA      (BG_RED | FG_BLUE)

// Message roles
#define ROLE_SYSTEM    "system"
#define ROLE_USER      "user"
#define ROLE_ASSISTANT "assistant"
#define ROLE_TOOL      "tool"

// Speech Voice Attributes
#define SPEECH_VOICEATTR_DESCRIPTION 0
#define SPEECH_VOICEATTR_NAME        1
#define SPEECH_VOICEATTR_VENDOR      2
#define SPEECH_VOICEATTR_AGE         3
#define SPEECH_VOICEATTR_GENDER      4
#define SPEECH_VOICEATTR_LANGUAGE    5
#define SPEECH_VOICEATTR_ID          6

// Token Response
#define TOKENRESPONSE_WAIT    0
#define TOKENRESPONSE_APPEND  1
#define TOKENRESPONSE_NEWLINE 2

// Version
#define VERSION_FULL  0
#define VERSION_MAJOR 1
#define VERSION_MINOR 2
#define VERSION_PATCH 3

// Callbacks
typedef void (*SpeechWordCallback)(const void* ASender, const char* AWord, const char* AText);
typedef bool (*LoadModelProgressCallback)(const void* ASender, const char* AModelName, float AProgress);
typedef void (*LoadModelCallback)(const void* ASender, const char* AModelName, bool ASuccess);
typedef bool (*InferenceCancelCallback)(const void* ASender);
typedef void (*InferenceNextTokenCallback)(const void* ASender, const char* AToken);
typedef void (*InfoCallback)(const void* ASender, int ALevel, const char* AText);
typedef void (*InferenceStartCallback)(const void* ASender);
typedef void (*InferenceEndCallback)(const void* ASender);

//--- UTILS -----------------------------------------------------------------
/*
Summary:
  Process Windows messages.
Description:
  This function processes Windows messages.
Parameters:
  None.
Returns:
  None.
*/
extern void Utils_ProcessMessages();

/*
Summary:
  Mask out the first occurrence of a word found in text.
Description:
  This function masks out the first occurrence of a specified word found in the given text.
Parameters:
  AText - The text in which to search for the word.
  AWord - The word to be masked out.
Returns:
  A modified string with the first occurrence of the word masked out.
*/
extern char* Utils_MaskFirstFoundWord(const char* AText, const char* AWord);

//--- UTF8 ------------------------------------------------------------------
/*
Summary:
  Encode a wide string to a UTF-8 string, return pointer to buffer.
Description:
  This function encodes a wide string (wchar_t) to a UTF-8 string and returns a pointer to the buffer containing the UTF-8 encoded string.
Parameters:
  AText - The wide string (wchar_t) to be encoded.
Returns:
  Pointer to the buffer containing the UTF-8 encoded string.
*/
extern char * __cdecl UTF8_Encode(const wchar_t * AText);

/*
Summary:
  Decode a UTF-8 string buffer to ANSI string.
Description:
  This function decodes a UTF-8 string buffer to an ANSI string and returns a pointer to the buffer containing the ANSI string.
Parameters:
  AText - The UTF-8 string buffer to be decoded.
Returns:
  Pointer to the buffer containing the ANSI string.
*/
extern char * __cdecl UTF8_Decode(const char * AText);

/*
Summary:
  Free memory allocated by UTF8_Encode/UTF8_Decode.
Description:
  This function frees the memory allocated by the UTF8_Encode and UTF8_Decode functions.
Parameters:
  AText - Pointer to the buffer to be freed.
Returns:
  None.
*/
extern void __cdecl UTF8_Free(const char * AText);

//--- CONSOLE ---------------------------------------------------------------
/*
Summary:
  Get the cursor XY position on the console.
Description:
  This function retrieves the current cursor XY position on the console.
Parameters:
  X - Pointer to an integer to receive the X coordinate of the cursor.
  Y - Pointer to an integer to receive the Y coordinate of the cursor.
Returns:
  None.
*/
extern void Console_GetCursorPos(int* X, int* Y);

/*
Summary:
  Set the cursor XY position on the console.
Description:
  This function sets the cursor XY position on the console.
Parameters:
  X - The X coordinate to set the cursor to.
  Y - The Y coordinate to set the cursor to.
Returns:
  None.
*/
extern void Console_SetCursorPos(int X, int Y);

/*
Summary:
  Clear the console.
Description:
  This function clears the console.
Parameters:
  None.
Returns:
  None.
*/
extern void Console_Clear();

/*
Summary:
  Clear the current line of the console to a specified color.
Description:
  This function clears the current line of the console and sets it to the specified color.
Parameters:
  AColor - The color to set the cleared line to (default is FG_WHITE).
Returns:
  None.
*/
extern void Console_ClearLine(unsigned short AColor);

/*
Summary:
  Print text to the console in a specified color.
Description:
  This function prints the specified text to the console in the given color.
Parameters:
  AText - The text to be printed.
  AColor - The color to print the text in.
Returns:
  None.
*/
extern void Console_Print(const char* AText, unsigned short AColor, ...);

/*
Print text to the console in a specified color with a linefeed.
Description:
  This function prints the specified text to the console in the given color and appends a linefeed.
Parameters:
  AText - The text to be printed.
  AColor - The color to print the text in.
Returns:
  None.
*/
extern void Console_PrintLn(const char* AText, unsigned short AColor, ...);

/*
Summary:
  Clear keyboard states.
Description:
  This function clears the current keyboard states.
Parameters:
  None.
Returns:
  None.
*/
extern void Console_ClearKeyStates();

/*
Summary:
  Check if a key is being held down.
Description:
  This function checks if a specified key is currently being held down.
Parameters:
  AKey - The key to check.
Returns:
  True if the key is being held down, otherwise False.
*/
extern bool Console_IsKeyPressed(unsigned char AKey);

/*
Summary:
  Check if a key was released.
Description:
  This function checks if a specified key was released.
Parameters:
  AKey - The key to check.
Returns:
  True if the key was released, otherwise False.
*/
extern bool Console_WasKeyReleased(unsigned char AKey);

/*
Summary:
  Check if a key was pressed.
Description:
  This function checks if a specified key was pressed.
Parameters:
  AKey - The key to check.
Returns:
  True if the key was pressed, otherwise False.
*/
extern bool Console_WasKeyPressed(unsigned char AKey);

/*
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
*/
extern void Console_Pause(bool AForcePause=false, unsigned short AColor=FG_WHITE, const char* AText=NULL);


/*
Summary:
  Set a callback for each word spoken.
Description:
  This function sets a callback handler that is invoked for each word spoken.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for the spoken words.
Returns:
  None.
*/
extern void Speech_SetWordCallback(const void* ASender, SpeechWordCallback AHandler);

/*
Summary:
  Get the word callback.
Description:
  This function retrieves the current callback handler for spoken words.
Parameters:
  None.
Returns:
  The current SpeechWordCallback handler.
*/
extern SpeechWordCallback Speech_GetWordCallback();

/*
Summary:
  Get the number of voices on the system.
Description:
  This function returns the total number of voices available on the system.
Parameters:
  None.
Returns:
  The number of voices on the system as an integer.
*/
extern int Speech_GetVoiceCount();

/*
Summary:
  Get an attribute for a voice.
Description:
  This function retrieves a specific attribute of a voice by its index.
Parameters:
  AIndex - The index of the voice.
  AAttribute - The attribute to retrieve.
Returns:
  The attribute value as a string.
*/
extern char* Speech_GetVoiceAttribute(int AIndex, unsigned char AAttribute);

/*
Summary:
  Change to a specified voice.
Description:
  This function changes the current voice to the specified voice by its index.
Parameters:
  AIndex - The index of the voice to change to.
Returns:
  None.
*/
extern void Speech_ChangeVoice(int AIndex);

/*
Summary:
  Get index of active voice.
Description:
  This function retrieves the index of the currently active voice.
Parameters:
  None.
Returns:
  The index of the active voice as an integer.
*/
extern int Speech_GetVoice();

/*
Summary:
  Set the voice volume (0-1).
Description:
  This function sets the volume of the voice, with a range from 0 to 1.
Parameters:
  AVolume - The volume level to set (0-1).
Returns:
  None.
*/
extern void Speech_SetVolume(float AVolume);

/*
Summary:
  Get the voice volume (0-1).
Description:
  This function retrieves the current volume level of the voice.
Parameters:
  None.
Returns:
  The volume level as a single (0-1).
*/
extern float Speech_GetVolume();

/*
Summary:
  Set the voice speaking rate.
Description:
  This function sets the speaking rate of the voice.
Parameters:
  ARate - The speaking rate to set.
Returns:
  None.
*/
extern void Speech_SetRate(float ARate);

/*
Summary:
  Get the voice speaking rate.
Description:
  This function retrieves the current speaking rate of the voice.
Parameters:
  None.
Returns:
  The speaking rate as a single.
*/
extern float Speech_GetRate();

/*
Summary:
  Clear the currently speaking voice.
Description:
  This function clears the currently speaking voice.
Parameters:
  None.
Returns:
  None.
*/
extern void Speech_Clear();

/*
Summary:
  Speak the text in the current voice, with the option to first purge any currently active speech.
Description:
  This function speaks the given text in the current voice, with an option to purge any currently active speech before speaking.
Parameters:
  AText - The text to be spoken.
  APurge - Boolean indicating whether to purge current speech first.
Returns:
  None.
*/
extern void Speech_Say(const char* AText, bool APurge);

/*
Summary:
  Check if any voice is currently active.
Description:
  This function checks if there is any active voice currently speaking.
Parameters:
  None.
Returns:
  True if any voice is active, otherwise False.
*/
extern bool Speech_Active();

/*
Summary:
  Pause the active voice.
Description:
  This function pauses the currently active voice.
Parameters:
  None.
Returns:
  None.
*/
extern void Speech_Pause();

/*
Summary:
  Resume the active voice that was paused.
Description:
  This function resumes the currently paused voice.
Parameters:
  None.
Returns:
  None.
*/
extern void Speech_Resume();

/*
Summary:
  Reset speech to a default and known state.
Description:
  This function resets the speech system to a default and known state.
Parameters:
  None.
Returns:
  None.
*/
extern void Speech_Reset();

/*
Summary:
  Add a word phrase to be substituted.
Description:
  This function adds a word or phrase to be substituted. Sometimes to make a word sound better, you have to alter the spelling. If that altered word is detected, it will substitute the defined word in the word callback.
Parameters:
  AWord - The word to be substituted.
  ASubstituteWord - The substitute word to be used.
Returns:
  None.
*/
extern void Speech_SubstituteWord(const char* AWord, const char* ASubstituteWord);

/*
Summary:
  Return the version information string (full, major, minor, patch).
Description:
  This function retrieves the version information string based on the specified type.
Parameters:
  AType - The type of version information to retrieve (full, major, minor, patch).
Returns:
  The version information string.
*/
extern const char * __cdecl Version_Get(const unsigned char AType);

/*
Summary:
  Clear the current error message.
Description:
  This function clears the current error message.
Parameters:
  None.
Returns:
  None.
*/
extern void Error_Clear();

/*
Summary:
  Set the current error message.
Description:
  This function sets the current error message to the specified text.
Parameters:
  AText - The error message text to set.
Returns:
  None.
*/
extern void Error_Set(const char* AText);

/*
Summary:
  Get the current error message.
Description:
  This function retrieves the current error message.
Parameters:
  None.
Returns:
  The current error message as a string.
*/
extern const char* Error_Get();

/*
Summary:
  Get the load model progress callback.
Description:
  This function retrieves the current callback handler for load model progress.
Parameters:
  None.
Returns:
  The current LoadModelProgressCallback handler.
*/
extern LoadModelProgressCallback Callback_GetLoadModelProgress();

/*
Summary:
  Set the load model progress callback.
Description:
  This function sets the callback handler for load model progress.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for load model progress.
Returns:
  None.
*/
extern void Callback_SetLoadModelProgress(const void* ASender, LoadModelProgressCallback AHandler);

/*
Summary:
  Get the load model callback.
Description:
  This function retrieves the current callback handler for loading models.
Parameters:
  None.
Returns:
  The current LoadModelCallback handler.
*/
extern LoadModelCallback Callback_GetLoadModel();

/*
Summary:
  Set the load model callback.
Description:
  This function sets the callback handler for loading models.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for loading models.
Returns:
  None.
*/
extern void Callback_SetLoadModel(const void* ASender, LoadModelCallback AHandler);

/*
Summary:
  Get the inference cancel callback.
Description:
  This function retrieves the current callback handler for inference cancellation.
Parameters:
  None.
Returns:
  The current InferenceCancelCallback handler.
*/
extern InferenceCancelCallback Callback_GetInferenceCancel();

/*
Summary:
  Set the inference cancel callback.
Description:
  This function sets the callback handler for inference cancellation.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for inference cancellation.
Returns:
  None.
*/
extern void Callback_SetInferenceCancel(const void* ASender, InferenceCancelCallback AHandler);

/*
Summary:
  Get the inference next token callback.
Description:
  This function retrieves the current callback handler for the next token in inference.
Parameters:
  None.
Returns:
  The current InferenceNextTokenCallback handler.
*/
extern InferenceNextTokenCallback Callback_GetInferenceNextToken();

/*
Summary:
  Set the inference next token callback.
Description:
  This function sets the callback handler for the next token in inference.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for the next token in inference.
Returns:
  None.
*/
extern void Callback_SetInferenceNextToken(const void* ASender, InferenceNextTokenCallback AHandler);

/*
Summary:
  Get the inference start callback.
Description:
  This function retrieves the current callback handler for the start of inference.
Parameters:
  None.
Returns:
  The current InferenceStartCallback handler.
*/
extern InferenceStartCallback Callback_GetInferenceStart();

/*
Summary:
  Set the inference start callback.
Description:
  This function sets the callback handler for the start of inference.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for the start of inference.
Returns:
  None.
*/
extern void Callback_SetInferenceStart(const void* ASender, InferenceStartCallback AHandler);

/*
Summary:
  Get the inference end callback.
Description:
  This function retrieves the current callback handler for the end of inference.
Parameters:
  None.
Returns:
  The current InferenceEndCallback handler.
*/
extern InferenceEndCallback Callback_GetInferenceEnd();

/*
Summary:
  Set the inference end callback.
Description:
  This function sets the callback handler for the end of inference.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for the end of inference.
Returns:
  None.
*/
extern void Callback_SetInferenceEnd(const void* ASender, InferenceEndCallback AHandler);

/*
Summary:
  Get the info callback.
Description:
  This function retrieves the current info callback handler.
Parameters:
  None.
Returns:
  The current InfoCallback handler.
*/
extern InfoCallback Callback_GetInfo();

/*
Summary:
  Set the info callback.
Description:
  This function sets the info callback handler.
Parameters:
  ASender - Pointer to the sender object.
  AHandler - The callback handler for info.
Returns:
  None.
*/
extern void Callback_SetInfo(const void* ASender, InfoCallback AHandler);

/*
Summary:
  Set configuration information (model path, GPU layers).
Description:
  This function sets configuration information including the model path and the number of GPU layers.
Parameters:
  AModelPath - The path to the model.
  ANumGPULayers - The number of GPU layers to use.
Returns:
  None.
*/
extern void Config_Init(const char* AModelPath, int ANumGPULayers);

/*
Summary:
  Save configuration information to a JSON file.
Description:
  This function saves the current configuration information to a specified JSON file.
Parameters:
  AFilename - The name of the file to save the configuration to.
Returns:
  True if the configuration was saved successfully, otherwise False.
*/
extern bool Config_Save(const char* AFilename);

/*
Summary:
  Load configuration information from a JSON file.
Description:
  This function loads configuration information from a specified JSON file.
Parameters:
  AFilename - The name of the file to load the configuration from.
Returns:
  True if the configuration was loaded successfully, otherwise False.
*/
extern bool Config_Load(const char* AFilename);

/*
Summary:
  Clear all inference messages.
Description:
  This function clears all messages related to inference.
Parameters:
  None.
Returns:
  None.
*/
extern void Message_ClearAll();

/*
Summary:
  Add a new inference message (system, user, assistant, tool).
Description:
  This function adds a new inference message with the specified role and content.
Parameters:
  ARole - The role of the message (system, user, assistant, tool).
  AContent - The content of the message.
Returns:
  The Index of the added message.
*/
extern int Message_Add(const char* ARole, const char* AContent);

/*
Summary:
  Add a new inference unicode message (system, user, assistant, tool).
Description:
  This function adds a new inference unicode message with the specified role and content.
Parameters:
  ARole - The role of the message (system, user, assistant, tool).
  AContent - The content of the message.
Returns:
  The Index of the added message.
*/
extern int Message_AddW(const char * ARole, const wchar_t * AContent);

/*
Summary:
  Get the last user message added.
Description:
  This function retrieves the last user message that was added.
Parameters:
  None.
Returns:
  The last user message as a string.
*/
extern const char* Message_GetLastUser();

/*
Summary:
  Build a prompt of messages that can be sent to the LLM to do inference on.
Description:
  This function builds a prompt from the messages that can be sent to the language model for inference.
Parameters:
  AModelName - The name of the model to use for building the prompt.
Returns:
  The built prompt as a string.
*/
extern const char* Message_BuildInferencePrompt(const char* AModelName);

/*
Summary:
  Clear all model defines.
Description:
  This function clears all model definitions.
Parameters:
  None.
Returns:
  None.
*/
extern void Model_ClearDefines();

/*
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
*/
extern int Model_Define(const char* AModelFilename, const char* AModelName, unsigned int AMaxContext, const char* ACustomTemplate, const char* ACustomTemplateEnd/*, const bool AAddAssistant*/);

/*
Summary:
  Save all the model defines to a JSON file.
Description:
  This function saves all the model definitions to a specified JSON file.
Parameters:
  AFilename - The name of the file to save the model definitions to.
Returns:
  True if the model definitions were saved successfully, otherwise False.
*/
extern bool Model_SaveDefines(const char* AFilename);

/*
Summary:
  Load model defines from a JSON file.
Description:
  This function loads model definitions from a specified JSON file.
Parameters:
  AFilename - The name of the file to load the model definitions from.
Returns:
  True if the model definitions were loaded successfully, otherwise False.
*/
extern bool Model_LoadDefines(const char* AFilename);

/*
Summary:
  Load a model that has been defined from its reference name.
Description:
  This function loads a model that has been defined using its reference name.
Parameters:
  AModelName - The reference name of the model to load.
Returns:
  True if the model was loaded successfully, otherwise False.
*/
extern bool Model_Load(const char* AModelName);

/*
Summary:
  Check if a model has been loaded.
Description:
  This function checks if a model is currently loaded.
Parameters:
  None.
Returns:
  True if a model is loaded, otherwise False.
*/
extern bool Model_IsLoaded();

/*
Summary:
  Unload loaded model, releasing all allocated resources.
Description:
  This function unloads the currently loaded model and releases all allocated resources.
Parameters:
  None.
Returns:
  None.
*/
extern void Model_Unload();

/*
Summary:
  Run inference on messages until complete. If the model is currently not loaded, it will automatically load.
Description:
  This function runs inference on the messages until completion. If the model is not currently loaded, it will automatically load the model.
Parameters:
  AModelName - The name of the model to use for inference.
  AMaxTokens - The maximum number of tokens for inference.
Returns:
  True if inference was successful, otherwise False.
*/
extern bool Inference_Run(const char* AModelName, unsigned int AMaxTokens);

/*
Summary:
  Start inference on messages. If the model is currently not loaded, it will automatically load.
Description:
  This function starts inference on the messages. If the model is not currently loaded, it will automatically load the model.
Parameters:
  AModelName - The name of the model to use for inference.
  AMaxTokens - The maximum number of tokens for inference.
Returns:
  True if inference started successfully, otherwise False.
*/
extern bool Inference_Start(const char* AModelName, unsigned int AMaxTokens);

/*
Summary:
  Check if inference is currently active.
Description:
  This function checks if inference is currently active.
Parameters:
  None.
Returns:
  True if inference is active, otherwise False.
*/
extern bool Inference_IsActive();

/*
Summary:
  Get the next token of the currently active inference session.
Description:
  This function retrieves the next token from the currently active inference session.
Parameters:
  None.
Returns:
  The next token as a string.
*/
extern const char* Inference_GetNextToken();

/*
Summary:
  Stop active inference processing.
Description:
  This function stops the currently active inference processing.
Parameters:
  None.
Returns:
  None.
*/
extern void Inference_Stop();

/*
Summary:
  Return the entire inference response.
Description:
  This function returns the entire response from the inference session.
Parameters:
  None.
Returns:
  The entire inference response as a string.
*/
extern const char* Inference_GetResponse();

/*
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
*/
extern void Inference_GetUsage(float* ATokenInputSpeed, float* ATokenOutputSpeed, int* AInputTokens, int* AOutputTokens, int* ATotalTokens);

/*
Summary:
  Set the right console margin for token output response.
Description:
  This function sets the right margin for token output response on the console.
Parameters:
  AMargin - The right margin to set.
Returns:
  None.
*/
extern void __cdecl TokenResponse_SetRightMargin(const int AMargin);

/*
Summary:
  Add a new token for response.
Description:
  This function adds a new token for the response.
Parameters:
  AToken - The token to add.
Returns:
  The index of the added token.
*/
extern int __cdecl TokenResponse_AddToken(const char * AToken);

/*
Summary:
  Get the last word of token response.
Description:
  This function retrieves the last word from the token response.
Parameters:
  ATrimLeft - Boolean indicating whether to trim the left side of the word.
Returns:
  The last word as a string.
*/
extern const char * __cdecl TokenResponse_LastWord(const bool ATrimLastWord);

/*
Summary:
  Check if there are more tokens to respond to.
Description:
  This function checks if there are more tokens to respond to.
Parameters:
  None.
Returns:
  True if there are more tokens, otherwise False.
*/
extern bool __cdecl TokenResponse_Finalize();

#ifdef __cplusplus
}
#endif

#endif // LMENGINE_H
