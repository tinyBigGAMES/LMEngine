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

#pragma hdrstop

#include <stdarg.h>
#include <stdio.h>
#include <windows.h>

#include "LMEngine.Export.hpp"
#include "LMEngine.Utils.hpp"
#include "exports.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

// Console

LMENGINE_API void __cdecl LME_Print(const wchar_t* AText, const int AColor, ...)
{
    int count;
    va_list args;

    va_start(args, AColor);
    count = _vscwprintf(AText, args);
    va_end(args);

    if (count < 1) {
		Lmengine::Export::LME_Print(L"", AColor);
        return;
    }

	printf("%c", '\0');  //TODO: This is nuts, without this printf, "%f"
                         //      floating point formatting will always be zero
                         //      when the dll is compiled in debug mode. Need
                         //      to figure out what is going on with this.

    wchar_t* buffer = (wchar_t*)malloc((count + 1) * sizeof(wchar_t));
    if (buffer)
    {
	    va_start(args, AColor);
        vswprintf(buffer, (count + 1), AText, args);
	    va_end(args);
        Lmengine::Export::LME_Print((wchar_t*)buffer, AColor);
        free(buffer);
    }
}

LMENGINE_API void __cdecl LME_PrintLn(const System::WideChar * AText, const int AColor, ...)
{
    int count;
    va_list args;

    va_start(args, AColor);
    count = _vscwprintf(AText, args);
    va_end(args);

    if (count < 1) {
		Lmengine::Export::LME_PrintLn(L"", AColor);
        return;
    }

	printf("%c", '\0');  //TODO: This is nuts, without this printf, "%f"
                         //      floating point formatting will always be zero
                         //      when the dll is compiled in debug mode. Need
                         //      to figure out what is going on with this.

    wchar_t* buffer = (wchar_t*)malloc((count + 1) * sizeof(wchar_t));
    if (buffer)
    {
	    va_start(args, AColor);
        vswprintf(buffer, (count + 1), AText, args);
		va_end(args);
        Lmengine::Export::LME_PrintLn(buffer, AColor);
        free(buffer);
    }
}

LMENGINE_API void __cdecl LME_GetCursorPos(System::PInteger X, System::PInteger Y)
{
	Lmengine::Export::LME_GetCursorPos(X, Y);
}

LMENGINE_API void __cdecl LME_SetCursorPos(const int X, const int Y)
{
	Lmengine::Export::LME_SetCursorPos(X, Y);
}

LMENGINE_API void __cdecl LME_ClearConsole()
{
	Lmengine::Export::LME_ClearConsole();
}

LMENGINE_API void __cdecl LME_ClearConsoleLine(const System::Word AColor)
{
	Lmengine::Export::LME_ClearConsoleLine(AColor);
}

LMENGINE_API void __cdecl LME_ClearKeyStates()
{
	Lmengine::Export::LME_ClearKeyStates();
}

LMENGINE_API bool __cdecl LME_IsKeyPressed(const System::Byte AKey)
{
	return Lmengine::Export::LME_IsKeyPressed(AKey);
}

LMENGINE_API bool __cdecl LME_WasKeyReleased(const System::Byte AKey)
{
	return Lmengine::Export::LME_WasKeyReleased(AKey);
}

LMENGINE_API bool __cdecl LME_WasKeyPressed(const System::Byte AKey)
{
	return Lmengine::Export::LME_WasKeyPressed(AKey);
}

LMENGINE_API void __cdecl LME_Pause(const bool AForcePause, System::Word AColor, const System::WideChar * AText)
{
	Lmengine::Export::LME_Pause(AForcePause, AColor, AText);
}

LMENGINE_API void __cdecl LME_ProcessMessages()
{
	Lmengine::Export::LME_ProcessMessages();
}

LMENGINE_API System::WideChar * __cdecl LME_MaskFirstFoundWord(const System::WideChar * AText, const System::WideChar * AWord)
{
	return Lmengine::Export::LME_MaskFirstFoundWord(AText, AWord);
}

LMENGINE_API void __cdecl LME_SetTokenResponseRightMargin(const int AMargin)
{
	Lmengine::Export::LME_SetTokenResponseRightMargin(AMargin);
}

LMENGINE_API int __cdecl LME_AddTokenResponseToken(const System::WideChar *  AToken)
{
	return Lmengine::Export::LME_AddTokenResponseToken(AToken);
}

LMENGINE_API System::WideChar * __cdecl LME_LastTokenResponseWord(const bool ATrimLeft)
{
	return Lmengine::Export::LME_LastTokenResponseWord(ATrimLeft);
}

LMENGINE_API bool __cdecl LME_FinalizeTokenResponse()
{
	return Lmengine::Export::LME_FinalizeTokenResponse();
}


//=== SPEECH ================================================================
LMENGINE_API void __cdecl LME_SetSpeechWordCallback(const Lmengine::Utils::Speech::WordEvent AHandler, const void * AUserData)
{
	Lmengine::Export::LME_SetSpeechWordCallback(AHandler, AUserData);
}

LMENGINE_API Lmengine::Utils::Speech::WordEvent __cdecl LME_GetSpeechWordCallback()
{
	return Lmengine::Export::LME_GetSpeechWordCallback();
}

LMENGINE_API int __cdecl LME_GetSpeechVoiceCount()
{
	return Lmengine::Export::LME_GetSpeechVoiceCount();
}

LMENGINE_API System::WideChar * __cdecl LME_GetSpeechVoiceAttribute(const int AIndex, const Lmengine::Utils::Speech::VoiceAttributeEvent AAttribute)
{
	return Lmengine::Export::LME_GetSpeechVoiceAttribute(AIndex, AAttribute);
}

LMENGINE_API void __cdecl LME_ChangeSpeechVoice(const int AIndex)
{
    Lmengine::Export::LME_ChangeSpeechVoice(AIndex);
}

LMENGINE_API int __cdecl LME_GetSpeechVoice()
{
	return Lmengine::Export::LME_GetSpeechVoice();
}

LMENGINE_API void __cdecl LME_SetSpeechVolume(const float AVolume)
{
   Lmengine::Export::LME_SetSpeechVolume(AVolume);
}

LMENGINE_API float __cdecl LME_GetSpeechVolume()
{
	return Lmengine::Export::LME_GetSpeechVolume();
}

LMENGINE_API void __cdecl LME_SetSpeechRate(const float ARate)
{
	Lmengine::Export::LME_SetSpeechRate(ARate);
}

LMENGINE_API float __cdecl LME_GetSpeechRate()
{
	return Lmengine::Export::LME_GetSpeechRate();
}

LMENGINE_API void __cdecl LME_ClearSpeech()
{
	Lmengine::Export::LME_ClearSpeech();
}

LMENGINE_API void __cdecl LME_SaySpeech(const System::WideChar * AText, const bool APurge)
{
	Lmengine::Export::LME_SaySpeech(AText, APurge);
}

LMENGINE_API bool __cdecl LME_IsSpeechActive()
{
	return Lmengine::Export::LME_IsSpeechActive();
}

LMENGINE_API void __cdecl LME_PauseSpeech()
{
	Lmengine::Export::LME_PauseSpeech();
}

LMENGINE_API void __cdecl LME_ResumeSpeech()
{
	Lmengine::Export::LME_ResumeSpeech();
}

LMENGINE_API void __cdecl LME_ResetSpeech()
{
	Lmengine::Export::LME_ResetSpeech();
}

LMENGINE_API void __cdecl LME_SubstituteSpeechWord(const System::WideChar * AWord, const System::WideChar * ASubstituteWord)
{
	Lmengine::Export::LME_SubstituteSpeechWord(AWord, ASubstituteWord);
}

//=== CORE ==================================================================
LMENGINE_API System::WideChar * __cdecl LME_GetVersion(const System::Byte AType)
{
	return Lmengine::Export::LME_GetVersion(AType);
}


LMENGINE_API void __cdecl LME_ClearError()
{
	Lmengine::Export::LME_ClearError();
}

LMENGINE_API void __cdecl LME_SetError(const System::WideChar * AText)
{
	Lmengine::Export::LME_SetError(AText);
}

LMENGINE_API System::WideChar * __cdecl LME_GetError()
{
   	return Lmengine::Export::LME_GetError();
}

LMENGINE_API Lmengine::Core::TLMEngine::InferenceCancelCallback __cdecl LME_GetInferenceCancelCallback()
{
   	return Lmengine::Export::LME_GetInferenceCancelCallback();
}

LMENGINE_API void __cdecl LME_SetInferenceCancelCallback(const Lmengine::Core::TLMEngine::InferenceCancelCallback AHandler, const void * AUserData)
{
   	Lmengine::Export::LME_SetInferenceCancelCallback(AHandler, AUserData);
}

LMENGINE_API Lmengine::Core::TLMEngine::InferenceTokenCallback __cdecl LME_GetInferenceTokenCallback()
{
    return Lmengine::Export::LME_GetInferenceTokenCallback();
}

LMENGINE_API void __cdecl LME_SetInferenceTokenlCallback(const Lmengine::Core::TLMEngine::InferenceTokenCallback AHandler, const void * AUserData)
{
	Lmengine::Export::LME_SetInferenceTokenlCallback(AHandler, AUserData);
}

LMENGINE_API Lmengine::Core::TLMEngine::InfoCallback __cdecl LME_GetInfoCallback()
{
   return Lmengine::Export::LME_GetInfoCallback();
}

LMENGINE_API void __cdecl LME_SetInfoCallback(const Lmengine::Core::TLMEngine::InfoCallback AHandler, const void * AUserData)
{
   Lmengine::Export::LME_SetInfoCallback(AHandler, AUserData);
}

LMENGINE_API Lmengine::Core::TLMEngine::LoadModelProgressCallback __cdecl LME_GetLoadModelProgressCallback()
{
   return Lmengine::Export::LME_GetLoadModelProgressCallback();
}

LMENGINE_API void __cdecl LME_SetLoadModelProgressCallback(const Lmengine::Core::TLMEngine::LoadModelProgressCallback AHandler, const void * AUserData)
{
   Lmengine::Export::LME_SetLoadModelProgressCallback(AHandler, AUserData);
}

LMENGINE_API Lmengine::Core::TLMEngine::LoadModelCallback __cdecl LME_GetLoadModelCallback()
{
   return Lmengine::Export::LME_GetLoadModelCallback();
}

LMENGINE_API void __cdecl LME_SetLoadModelCallback(const Lmengine::Core::TLMEngine::LoadModelCallback AHandler, const void * AUserData)
{
   Lmengine::Export::LME_SetLoadModelCallback(AHandler, AUserData);
}

LMENGINE_API Lmengine::Core::TLMEngine::InferenceStartCallback __cdecl LME_GetInferenceStartCallback()
{
   return Lmengine::Export::LME_GetInferenceStartCallback();
}

LMENGINE_API void __cdecl LME_SetInferenceStartCallback(const Lmengine::Core::TLMEngine::InferenceStartCallback AHandler, const void * AUserData)
{
   Lmengine::Export::LME_SetInferenceStartCallback(AHandler, AUserData);
}

LMENGINE_API Lmengine::Core::TLMEngine::InferenceEndCallback __cdecl LME_GetInferenceEndCallback()
{
   return Lmengine::Export::LME_GetInferenceEndCallback();
}

LMENGINE_API void __cdecl LME_SetInferenceEndCallback(const Lmengine::Core::TLMEngine::InferenceEndCallback AHandler, const void * AUserData)
{
   Lmengine::Export::LME_SetInferenceEndCallback(AHandler, AUserData);
}

LMENGINE_API void __cdecl LME_InitConfig(const System::WideChar * AModelPath, const System::Int32 ANumGPULayers)
{
	Lmengine::Export::LME_InitConfig(AModelPath, ANumGPULayers);
}

LMENGINE_API bool __cdecl LME_SaveConfig(const System::WideChar * AFilename)
{
	return Lmengine::Export::LME_SaveConfig(AFilename);
}

LMENGINE_API bool __cdecl LME_LoadConfig(const System::WideChar * AFilename)
{
	return Lmengine::Export::LME_LoadConfig(AFilename);
}

LMENGINE_API void __cdecl LME_ClearAllMessages()
{
	Lmengine::Export::LME_ClearAllMessages();
}

LMENGINE_API System::Int32 __cdecl LME_AddMessage(const System::WideChar * ARole, const System::WideChar * AContent)
{
	return Lmengine::Export::LME_AddMessage(ARole, AContent);
}

LMENGINE_API System::WideChar * __cdecl LME_GetLastUserMessage()
{
	return Lmengine::Export::LME_GetLastUserMessage();
}

LMENGINE_API System::WideChar * __cdecl LME_BuildMessageInferencePrompt(const System::WideChar * AModelName)
{
	return Lmengine::Export::LME_BuildMessageInferencePrompt(AModelName);
}

LMENGINE_API void __cdecl LME_ClearModelDefines()
{
	Lmengine::Export::LME_ClearModelDefines();
}

LMENGINE_API System::Int32 __cdecl LME_DefineModel(const System::WideChar * AModelFilename, const System::WideChar * AModelName, const System::UInt32 AMaxContext, const System::WideChar * ATemplate, const System::WideChar * ATemplateEnd)
{
	return Lmengine::Export::LME_DefineModel(AModelFilename, AModelName, AMaxContext, ATemplate, ATemplateEnd);
}

LMENGINE_API bool __cdecl LME_SaveModelDefines(const System::WideChar * AFilename)
{
	return Lmengine::Export::LME_SaveModelDefines(AFilename);
}

LMENGINE_API bool __cdecl LME_LoadModelDefines(const System::WideChar * AFilename)
{
	return Lmengine::Export::LME_LoadModelDefines(AFilename);
}

LMENGINE_API bool __cdecl LME_LoadModel(const System::WideChar * AModelName)
{
   	return Lmengine::Export::LME_LoadModel(AModelName);
}

LMENGINE_API bool __cdecl LME_IsModelLoaded()
{
   	return Lmengine::Export::LME_IsModelLoaded();
}

LMENGINE_API void __cdecl LME_UnloadModel()
{
   	Lmengine::Export::LME_UnloadModel();
}

LMENGINE_API bool __cdecl LME_RunInference(const System::WideChar * AModelName, const System::UInt32 AMaxTokens)
{
   	return Lmengine::Export::LME_RunInference(AModelName, AMaxTokens);
}

LMENGINE_API System::WideChar * __cdecl LME_GetInferenceResponse()
{
    return Lmengine::Export::LME_GetInferenceResponse();
}

LMENGINE_API void __cdecl LME_GetInferenceStats(System::PSingle ATokenInputSpeed, System::PSingle ATokenOutputSpeed, Lmengine::Deps::PInt32 AInputTokens, Lmengine::Deps::PInt32 AOutputTokens, Lmengine::Deps::PInt32 ATotalTokens)
{
   	Lmengine::Export::LME_GetInferenceStats(ATokenInputSpeed, ATokenOutputSpeed, AInputTokens, AOutputTokens, ATotalTokens);
}

