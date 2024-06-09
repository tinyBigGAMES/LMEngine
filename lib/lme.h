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
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#ifndef LME_H
#define LME_H

// check for supported platform
#ifndef _WIN64
#error "Unsupported platform"
#endif

// link in LMEngine.lib
#pragma comment(lib,"lme.lib")

#ifdef __cplusplus
extern "C" {
#endif

#include <stdbool.h>
#include <wchar.h>

// Console linefeed & carriage return
#define LF   L'\n'
#define CR   L'\r'
#define CRLF L"\n\r"

// Virtual Keys
#define VKEY_ESCAPE  27
#define VKEY_SPACE  32

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
#define ROLE_SYSTEM    L"system"
#define ROLE_USER      L"user"
#define ROLE_ASSISTANT L"assistant"
#define ROLE_TOOL      L"tool"

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
typedef void (*SpeechWordCallback)(const wchar_t* AWord,
  const wchar_t* AText, const void* AUserData);

typedef bool (*InferenceCancelCallback)(const void* AUserData);

typedef void (*InferenceTokenCallback)(const wchar_t* AToken,
  const void* AUserData);

typedef void (*InfoCallback)(int ALevel, const wchar_t* AText,
  const void* AUserData);

typedef bool (*LoadModelProgressCallback)(const wchar_t* AModelName,
  float AProgress, const void* AUserData);

typedef void (*LoadModelCallback)(const wchar_t* AModelName, bool ASuccess,
  const void* AUserData);

typedef void (*InferenceStartCallback)(const void* AUserData);

typedef void (*InferenceEndCallback)(const void* AUserData);

/// <summary>
///   Prints text to the console.
/// </summary>
/// <param name="AText">
///   The text to be printed.
/// </param>
/// <param name="AColor">
///   The color of the text.
/// </param>
void Print(const wchar_t* AText, int AColor, ...);

/// <summary>
///   Prints text to the console with a line feed and carriage return.
/// </summary>
/// <param name="AText">
///   The text to be printed.
/// </param>
/// <param name="AColor">
///   The color of the text.
/// </param>
void PrintLn(const wchar_t* AText, int AColor, ...);

/// <summary>
///   Gets the console cursor X and Y position.
/// </summary>
/// <param name="X">
///   The X position of the cursor.
/// </param>
/// <param name="Y">
///   The Y position of the cursor.
/// </param>
void GetCursorPostion(int* X, int* Y);

/// <summary>
///   Sets the console cursor X and Y position.
/// </summary>
/// <param name="X">
///   The X position of the cursor.
/// </param>
/// <param name="Y">
///   The Y position of the cursor.
/// </param>
void SetCursorPostion(int X, int Y);

/// <summary>
///   Clears the current console screen.
/// </summary>
void ClearConsole();

/// <summary>
///   Clears the current console line.
/// </summary>
/// <param name="AColor">
///   The color to use when clearing the line.
/// </param>
void ClearConsoleLine(int AColor);

/// <summary>
///   Clears the keyboard states.
/// </summary>
void ClearKeyStates();

/// <summary>
///   Checks if a key is currently held down.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key is held down, otherwise False.
/// </returns>
bool IsKeyPressed(unsigned char AKey);

/// <summary>
///   Checks if a key was recently released.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key was released, otherwise False.
/// </returns>
bool WasKeyReleased(unsigned char AKey);

/// <summary>
///   Checks if a key was recently pressed.
/// </summary>
/// <param name="AKey">
///   The key to check.
/// </param>
/// <returns>
///   True if the key was pressed, otherwise False.
/// </returns>
bool WasKeyPressed(unsigned char AKey);

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
void Pause(bool AForcePause=true, int AColor=FG_WHITE,
  const wchar_t* AText=NULL);

/// <summary>
///   Processes Windows messages.
/// </summary>
void ProcessMessages();

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
wchar_t* MaskFirstFoundWord(const wchar_t* AText, const wchar_t* AWord);

/// <summary>
///   Sets the token response right margin.
/// </summary>
/// <param name="AMargin">
///   The right margin value.
/// </param>
void SetTokenResponseRightMargin(int AMargin);

/// <summary>
///   Adds a new token to token response.
/// </summary>
/// <param name="AToken">
///   The token to add.
/// </param>
/// <returns>
///   An integer representing the token response.
/// </returns>
int AddTokenResponseToken(const wchar_t* AToken);

/// <summary>
///   Gets the last word from token response.
/// </summary>
/// <param name="ATrimLeft">
///   If True, trims the left side.
/// </param>
/// <returns>
///   The last word from the token response.
/// </returns>
wchar_t* LastTokenResponseWord(bool ATrimLeft);

/// <summary>
///   Checks if all words have been processed in token response.
/// </summary>
/// <returns>
///   True if all words have been processed, otherwise False.
/// </returns>
bool FinalizeTokenResponse();

/// <summary>
///   Sets the speech word callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void SetSpeechWordCallback(SpeechWordCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the speech word callback.
/// </summary>
/// <returns>
///   The current speech word callback.
/// </returns>
SpeechWordCallback GetSpeechWordCallback();

/// <summary>
///   Gets the speech voice count.
/// </summary>
/// <returns>
///   The number of available speech voices.
/// </returns>
int GetSpeechVoiceCount();

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
wchar_t* GetSpeechVoiceAttribute(int AIndex, unsigned char AAttribute);

/// <summary>
///   Changes the speech voice speed.
/// </summary>
/// <param name="AIndex">
///   The index of the speech voice.
/// </param>
void ChangeSpeechVoice(int AIndex);

/// <summary>
///   Gets the current speech voice.
/// </summary>
/// <returns>
///   The index of the current speech voice.
/// </returns>
int GetSpeechVoice();

/// <summary>
///   Sets the current speech voice volume.
/// </summary>
/// <param name="AVolume">
///   The volume level to set.
/// </param>
void SetSpeechVolume(float AVolume);

/// <summary>
///   Gets the current speech voice volume.
/// </summary>
/// <returns>
///   The current volume level.
/// </returns>
float GetSpeechVolume();

/// <summary>
///   Sets the current speech voice rate.
/// </summary>
/// <param name="ARate">
///   The rate to set.
/// </param>
void SetSpeechRate(float ARate);

/// <summary>
///   Gets the current speech voice rate.
/// </summary>
/// <returns>
///   The current rate.
/// </returns>
float GetSpeechRate();

/// <summary>
///   Clears the current speech voice.
/// </summary>
void ClearSpeech();

/// <summary>
///   Speaks text in the current speech voice.
/// </summary>
/// <param name="AText">
///   The text to be spoken.
/// </param>
/// <param name="APurge">
///   If True, purges the current speech before speaking.
/// </param>
void SaySpeech(const wchar_t* AText, bool APurge);

/// <summary>
///   Checks if the current speech voice is active.
/// </summary>
/// <returns>
///   True if the speech voice is active, otherwise False.
/// </returns>
bool IsSpeechActive();

/// <summary>
///   Pauses the current speech voice.
/// </summary>
void PauseSpeech();

/// <summary>
///   Resumes the current speech voice.
/// </summary>
void ResumeSpeech();

/// <summary>
///   Resets the current speech voice.
/// </summary>
void ResetSpeech();

/// <summary>
///   Adds a word phrase to be substituted in speech.
/// </summary>
/// <param name="AWord">
///   The word to be substituted.
/// </param>
/// <param name="ASubstituteWord">
///   The substitute word.
/// </param>
void SubstituteSpeechWord(const wchar_t* AWord,
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
const wchar_t* GetVersionInfo(unsigned char AType);

/// <summary>
///   Clears the last error message.
/// </summary>
void ClearError();

/// <summary>
///   Sets an error message.
/// </summary>
/// <param name="AText">
///   The error message to set.
/// </param>
void SetError(const wchar_t* AText);

/// <summary>
///   Gets the last error message.
/// </summary>
/// <returns>
///   The last error message as a string.
/// </returns>
const wchar_t* GetError();

/// <summary>
///   Gets the inference cancel callback.
/// </summary>
/// <returns>
///   The inference cancel callback.
/// </returns>
InferenceCancelCallback GetInferenceCancelCallback();

/// <summary>
///   Sets the inference cancel callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void SetInferenceCancelCallback(InferenceCancelCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the inference token callback.
/// </summary>
/// <returns>
///   The inference token callback.
/// </returns>
InferenceTokenCallback GetInferenceTokenCallback();

/// <summary>
///   Sets the inference token callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void SetInferenceTokenlCallback(InferenceTokenCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the information callback.
/// </summary>
/// <returns>
///   The information callback.
/// </returns>
InfoCallback GetInfoCallback();

/// <summary>
///   Sets the information callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void SetInfoCallback(InfoCallback AHandler, const void* AUserData);

/// <summary>
///   Gets the load model progress callback.
/// </summary>
/// <returns>
///   The load model progress callback.
/// </returns>
LoadModelProgressCallback GetLoadModelProgressCallback();

/// <summary>
///   Sets the load model progress callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void SetLoadModelProgressCallback(LoadModelProgressCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the load model callback.
/// </summary>
/// <returns>
///   The load model callback.
/// </returns>
LoadModelCallback GetLoadModelCallback();

/// <summary>
///   Sets the load model callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void SetLoadModelCallback(LoadModelCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the inference start callback.
/// </summary>
/// <returns>
///   The inference start callback.
/// </returns>
InferenceStartCallback GetInferenceStartCallback();

/// <summary>
///   Sets the inference start callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void SetInferenceStartCallback(InferenceStartCallback AHandler,
  const void* AUserData);

/// <summary>
///   Gets the inference end callback.
/// </summary>
/// <returns>
///   The inference end callback.
/// </returns>
InferenceEndCallback GetInferenceEndCallback();

/// <summary>
///   Sets the inference end callback.
/// </summary>
/// <param name="AHandler">
///   The callback handler.
/// </param>
/// <param name="AUserData">
///   User data to pass to the callback.
/// </param>
void SetInferenceEndCallback(InferenceEndCallback AHandler,
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
void InitConfig(const wchar_t* AModelPath, int ANumGPULayers);

/// <summary>
///   Saves configuration settings to a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to save the configuration to.
/// </param>
/// <returns>
///   True if the configuration was saved successfully, otherwise False.
/// </returns>
bool SaveConfig(const wchar_t* AFilename);

/// <summary>
///   Loads configuration settings from a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to load the configuration from.
/// </param>
/// <returns>
///   True if the configuration was loaded successfully, otherwise False.
/// </returns>
bool LoadConfig(const wchar_t* AFilename);

/// <summary>
///   Clears all inference messages.
/// </summary>
void ClearAllMessages();

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
int AddMessage(const wchar_t* ARole, const wchar_t* AContent);

/// <summary>
///   Gets the last user role inference message.
/// </summary>
/// <returns>
///   The last user role inference message.
/// </returns>
const wchar_t* GetLastUserMessage();

/// <summary>
///   Returns an inference prompt for the specified model from current messages.
/// </summary>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <returns>
///   The inference prompt.
/// </returns>
const wchar_t* BuildMessageInferencePrompt(const wchar_t* AModelName);

/// <summary>
///   Clears all model definitions.
/// </summary>
void ClearModelDefines();

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
int DefineModel(const wchar_t* AModelFilename, const wchar_t* AModelName,
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
bool SaveModelDefines(const wchar_t* AFilename);

/// <summary>
///   Loads model definitions from a JSON file on disk.
/// </summary>
/// <param name="AFilename">
///   The filename to load the definitions from.
/// </param>
/// <returns>
///   True if the definitions were loaded successfully, otherwise False.
/// </returns>
bool LoadModelDefines(const wchar_t* AFilename);

/// <summary>
///   Loads the specified model.
/// </summary>
/// <param name="AModelName">
///   The name of the model.
/// </param>
/// <returns>
///   True if the model was loaded successfully, otherwise False.
/// </returns>
bool LoadModel(const wchar_t* AModelName);

/// <summary>
///   Checks if a model is currently loaded.
/// </summary>
/// <returns>
///   True if a model is loaded, otherwise False.
/// </returns>
bool IsModelLoaded();

/// <summary>
///   Unloads the currently loaded model.
/// </summary>
void UnloadModel();

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
bool RunInference(const wchar_t* AModelName, unsigned int AMaxTokens);

/// <summary>
///   Gets the inference response from the currently loaded model.
/// </summary>
/// <returns>
///   The inference response.
/// </returns>
const wchar_t* GetInferenceResponse();

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
void GetInferenceStats(float* ATokenInputSpeed, float* ATokenOutputSpeed,
  int* AInputTokens, int* AOutputTokens, int* ATotalTokens);

#ifdef __cplusplus
}
#endif

#endif // LME_H
