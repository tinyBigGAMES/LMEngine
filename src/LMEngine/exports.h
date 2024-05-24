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

//---------------------------------------------------------------------------

#ifndef exportsH
#define exportsH

#include <wchar.h>
#include "LMEngine.Utils.hpp"

//---------------------------------------------------------------------------

#define LMENGINE_API extern "C" __declspec(dllexport)

//--- UTILS -----------------------------------------------------------------
LMENGINE_API void __cdecl Utils_ProcessMessages();
LMENGINE_API const char * __cdecl Utils_MaskFirstFoundWord(const char * AText, const char * AWord);

//--- UTF8 ------------------------------------------------------------------
LMENGINE_API char * __cdecl UTF8_Encode(const wchar_t * AText);
LMENGINE_API char * __cdecl UTF8_Decode(const char * AText);
LMENGINE_API void __cdecl UTF8_Free(char * AText);

//--- CONSOLE ---------------------------------------------------------------
LMENGINE_API void __cdecl Console_GetCursorPos(System::PInteger X, System::PInteger Y);
LMENGINE_API void __cdecl Console_SetCursorPos(const int X, const int Y);
LMENGINE_API void __cdecl Console_Clear();
LMENGINE_API void __cdecl Console_ClearLine(const System::Word AColor);
LMENGINE_API void __cdecl Console_Print(const PAnsiChar AText, const System::Word AColor,  ...);
LMENGINE_API void __cdecl Console_PrintW(const System::WideChar * AText, const System::Word AColor, ...);
LMENGINE_API void __cdecl Console_PrintLn(const PAnsiChar AText, const System::Word AColor, ...);
LMENGINE_API void __cdecl Console_PrintLnW(const System::WideChar * AText, const System::Word AColor, ...);
LMENGINE_API void __cdecl Console_ClearKeyStates();
LMENGINE_API bool __cdecl Console_IsKeyPressed(System::Byte AKey);
LMENGINE_API bool __cdecl Console_WasKeyReleased(System::Byte AKey);
LMENGINE_API bool __cdecl Console_WasKeyPressed(System::Byte AKey);
LMENGINE_API void __cdecl Console_Pause(const bool AForcePause, System::Word AColor, const char * AText);

//--- SPEECH ----------------------------------------------------------------
LMENGINE_API void __cdecl Speech_SetWordCallback(const void * ASender, const Lmengine::Utils::Speech::WordEvent AHandler);
LMENGINE_API Lmengine::Utils::Speech::WordEvent __cdecl Speech_GetWordCallback();
LMENGINE_API int __cdecl Speech_GetVoiceCount();
LMENGINE_API const char * __cdecl Speech_GetVoiceAttribute(const int AIndex, unsigned char AAttribute);
LMENGINE_API void __cdecl Speech_ChangeVoice(const int AIndex);
LMENGINE_API int __cdecl Speech_GetVoice();
LMENGINE_API void __cdecl Speech_SetVolume(const float AVolume);
LMENGINE_API float __cdecl Speech_GetVolume();
LMENGINE_API void __cdecl Speech_SetRate(const float ARate);
LMENGINE_API float __cdecl Speech_GetRate();
LMENGINE_API void __cdecl Speech_Clear();
LMENGINE_API void __cdecl Speech_Say(const char * AText, const bool APurge);
LMENGINE_API bool __cdecl Speech_Active();
LMENGINE_API void __cdecl Speech_Pause();
LMENGINE_API void __cdecl Speech_Resume();
LMENGINE_API void __cdecl Speech_Reset();
LMENGINE_API void __cdecl Speech_SubstituteWord(const char * AWord, const char * ASubstituteWord);

//--- CORE -----------------------------------------------------------------
LMENGINE_API const char * __cdecl Version_Get(const System::Byte AType);

LMENGINE_API void __cdecl Error_Clear();
LMENGINE_API void __cdecl Error_Set(const char * AText);
LMENGINE_API const char * __cdecl Error_Get();

LMENGINE_API Lmengine::Core::TLMEngine::LoadModelProgressCallback __cdecl Callback_GetLoadModelProgress();
LMENGINE_API void __cdecl Callback_SetLoadModelProgress(const void * ASender, const Lmengine::Core::TLMEngine::LoadModelProgressCallback AHandler);
LMENGINE_API Lmengine::Core::TLMEngine::LoadModelCallback __cdecl Callback_GetLoadModel();
LMENGINE_API void __cdecl Callback_SetLoadModel(const void * ASender, const Lmengine::Core::TLMEngine::LoadModelCallback AHandler);

LMENGINE_API Lmengine::Core::TLMEngine::InferenceCancelCallback __cdecl Callback_GetInferenceCancel();
LMENGINE_API void __cdecl Callback_SetInferenceCancel(const void * ASender, const Lmengine::Core::TLMEngine::InferenceCancelCallback AHandler);

LMENGINE_API Lmengine::Core::TLMEngine::InferenceGetNextTokenCallback __cdecl Callback_GetInferenceNextToken();
LMENGINE_API void __cdecl Callback_SetInferenceNextToken(const void * ASender, const Lmengine::Core::TLMEngine::InferenceGetNextTokenCallback AHandler);

LMENGINE_API Lmengine::Core::TLMEngine::InferenceStartCallback __cdecl Callback_GetInferenceStart();
LMENGINE_API void __cdecl Callback_SetInferenceStart(const void * ASender, const Lmengine::Core::TLMEngine::InferenceStartCallback AHandler);

LMENGINE_API Lmengine::Core::TLMEngine::InferenceEndCallback __cdecl Callback_GetInferenceEnd();
LMENGINE_API void __cdecl Callback_SetInferenceEnd(const void * ASender, const Lmengine::Core::TLMEngine::InferenceEndCallback AHandler);

LMENGINE_API Lmengine::Core::TLMEngine::InfoCallback __cdecl Callback_GetInfo();
LMENGINE_API void __cdecl Callback_SetInfo(const void * ASender, const Lmengine::Core::TLMEngine::InfoCallback AHandler);

LMENGINE_API void __cdecl Config_Init(const char * AModelPath, const System::Int32 ANumGPULayers);
LMENGINE_API bool __cdecl Config_Save(const char * AFilename);
LMENGINE_API bool __cdecl Config_Load(const char * AFilename);
LMENGINE_API void __cdecl Message_ClearAll();
LMENGINE_API System::Int32 __cdecl Message_Add(const char * ARole, const char * AContent);
LMENGINE_API System::Int32 __cdecl Message_AddW(const char * ARole, System::WideChar * AContent);
LMENGINE_API const char * __cdecl Message_GetLastUser();
LMENGINE_API const char * __cdecl Message_BuildInferencePrompt(const char * AModelName);
LMENGINE_API void __cdecl Model_ClearDefines();
LMENGINE_API System::Int32 __cdecl Model_Define(const char * AModelFilename, const char * AModelName, const System::UInt32 AMaxContext, const char * ATemplate, const char * ATemplateEnd/*, const bool AAddAssistant*/);
LMENGINE_API bool __cdecl Model_SaveDefines(const char * AFilename);
LMENGINE_API bool __cdecl Model_LoadDefines(const char * AFilename);
LMENGINE_API void __cdecl Model_ClearStopSequences(const char * AModelName);
LMENGINE_API System::Int32 __cdecl Model_AddStopSequence(const char * AModelName, const char * AToken);
LMENGINE_API System::Int32 __cdecl Model_GetStopSequenceCount(const char * AModelName);
LMENGINE_API bool __cdecl Model_Load(const char * AModelName);
LMENGINE_API bool __cdecl Model_IsLoaded();
LMENGINE_API void __cdecl Model_Unload();
LMENGINE_API bool __cdecl Inference_Run(const char * AModelName, const System::UInt32 AMaxTokens);
LMENGINE_API bool __cdecl Inference_Start(const char * AModelName, const System::UInt32 AMaxTokens);
LMENGINE_API bool __cdecl Inference_IsActive();
LMENGINE_API const char * __cdecl Inference_GetNextToken();
LMENGINE_API void __cdecl Inference_Stop();
LMENGINE_API const char * __cdecl Inference_GetResponse();
LMENGINE_API void __cdecl Inference_GetUsage(System::PSingle ATokenInputSpeed, System::PSingle ATokenOutputSpeed, System::PInteger AInputTokens, System::PInteger AOutputTokens, System::PInteger ATotalTokens);

// TokenResponse
LMENGINE_API void __cdecl TokenResponse_SetRightMargin(const int AMargin);
LMENGINE_API int __cdecl TokenResponse_AddToken(const char * AToken);
LMENGINE_API const char * __cdecl TokenResponse_LastWord(const bool ATrimLastWord);
LMENGINE_API bool __cdecl TokenResponse_Finalize();


#endif
