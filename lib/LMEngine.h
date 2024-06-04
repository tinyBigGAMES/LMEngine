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
#define LME_LF   L'\n'
#define LME_CR   L'\r'
#define LME_CRLF L"\n\r"

// Virtual Keys
#define LME_VKEY_ESCAPE  27
#define LME_VKEY_SPACE  32

// Primary console colors
#define LME_FG_BLUE         1
#define LME_FG_GREEN        2
#define LME_FG_RED          4
#define LME_FG_INTENSITY    8
#define LME_BG_BLUE         16
#define LME_BG_GREEN        32
#define LME_BG_RED          64
#define LME_BG_INTENSITY    128

// Custom console color
#define LME_FG_BRIGHTYELLOW (LME_FG_RED | LME_FG_GREEN | LME_FG_INTENSITY)
#define LME_FG_YELLOW       (LME_FG_RED | LME_FG_GREEN)
#define LME_FG_WHITE        (LME_FG_RED | LME_FG_GREEN | LME_FG_BLUE)
#define LME_FG_BRIGHTWHITE  (LME_FG_WHITE | LME_FG_INTENSITY)
#define LME_FG_DARKGREEN    LME_FG_GREEN
#define LME_FG_LIGHTGREEN   (LME_FG_GREEN | LME_FG_INTENSITY)
#define LME_FG_DARKGRAY     LME_FG_INTENSITY
#define LME_FG_CYAN         (LME_FG_GREEN | LME_FG_BLUE)
#define LME_FG_MAGENTA      (LME_FG_RED | LME_FG_BLUE)

#define LME_BG_BRIGHTYELLOW (LME_BG_RED | LME_BG_GREEN | LME_BG_INTENSITY)
#define LME_BG_YELLOW       (LME_BG_RED | LME_BG_GREEN)
#define LME_BG_WHITE        (LME_BG_RED | LME_BG_GREEN | LME_BG_BLUE)
#define LME_BG_BRIGHTWHITE  (LME_BG_WHITE | LME_BG_INTENSITY)
#define LME_BG_DARKGREEN    LME_BG_GREEN
#define LME_BG_LIGHTGREEN   (LME_BG_GREEN | LME_BG_INTENSITY)
#define LME_BG_DARKGRAY     LME_BG_INTENSITY
#define LME_BG_CYAN         (LME_BG_GREEN | LME_FG_BLUE)
#define LME_BG_MAGENTA      (LME_BG_RED | LME_FG_BLUE)

// Message roles
#define LME_ROLE_SYSTEM    L"system"
#define LME_ROLE_USER      L"user"
#define LME_ROLE_ASSISTANT L"assistant"
#define LME_ROLE_TOOL      L"tool"

// Speech Voice Attributes
#define LME_SPEECH_VOICEATTR_DESCRIPTION 0
#define LME_SPEECH_VOICEATTR_NAME        1
#define LME_SPEECH_VOICEATTR_VENDOR      2
#define LME_SPEECH_VOICEATTR_AGE         3
#define LME_SPEECH_VOICEATTR_GENDER      4
#define LME_SPEECH_VOICEATTR_LANGUAGE    5
#define LME_SPEECH_VOICEATTR_ID          6

// Token Response
#define LME_TOKENRESPONSE_WAIT    0
#define LME_TOKENRESPONSE_APPEND  1
#define LME_TOKENRESPONSE_NEWLINE 2

// Version
#define LME_VERSION_FULL  0
#define LME_VERSION_MAJOR 1
#define LME_VERSION_MINOR 2
#define LME_VERSION_PATCH 3

// Callbacks
typedef void (*LME_SpeechWordCallback)(const wchar_t* AWord,
  const wchar_t* AText, const void* AUserData);

typedef bool (*LME_InferenceCancelCallback)(const void* AUserData);

typedef void (*LME_InferenceTokenCallback)(const wchar_t* AToken,
  const void* AUserData);

typedef void (*LME_InfoCallback)(int ALevel, const wchar_t* AText,
  const void* AUserData);

typedef bool (*LME_LoadModelProgressCallback)(const wchar_t* AModelName,
  float AProgress, const void* AUserData);

typedef void (*LME_LoadModelCallback)(const wchar_t* AModelName, bool ASuccess,
  const void* AUserData);

typedef void (*LME_InferenceStartCallback)(const void* AUserData);

typedef void (*LME_InferenceEndCallback)(const void* AUserData);

/// <summary>
///   Prints text to the console.
/// </summary>
/// <param name="AText">
///   The text to be printed.
/// </param>
/// <param name="AColor">
///   The color of the text.
/// </param>
void LME_Print(const wchar_t* AText, int AColor, ...);

/// <summary>
///   Prints text to the console with a line feed and carriage return.
/// </summary>
/// <param name="AText">
///   The text to be printed.
/// </param>
/// <param name="AColor">
///   The color of the text.
/// </param>
void LME_PrintLn(const wchar_t* AText, int AColor, ...);

/// <summary>
///   Gets the console cursor X and Y position.
/// </summary>
/// <param name="X">
///   The X position of the cursor.
/// </param>
/// <param name="Y">
///   The Y position of the cursor.
/// </param>
void LME_GetCursorPos(int* X, int* Y);

/// <summary>
///   Sets the console cursor X and Y position.
/// </summary>
/// <param name="X">
///   The X position of the cursor.
/// </param>
/// <param name="Y">
///   The Y position of the cursor.
/// </param>
void LME_SetCursorPos(int X, int Y);

/// <summary>
///   Clears the current console screen.
/// </summary>
void LME_ClearConsole();

/// <summary>
///   Clears the current console line.
/// </summary>
/// <param name="AColor">
///   The color to use when clearing the line.
/// </param>
void LME_ClearConsoleLine(int AColor);

/// <summary>
///   Clears the keyboard states.
/// </summary>
void LME_ClearKeyStates();

/// <summary>
///   Checks if a key is currently held down.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key is held down, otherwise False.
/// </returns>
bool LME_IsKeyPressed(unsigned char AKey);

/// <summary>
///   Checks if a key was recently released.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key was released, otherwise False.
/// </returns>
bool LME_WasKeyReleased(unsigned char AKey);

/// <summary>
///   Checks if a key was recently pressed.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key was pressed, otherwise False.
/// </returns>
bool LME_WasKeyPressed(unsigned char AKey);

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
void LME_Pause(bool AForcePause=true, int AColor=LME_FG_WHITE,
  const wchar_t* AText=NULL);

/// <summary>
///   Processes Windows messages.
/// </summary>
void LME_ProcessMessages();

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
wchar_t* LME_MaskFirstFoundWord(const wchar_t* AText, const wchar_t* AWord);

/// <summary>
///   Sets the token response right margin.
/// </summary>
/// <param name="AMargin">
///   The right margin value.
/// </param>
void LME_SetTokenResponseRightMargin(int AMargin);

/// <summary>
///   Adds a new token to token response.
/// </summary>
/// <param name="AToken">
///   The token to add.
/// </param>
/// <returns>
///   An integer representing the token response.
/// </returns>
int LME_AddTokenResponseToken(const wchar_t* AToken);

/// <summary>
///   Gets the last word from token response.
/// </summary>
/// <param name="ATrimLeft">
///   If True, trims the left side.
/// </param>
/// <returns>
///   The last word from the token response.
/// </returns>
wchar_t* LME_LastTokenResponseWord(bool ATrimLeft);

/// <summary>
///   Checks if all words have been processed in token response.
/// </summary>
/// <returns>
///   True if all words have been processed, otherwise False.
/// </returns>
bool LME_FinalizeTokenResponse();

/// <summary>
///   Sets the speech word callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void LME_SetSpeechWordCallback(LME_SpeechWordCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the speech word callback.
/// </summary>
/// <returns>
///   The current speech word callback.
/// </returns>
LME_SpeechWordCallback LME_GetSpeechWordCallback();

/// <summary>
///   Gets the speech voice count.
/// </summary>
/// <returns>
///   The number of available speech voices.
/// </returns>
int LME_GetSpeechVoiceCount();

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
wchar_t* LME_GetSpeechVoiceAttribute(int AIndex, unsigned char AAttribute);

/// <summary>
///   Changes the speech voice speed.
/// </summary>
/// <param name="AIndex">
///   The index of the speech voice.
/// </param>
void LME_ChangeSpeechVoice(int AIndex);

/// <summary>
///   Gets the current speech voice.
/// </summary>
/// <returns>
///   The index of the current speech voice.
/// </returns>
int LME_GetSpeechVoice();

/// <summary>
///   Sets the current speech voice volume.
/// </summary>
/// <param name="AVolume">
///   The volume level to set.
/// </param>
void LME_SetSpeechVolume(float AVolume);

/// <summary>
///   Gets the current speech voice volume.
/// </summary>
/// <returns>
///   The current volume level.
/// </returns>
float LME_GetSpeechVolume();

/// <summary>
///   Sets the current speech voice rate.
/// </summary>
/// <param name="ARate">
///   The rate to set.
/// </param>
void LME_SetSpeechRate(float ARate);

/// <summary>
///   Gets the current speech voice rate.
/// </summary>
/// <returns>
///   The current rate.
/// </returns>
float LME_GetSpeechRate();

/// <summary>
///   Clears the current speech voice.
/// </summary>
void LME_ClearSpeech();

/// <summary>
///   Speaks text in the current speech voice.
/// </summary>
/// <param name="AText">
///   The text to be spoken.
/// </param>
/// <param name="APurge">
///   If True, purges the current speech before speaking.
/// </param>
void LME_SaySpeech(const wchar_t* AText, bool APurge);

/// <summary>
///   Checks if the current speech voice is active.
/// </summary>
/// <returns>
///   True if the speech voice is active, otherwise False.
/// </returns>
bool LME_IsSpeechActive();

/// <summary>
///   Pauses the current speech voice.
/// </summary>
void LME_PauseSpeech();

/// <summary>
///   Resumes the current speech voice.
/// </summary>
void LME_ResumeSpeech();

/// <summary>
///   Resets the current speech voice.
/// </summary>
void LME_ResetSpeech();

/// <summary>
///   Adds a word phrase to be substituted in speech.
/// </summary>
/// <param name="AWord">
///   The word to be substituted.
/// </param>
/// <param name="ASubstituteWord">
///   The substitute word.
/// </param>
void LME_SubstituteSpeechWord(const wchar_t* AWord,
  const wchar_t* ASubstituteWord);

/// <summary>
///   Gets the version information.
/// </summary>
/// <param name="AType">
///   The type of version information to retrieve.
/// </param>
/// <returns>
///   The version information as a string.
/// </returns>
wchar_t* LME_GetVersion(unsigned char AType);

/// <summary>
///   Clears the last error message.
/// </summary>
void LME_ClearError();

/// <summary>
///   Sets an error message.
/// </summary>
/// <param name="AText">
///   The error message to set.
/// </param>
void LME_SetError(const wchar_t* AText);

/// <summary>
///   Gets the last error message.
/// </summary>
/// <returns>
///   The last error message as a string.
/// </returns>
wchar_t* LME_GetError();

/// <summary>
///   Gets the inference cancel callback.
/// </summary>
/// <returns>
///   The inference cancel callback.
/// </returns>
LME_InferenceCancelCallback LME_GetInferenceCancelCallback();

/// <summary>
///   Sets the inference cancel callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void LME_SetInferenceCancelCallback(LME_InferenceCancelCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the inference token callback.
/// </summary>
/// <returns>
///   The inference token callback.
/// </returns>
LME_InferenceTokenCallback LME_GetInferenceTokenCallback();

/// <summary>
///   Sets the inference token callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void LME_SetInferenceTokenlCallback(LME_InferenceTokenCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the information callback.
/// </summary>
/// <returns>
///   The information callback.
/// </returns>
LME_InfoCallback LME_GetInfoCallback();

/// <summary>
///   Sets the information callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void LME_SetInfoCallback(LME_InfoCallback AHandler, const void* AUserData);

/// <summary>
///   Gets the load model progress callback.
/// </summary>
/// <returns>
///   The load model progress callback.
/// </returns>
LME_LoadModelProgressCallback LME_GetLoadModelProgressCallback();

/// <summary>
///   Sets the load model progress callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void LME_SetLoadModelProgressCallback(LME_LoadModelProgressCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the load model callback.
/// </summary>
/// <returns>
///   The load model callback.
/// </returns>
LME_LoadModelCallback LME_GetLoadModelCallback();

/// <summary>
///   Sets the load model callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void LME_SetLoadModelCallback(LME_LoadModelCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the inference start callback.
/// </summary>
/// <returns>
///   The inference start callback.
/// </returns>
LME_InferenceStartCallback LME_GetInferenceStartCallback();

/// <summary>
///   Sets the inference start callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void LME_SetInferenceStartCallback(LME_InferenceStartCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the inference end callback.
/// </summary>
/// <returns>
///   The inference end callback.
/// </returns>
LME_InferenceEndCallback LME_GetInferenceEndCallback();

/// <summary>
///   Sets the inference end callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void LME_SetInferenceEndCallback(LME_InferenceEndCallback AHandler,
  const void* AUserData);

/// <summary>
///   Initializes configuration settings.
/// </summary>
/// <param name="AModelPath">
///   The path to the model.
/// </param>
/// <param name="ANumGPULayers">
///   The number of GPU layers.
/// </param>
void LME_InitConfig(const wchar_t* AModelPath, int ANumGPULayers);

/// <summary>
///   Saves configuration settings to a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to save the configuration to.
/// </param>
/// <returns>
///   True if the configuration was saved successfully, otherwise False.
/// </returns>
bool LME_SaveConfig(const wchar_t* AFilename);

/// <summary>
///   Loads configuration settings from a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to load the configuration from.
/// </param>
/// <returns>
///   True if the configuration was loaded successfully, otherwise False.
/// </returns>
bool LME_LoadConfig(const wchar_t* AFilename);

/// <summary>
///   Clears all inference messages.
/// </summary>
void LME_ClearAllMessages();

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
int LME_AddMessage(const wchar_t* ARole, const wchar_t* AContent);

/// <summary>
///   Gets the last user role inference message.
/// </summary>
/// <returns>
///   The last user role inference message.
/// </returns>
wchar_t* LME_GetLastUserMessage();

/// <summary>
///   Returns an inference prompt for the specified model from current messages.
/// </summary>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <returns>
///   The inference prompt.
/// </returns>
wchar_t* LME_BuildMessageInferencePrompt(const wchar_t* AModelName);

/// <summary>
///   Clears all model definitions.
/// </summary>
void LME_ClearModelDefines();

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
int LME_DefineModel(const wchar_t* AModelFilename, const wchar_t* AModelName,
  unsigned int AMaxContext, const wchar_t* ATemplate,
  const wchar_t* ATemplateEnd);

/// <summary>
///   Saves all model definitions to a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to save the definitions to.
/// </param>
/// <returns>
///   True if the definitions were saved successfully, otherwise False.
/// </returns>
bool LME_SaveModelDefines(const wchar_t* AFilename);

/// <summary>
///   Loads model definitions from a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to load the definitions from.
/// </param>
/// <returns>
///   True if the definitions were loaded successfully, otherwise False.
/// </returns>
bool LME_LoadModelDefines(const wchar_t* AFilename);

/// <summary>
///   Loads the specified model.
/// </summary>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <returns>
///   True if the model was loaded successfully, otherwise False.
/// </returns>
bool LME_LoadModel(const wchar_t* AModelName);

/// <summary>
///   Checks if a model is currently loaded.
/// </summary>
/// <returns>
///   True if a model is loaded, otherwise False.
/// </returns>
bool LME_IsModelLoaded();

/// <summary>
///   Unloads the currently loaded model.
/// </summary>
void LME_UnloadModel();

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
bool LME_RunInference(const wchar_t* AModelName, unsigned int AMaxTokens);

/// <summary>
///   Gets the inference response from the currently loaded model.
/// </summary>
/// <returns>
///   The inference response.
/// </returns>
wchar_t* LME_GetInferenceResponse();

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
void LME_GetInferenceStats(float* ATokenInputSpeed, float* ATokenOutputSpeed,
  int* AInputTokens, int* AOutputTokens, int* ATotalTokens);

#ifdef __cplusplus
}
#endif

#endif // LMENGINE_H
