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
#include "common.h"

//---------------------------------------------------------------------------

//=== UTILS =================================================================
LMENGINE_API void __cdecl LME_Print(const System::WideChar * AText, const int AColor, ...);
LMENGINE_API void __cdecl LME_PrintLn(const System::WideChar * AText, const int AColor, ...);
LMENGINE_API void __cdecl LME_GetCursorPos(System::PInteger X, System::PInteger Y);
LMENGINE_API void __cdecl LME_SetCursorPos(const int X, const int Y);
LMENGINE_API void __cdecl LME_ClearConsole();
LMENGINE_API void __cdecl LME_ClearConsoleLine(const System::Word AColor);
LMENGINE_API void __cdecl LME_ClearKeyStates();
LMENGINE_API bool __cdecl LME_IsKeyPressed(const System::Byte AKey);
LMENGINE_API bool __cdecl LME_WasKeyReleased(const System::Byte AKey);
LMENGINE_API bool __cdecl LME_WasKeyPressed(const System::Byte AKey);
LMENGINE_API void __cdecl LME_Pause(const bool AForcePause, System::Word AColor, const System::WideChar * AText);
LMENGINE_API void __cdecl LME_ProcessMessages();
LMENGINE_API System::WideChar * __cdecl LME_MaskFirstFoundWord(const System::WideChar * AText, const System::WideChar * AWord);

LMENGINE_API void __cdecl LME_SetTokenResponseRightMargin(const int AMargin);
LMENGINE_API int __cdecl LME_AddTokenResponseToken(const System::WideChar *  AToken);
LMENGINE_API System::WideChar * __cdecl LME_LastTokenResponseWord(const bool ATrimLeft);
LMENGINE_API bool __cdecl LME_FinalizeTokenResponse();

//=== SPEECH ================================================================
LMENGINE_API void __cdecl LME_SetSpeechWordCallback(const Lmengine::Utils::Speech::WordEvent AHandler, const void * AUserData);
LMENGINE_API Lmengine::Utils::Speech::WordEvent __cdecl LME_GetSpeechWordCallback();
LMENGINE_API int __cdecl LME_GetSpeechVoiceCount();
LMENGINE_API System::WideChar * __cdecl LME_GetSpeechVoiceAttribute(const int AIndex, const Lmengine::Utils::Speech::VoiceAttributeEvent AAttribute);
LMENGINE_API void __cdecl LME_ChangeSpeechVoice(const int AIndex);
LMENGINE_API int __cdecl LME_GetSpeechVoice();
LMENGINE_API void __cdecl LME_SetSpeechVolume(const float AVolume);
LMENGINE_API float __cdecl LME_GetSpeechVolume();
LMENGINE_API void __cdecl LME_SetSpeechRate(const float ARate);
LMENGINE_API float __cdecl LME_GetSpeechRate();
LMENGINE_API void __cdecl LME_ClearSpeech();
LMENGINE_API void __cdecl LME_SaySpeech(const System::WideChar * AText, const bool APurge);
LMENGINE_API bool __cdecl LME_IsSpeechActive();
LMENGINE_API void __cdecl LME_PauseSpeech();
LMENGINE_API void __cdecl LME_ResumeSpeech();
LMENGINE_API void __cdecl LME_ResetSpeech();
LMENGINE_API void __cdecl LME_SubstituteSpeechWord(const System::WideChar * AWord, const System::WideChar * ASubstituteWord);

//=== CORE ==================================================================
LMENGINE_API System::WideChar * __cdecl LME_GetVersion(const System::Byte AType);

LMENGINE_API void __cdecl LME_ClearError();
LMENGINE_API void __cdecl LME_SetError(const System::WideChar * AText);
LMENGINE_API System::WideChar * __cdecl LME_GetError();

LMENGINE_API Lmengine::Core::TLMEngine::InferenceCancelCallback __cdecl LME_GetInferenceCancelCallback();
LMENGINE_API void __cdecl LME_SetInferenceCancelCallback(const Lmengine::Core::TLMEngine::InferenceCancelCallback AHandler, const void * AUserData);

LMENGINE_API Lmengine::Core::TLMEngine::InferenceTokenCallback __cdecl LME_GetInferenceTokenCallback();
LMENGINE_API void __cdecl LME_SetInferenceTokenlCallback(const Lmengine::Core::TLMEngine::InferenceTokenCallback AHandler, const void * AUserData);

LMENGINE_API Lmengine::Core::TLMEngine::InfoCallback __cdecl LME_GetInfoCallback();
LMENGINE_API void __cdecl LME_SetInfoCallback(const Lmengine::Core::TLMEngine::InfoCallback AHandler, const void * AUserData);
LMENGINE_API Lmengine::Core::TLMEngine::LoadModelProgressCallback __cdecl LME_GetLoadModelProgressCallback();
LMENGINE_API void __cdecl LME_SetLoadModelProgressCallback(const Lmengine::Core::TLMEngine::LoadModelProgressCallback AHandler, const void * AUserData);
LMENGINE_API Lmengine::Core::TLMEngine::LoadModelCallback __cdecl LME_GetLoadModelCallback();
LMENGINE_API void __cdecl LME_SetLoadModelCallback(const Lmengine::Core::TLMEngine::LoadModelCallback AHandler, const void * AUserData);
LMENGINE_API Lmengine::Core::TLMEngine::InferenceStartCallback __cdecl LME_GetInferenceStartCallback();
LMENGINE_API void __cdecl LME_SetInferenceStartCallback(const Lmengine::Core::TLMEngine::InferenceStartCallback AHandler, const void * AUserData);
LMENGINE_API Lmengine::Core::TLMEngine::InferenceEndCallback __cdecl LME_GetInferenceEndCallback();
LMENGINE_API void __cdecl LME_SetInferenceEndCallback(const Lmengine::Core::TLMEngine::InferenceEndCallback AHandler, const void * AUserData);

LMENGINE_API void __cdecl LME_InitConfig(const System::WideChar * AModelPath, const System::Int32 ANumGPULayers, const System::Int32 ANumThreads);
LMENGINE_API bool __cdecl LME_SaveConfig(const System::WideChar * AFilename);
LMENGINE_API bool __cdecl LME_LoadConfig(const System::WideChar * AFilename);
LMENGINE_API void __cdecl LME_ClearAllMessages();
LMENGINE_API System::Int32 __cdecl LME_AddMessage(const System::WideChar * ARole, const System::WideChar * AContent);
LMENGINE_API System::WideChar * __cdecl LME_GetLastUserMessage();
LMENGINE_API System::WideChar * __cdecl LME_BuildMessageInferencePrompt(const System::WideChar * AModelName);
LMENGINE_API void __cdecl LME_ClearModelDefines();
LMENGINE_API System::Int32 __cdecl LME_DefineModel(const System::WideChar * AModelFilename, const System::WideChar * AModelName, const System::UInt32 AMaxContext, const System::WideChar * ATemplate, const System::WideChar * ATemplateEnd);
LMENGINE_API bool __cdecl LME_SaveModelDefines(const System::WideChar * AFilename);
LMENGINE_API bool __cdecl LME_LoadModelDefines(const System::WideChar * AFilename);

LMENGINE_API bool __cdecl LME_LoadModel(const System::WideChar * AModelName);
LMENGINE_API bool __cdecl LME_IsModelLoaded();
LMENGINE_API void __cdecl LME_UnloadModel();

LMENGINE_API bool __cdecl LME_RunInference(const System::WideChar * AModelName, const System::UInt32 AMaxTokens);
LMENGINE_API System::WideChar * __cdecl LME_GetInferenceResponse();
LMENGINE_API void __cdecl LME_GetInferenceStats(System::PSingle ATokenInputSpeed, System::PSingle ATokenOutputSpeed, Lmengine::Deps::PInt32 AInputTokens, Lmengine::Deps::PInt32 AOutputTokens, Lmengine::Deps::PInt32 ATotalTokens);

//=== RAG ===================================================================
LMENGINE_API Lmengine::Rag::TLocalDb* __cdecl LME_LocalDb_New();
LMENGINE_API void __cdecl LME_LocalDb_Free(Lmengine::Rag::TLocalDb* &ALocalDb);
LMENGINE_API bool __cdecl LME_LocalDb_IsOpen(Lmengine::Rag::TLocalDb* const ALocalDb);
LMENGINE_API bool __cdecl LME_LocalDb_Open(Lmengine::Rag::TLocalDb* const ALocalDb, const System::WideChar * AFilename);
LMENGINE_API void __cdecl LME_LocalDb_Close(Lmengine::Rag::TLocalDb* const ALocalDb);
LMENGINE_API void __cdecl LME_LocalDb_ClearSQLText(Lmengine::Rag::TLocalDb* const ALocalDb);
LMENGINE_API void __cdecl LME_LocalDb_AddSQLText(Lmengine::Rag::TLocalDb* const ALocalDb, const System::WideChar * AText);
LMENGINE_API System::WideChar * __cdecl LME_LocalDb_GetSQLText(Lmengine::Rag::TLocalDb* const ALocalDb);
LMENGINE_API void __cdecl LME_LocalDb_SetSQLText(Lmengine::Rag::TLocalDb* const ALocalDb, const System::WideChar * AText);
LMENGINE_API System::WideChar * __cdecl LME_LocalDb_GetPrepairedSQL(Lmengine::Rag::TLocalDb* const ALocalDb);
LMENGINE_API void __cdecl LME_LocalDb_ClearMacros(Lmengine::Rag::TLocalDb* const ALocalDb);
LMENGINE_API System::WideChar * __cdecl LME_LocalDb_GetMacro(Lmengine::Rag::TLocalDb* const ALocalDb, const System::WideChar * AName);
LMENGINE_API void __cdecl LME_LocalDb_SetMacro(Lmengine::Rag::TLocalDb* const ALocalDb, const System::WideChar * AName, const System::WideChar * AValue);
LMENGINE_API void __cdecl LME_LocalDb_ClearParams(Lmengine::Rag::TLocalDb* const ALocalDb);
LMENGINE_API System::WideChar * __cdecl LME_LocalDb_GetParam(Lmengine::Rag::TLocalDb* const ALocalDb, const System::WideChar * AName);
LMENGINE_API void __cdecl LME_LocalDb_SetParam(Lmengine::Rag::TLocalDb* const ALocalDb, const System::WideChar * AName, const System::WideChar * AValue);
LMENGINE_API int __cdecl LME_LocalDb_GetRecordCount(Lmengine::Rag::TLocalDb* const ALocalDb);
LMENGINE_API System::WideChar * __cdecl LME_LocalDb_GetField(Lmengine::Rag::TLocalDb* const ALocalDb, const unsigned AIndex, const System::WideChar * AName);
LMENGINE_API bool __cdecl LME_LocalDb_Execute(Lmengine::Rag::TLocalDb* const ALocalDb);
LMENGINE_API bool __cdecl LME_LocalDb_ExecuteSQL(Lmengine::Rag::TLocalDb* const ALocalDb, const System::WideChar * ASQL);
LMENGINE_API System::WideChar * __cdecl LME_LocalDb_GetLastError(Lmengine::Rag::TLocalDb* const ALocalDb);
LMENGINE_API System::WideChar * __cdecl LME_LocalDb_GetResponseText(Lmengine::Rag::TLocalDb* const ALocalDb);



#endif
