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

//--- UTILS -----------------------------------------------------------------
LMENGINE_API void __cdecl Utils_ProcessMessages()
{
    Lmengine::Export::Utils_ProcessMessages();
}

LMENGINE_API const char * __cdecl Utils_MaskFirstFoundWord(const char * AText, const char * AWord)
{
	return Lmengine::Export::Utils_MaskFirstFoundWord(AText, AWord);
}

//--- UTF8 ------------------------------------------------------------------
LMENGINE_API char * __cdecl UTF8_Encode(const wchar_t * AText)
{
    return Lmengine::Export::UTF8_Encode(AText);
}

LMENGINE_API char * __cdecl UTF8_Decode(const char * AText)
{
    return Lmengine::Export::UTF8_Decode(AText);
}

LMENGINE_API void __cdecl UTF8_Free(char * AText)
{
    Lmengine::Export::UTF8_Free(AText);
}

//--- CONSOLE ---------------------------------------------------------------
LMENGINE_API void __cdecl Console_GetCursorPos(System::PInteger X, System::PInteger Y)
{
    Lmengine::Export::Console_GetCursorPos(X, Y);
}

LMENGINE_API void __cdecl Console_SetCursorPos(const int X, const int Y)
{
	Lmengine::Export::Console_SetCursorPos(X, Y);
}

LMENGINE_API void __cdecl Console_Clear()
{
    Lmengine::Export::Console_Clear();
}

LMENGINE_API void __cdecl Console_ClearLine(const System::Word AColor)
{
    Lmengine::Export::Console_ClearLine(AColor);
}

LMENGINE_API void __cdecl Console_Print(const PAnsiChar AText, const System::Word AColor, ...)
{
    int count;
    va_list args;
    va_start(args, count);

    // Set console text color
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(hConsole, AColor);

    // Print the main text
    vprintf(AText, args);

    // Reset console text color to default
    SetConsoleTextAttribute(hConsole, FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE);

    va_end(args);
}

LMENGINE_API void __cdecl Console_PrintW(const wchar_t* AText, const unsigned short AColor, ...)
{
    va_list args;
    va_start(args, AColor);

    // Set console text color
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(hConsole, AColor);

    // Print the main text
    vwprintf(AText, args);

    // Reset console text color to default
    SetConsoleTextAttribute(hConsole, FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE);

    va_end(args);
}

LMENGINE_API void __cdecl Console_PrintLn(const PAnsiChar AText, const System::Word AColor, ...)
{
	int count;
    va_list args;
    va_start(args, count);

    // Set console text color
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(hConsole, AColor);

    // Print the formatted text
    vprintf(AText, args);

    // Print the newline
    printf("\n");

    // Reset console text color to default
    SetConsoleTextAttribute(hConsole, FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE);

    // Clean up the variable argument list
    va_end(args);
}

LMENGINE_API void __cdecl Console_PrintLnW(const System::WideChar * AText, const unsigned short AColor, ...)
{
    va_list args;
    va_start(args, AColor);

    // Set console text color
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(hConsole, AColor);

    // Print the formatted text
    vwprintf(AText, args);

    // Print the newline
    wprintf(L"\n");

    // Reset console text color to default
    SetConsoleTextAttribute(hConsole, FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE);

    // Clean up the variable argument list
    va_end(args);
}

LMENGINE_API void __cdecl Console_ClearKeyStates()
{
	Lmengine::Export::Console_ClearKeyStates();
}

LMENGINE_API bool __cdecl Console_IsKeyPressed(System::Byte AKey)
{
	return Lmengine::Export::Console_IsKeyPressed(AKey);
}

LMENGINE_API bool __cdecl Console_WasKeyReleased(System::Byte AKey)
{
	return Lmengine::Export::Console_WasKeyReleased(AKey);
}

LMENGINE_API bool __cdecl Console_WasKeyPressed(System::Byte AKey)
{
	return Lmengine::Export::Console_WasKeyPressed(AKey);
}

LMENGINE_API void __cdecl Console_Pause(const bool AForcePause, System::Word AColor, const char * AText)
{
    Lmengine::Export::Console_Pause(AForcePause, AColor, AText);
}

//--- SPEECH ----------------------------------------------------------------
LMENGINE_API void __cdecl Speech_SetWordCallback(const void * ASender, const Lmengine::Utils::Speech::WordEvent AHandler)
{
    Lmengine::Export::Speech_SetWordCallback(ASender, AHandler);
}

LMENGINE_API Lmengine::Utils::Speech::WordEvent __cdecl Speech_GetWordEvent()
{
    return Lmengine::Export::Speech_GetWordCallback();
}

LMENGINE_API int __cdecl Speech_GetVoiceCount()
{
    return Lmengine::Export::Speech_GetVoiceCount();
}

LMENGINE_API const char * __cdecl Speech_GetVoiceAttribute(const int AIndex, unsigned char AAttribute)
{
    if (AAttribute > 6)
        return "";
    else
	    return Lmengine::Export::Speech_GetVoiceAttribute(AIndex, (Lmengine::Utils::Speech::VoiceAttributeEvent)AAttribute);
}

LMENGINE_API void __cdecl Speech_ChangeVoice(const int AIndex)
{
    Lmengine::Export::Speech_ChangeVoice(AIndex);
}

LMENGINE_API int __cdecl Speech_GetVoice()
{
    return Lmengine::Export::Speech_GetVoice();
}

LMENGINE_API void __cdecl Speech_SetVolume(const float AVolume)
{
    Lmengine::Export::Speech_SetVolume(AVolume);
}

LMENGINE_API float __cdecl Speech_GetVolume()
{
    return Lmengine::Export::Speech_GetVolume();
}

LMENGINE_API void __cdecl Speech_SetRate(const float ARate)
{
    Lmengine::Export::Speech_SetRate(ARate);
}

LMENGINE_API float __cdecl Speech_GetRate()
{
    return Lmengine::Export::Speech_GetRate();
}

LMENGINE_API void __cdecl Speech_Clear()
{
    Lmengine::Export::Speech_Clear();
}

LMENGINE_API void __cdecl Speech_Say(const char * AText, const bool APurge)
{
    Lmengine::Export::Speech_Say(AText, APurge);
}

LMENGINE_API bool __cdecl Speech_Active()
{
    return Lmengine::Export::Speech_Active();
}

LMENGINE_API void __cdecl Speech_Pause()
{
    Lmengine::Export::Speech_Pause();
}

LMENGINE_API void __cdecl Speech_Resume()
{
    Lmengine::Export::Speech_Resume();
}

LMENGINE_API void __cdecl Speech_Reset()
{
    Lmengine::Export::Speech_Reset();
}

LMENGINE_API void __cdecl Speech_SubstituteWord(const char * AWord, const char * ASubstituteWord)
{
    Lmengine::Export::Speech_SubstituteWord(AWord, ASubstituteWord);
}

//--- CORE ------------------------------------------------------------------
LMENGINE_API const char * __cdecl Version_Get(const System::Byte AType)
{
    return Lmengine::Export::Version_Get(AType);
}

LMENGINE_API void __cdecl Error_Clear()
{
	Lmengine::Export::Error_Clear();
}

LMENGINE_API void __cdecl Error_Set(const char * AText)
{
	Lmengine::Export::Error_Set(AText);
}

LMENGINE_API const char * __cdecl Error_Get()
{
	return Lmengine::Export::Error_Get();
}

LMENGINE_API Lmengine::Core::TLMEngine::LoadModelProgressCallback __cdecl Callback_GetLoadModelProgress()
{
    return Lmengine::Export::Callback_GetLoadModelProgress();
}

LMENGINE_API void __cdecl Callback_SetLoadModelProgress(const void * ASender, const Lmengine::Core::TLMEngine::LoadModelProgressCallback AHandler)
{
	Lmengine::Export::Callback_SetLoadModelProgress(ASender, AHandler);
}

LMENGINE_API Lmengine::Core::TLMEngine::LoadModelCallback __cdecl Callback_GetLoadModel()
{
    return Lmengine::Export::Callback_GetLoadModel();
}

LMENGINE_API void __cdecl Callback_SetLoadModel(const void * ASender, const Lmengine::Core::TLMEngine::LoadModelCallback AHandler)
{
	Lmengine::Export::Callback_SetLoadModel(ASender, AHandler);
}

LMENGINE_API Lmengine::Core::TLMEngine::InferenceCancelCallback __cdecl Callback_GetInferenceCancel()
{
	return Lmengine::Export::Callback_GetInferenceCancel();
}

LMENGINE_API void __cdecl Callback_SetInferenceCancel(const void * ASender, const Lmengine::Core::TLMEngine::InferenceCancelCallback AHandler)
{
	Lmengine::Export::Callback_SetInferenceCancel(ASender, AHandler);
}

LMENGINE_API Lmengine::Core::TLMEngine::InferenceGetNextTokenCallback __cdecl Callback_GetInferenceNextToken()
{
	return Lmengine::Export::Callback_GetInferenceNextToken();
}

LMENGINE_API void __cdecl Callback_SetInferenceNextToken(const void * ASender, const Lmengine::Core::TLMEngine::InferenceGetNextTokenCallback AHandler)
{
	Lmengine::Export::Callback_SetInferenceNextToken(ASender, AHandler);
}

LMENGINE_API Lmengine::Core::TLMEngine::InferenceStartCallback __cdecl Callback_GetInferenceStart()
{
	return Lmengine::Export::Callback_GetInferenceStart();
}

LMENGINE_API void __cdecl Callback_SetInferenceStart(const void * ASender, const Lmengine::Core::TLMEngine::InferenceStartCallback AHandler)
{
	Lmengine::Export::Callback_SetInferenceStart(ASender, AHandler);
}

LMENGINE_API Lmengine::Core::TLMEngine::InferenceEndCallback __cdecl Callback_GetInferenceEnd()
{
	return Lmengine::Export::Callback_GetInferenceEnd();
}

LMENGINE_API void __cdecl Callback_SetInferenceEnd(const void * ASender, const Lmengine::Core::TLMEngine::InferenceEndCallback AHandler)
{
	Lmengine::Export::Callback_SetInferenceEnd(ASender, AHandler);
}

LMENGINE_API Lmengine::Core::TLMEngine::InfoCallback __cdecl Callback_GetInfo()
{
	return Lmengine::Export::Callback_GetInfo();
}

LMENGINE_API void __cdecl Callback_SetInfo(const void * ASender, const Lmengine::Core::TLMEngine::InfoCallback AHandler)
{
	Lmengine::Export::Callback_SetInfo(ASender, AHandler);
}

LMENGINE_API void __cdecl Config_Init(const char * AModelPath, const System::Int32 ANumGPULayers)
{
	Lmengine::Export::Config_Init(AModelPath, ANumGPULayers);
}

LMENGINE_API bool __cdecl Config_Save(const char * AFilename)
{
	return Lmengine::Export::Config_Save(AFilename);
}

LMENGINE_API bool __cdecl Config_Load(const char * AFilename)
{
	return Lmengine::Export::Config_Load(AFilename);
}

LMENGINE_API void __cdecl Message_ClearAll()
{
	Lmengine::Export::Message_ClearAll();
}

LMENGINE_API System::Int32 __cdecl Message_Add(const char * ARole, const char * AContent)
{
	return Lmengine::Export::Message_Add(ARole, AContent);
}

LMENGINE_API System::Int32 __cdecl Message_AddW(const char * ARole, System::WideChar * AContent)
{
	return Lmengine::Export::Message_AddW(ARole, AContent);
}

LMENGINE_API const char * __cdecl Message_GetLastUser()
{
	return Lmengine::Export::Message_GetLastUser();
}

LMENGINE_API const char * __cdecl Message_BuildInferencePrompt(const char * AModelName)
{
	return Lmengine::Export::Message_BuildInferencePrompt(AModelName);
}

LMENGINE_API void __cdecl Model_ClearDefines()
{
	Lmengine::Export::Model_ClearDefines();
}

LMENGINE_API System::Int32 __cdecl Model_Define(const char * AModelFilename, const char * AModelName, const System::UInt32 AMaxContext, const char * ATemplate, const char * ATemplateEnd/*, const bool AAddAssistant*/)
{
	return Lmengine::Export::Model_Define(AModelFilename, AModelName, AMaxContext, ATemplate, ATemplateEnd/*, AAddAssistant*/);
}

LMENGINE_API bool __cdecl Model_SaveDefines(const char * AFilename)
{
	return Lmengine::Export::Model_SaveDefines(AFilename);
}

LMENGINE_API bool __cdecl Model_LoadDefines(const char * AFilename)
{
	return Lmengine::Export::Model_LoadDefines(AFilename);
}

LMENGINE_API void __cdecl Model_ClearStopSequences(const char * AModelName)
{
	Lmengine::Export::Model_ClearStopSequences(AModelName);
}

LMENGINE_API System::Int32 __cdecl Model_AddStopSequence(const char * AModelName, const char * AToken)
{
	return Lmengine::Export::Model_AddStopSequence(AModelName, AToken);
}

LMENGINE_API System::Int32 __cdecl Model_GetStopSequenceCount(const char * AModelName)
{
	return Lmengine::Export::Model_GetStopSequenceCount(AModelName);
}

LMENGINE_API bool __cdecl Model_Load(const char * AModelName)
{
	return Lmengine::Export::Model_Load(AModelName);
}

LMENGINE_API bool __cdecl Model_IsLoaded()
{
	return Lmengine::Export::Model_IsLoaded();
}

LMENGINE_API void __cdecl Model_Unload()
{
	Lmengine::Export::Model_Unload();
}

LMENGINE_API bool __cdecl Inference_Run(const char * AModelName, const System::UInt32 AMaxTokens)
{
	return Lmengine::Export::Inference_Run(AModelName, AMaxTokens);
}

LMENGINE_API bool __cdecl Inference_Start(const char * AModelName, const System::UInt32 AMaxTokens)
{
	return Lmengine::Export::Inference_Start(AModelName, AMaxTokens);
}

LMENGINE_API bool __cdecl Inference_IsActive()
{
	return Lmengine::Export::Inference_IsActive();
}

LMENGINE_API const char * __cdecl Inference_GetNextToken()
{
	return Lmengine::Export::Inference_GetNextToken();
}

LMENGINE_API void __cdecl Inference_Stop()
{
	Lmengine::Export::Inference_Stop();
}

LMENGINE_API const char * __cdecl Inference_GetResponse()
{
	return Lmengine::Export::Inference_GetResponse();
}

LMENGINE_API void __cdecl Inference_GetUsage(System::PSingle ATokenInputSpeed, System::PSingle ATokenOutputSpeed, System::PInteger AInputTokens, System::PInteger AOutputTokens, System::PInteger ATotalTokens)
{
	Lmengine::Export::Inference_GetUsage(ATokenInputSpeed, ATokenOutputSpeed, AInputTokens, AOutputTokens, ATotalTokens);
}


// TokenResponse
LMENGINE_API void __cdecl TokenResponse_SetRightMargin(const int AMargin)
{
	Lmengine::Export::TokenResponse_SetRightMargin(AMargin);
}

LMENGINE_API int __cdecl TokenResponse_AddToken(const char * AToken)
{
	return Lmengine::Export::TokenResponse_AddToken(AToken);
}

LMENGINE_API const char * __cdecl TokenResponse_LastWord(const bool ATrimLastWord)
{
	return Lmengine::Export::TokenResponse_LastWord(ATrimLastWord);
}

LMENGINE_API bool __cdecl TokenResponse_Finalize()
{
	return Lmengine::Export::TokenResponse_Finalize();
}



