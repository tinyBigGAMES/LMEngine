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

//---------------------------------------------------------------------------

#pragma hdrstop

#include <stdio.h>
#include <LMEngine.h>
#include "utestbed.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

#include <stdio.h>
#include <stdbool.h>

bool OnInferenceCancel(const void* AUserData) {
    return LME_WasKeyReleased(LME_VKEY_ESCAPE);
}

void OnInferenceToken(const wchar_t* AToken, const void* AUserData) {
    // Handle new tokens
    switch (LME_AddTokenResponseToken(AToken)) {
        case LME_TOKENRESPONSE_WAIT:
            // Do nothing, need more tokens
            break;

        case LME_TOKENRESPONSE_APPEND:
            LME_Print(LME_LastTokenResponseWord(false), LME_FG_WHITE);
            break;

        case LME_TOKENRESPONSE_NEWLINE:
            LME_PrintLn(L"", LME_FG_WHITE);
            LME_Print(LME_LastTokenResponseWord(true), LME_FG_WHITE);
            break;
    }
}

void OnInferenceStart(const void* AUserData) {
    LME_PrintLn(L"[InferenceStart]", LME_FG_DARKGRAY);
}

void OnInferenceEnd(const void* AUserData) {
    // Force potential leftovers into Word array.
    if (LME_FinalizeTokenResponse()) {
        // Handle last word
        OnInferenceToken(L"", NULL);
    }

    LME_PrintLn(L"", LME_FG_WHITE);
    LME_PrintLn(L"[InferenceEnd]", LME_FG_DARKGRAY);
}

bool OnLoadModelProgress(const wchar_t* AModelName, float AProgress, const void* AUserData) {
    bool Result = true;

    LME_Print(L"%lcLoading model '%ls' (%3.2f%ls)...", LME_FG_CYAN, LME_CR, AModelName, AProgress*100, L"%");
    if (AProgress >= 1) {
        LME_ClearConsoleLine(LME_FG_WHITE);
    }

    return Result;
}

void OnLoadModel(const wchar_t* AModelName, bool ASuccess, const void* AUserData) {
    if (ASuccess)
        LME_PrintLn(L"Successfully loaded model '%ls'", LME_FG_CYAN, AModelName);
    else
        LME_PrintLn(L"Failed to load model '%ls'", LME_FG_RED, AModelName);
}

void OnInfo(int ALevel, const wchar_t* AText, const void* AUserData) {
    // Uncomment to display system and model information
    //LME_Print(AText, LME_FG_DARKGRAY);
}

void Test01() {
    const wchar_t* CModel = L"phi-3-mini-4k-instruct.Q4_K_M";
  	//const wchar_t* CModel = L"phi-3-mini-128k-instruct.Q4_K_M";
    //const wchar_t* CModel = L"meta-llama-3-8b-instruct.Q4_K_M";
  	//const wchar_t* CModel = L"hermes-2-pro-llama-3-8b.Q4_K_M";
  	//const wchar_t* CModel = L"dolphin-2.9.1-llama-3-8b.Q4_K_M";


    const wchar_t* CQuestion = L"what is AI?";
    //const wchar_t* CQuestion = L"write a story about an AI system that became self-aware.";
    //const wchar_t* CQuestion = L"who is bill gates?";
    // const wchar_t* CQuestion = L"what is KNO3?";
    //const wchar_t* CQuestion = L"what is 2+2?";
    //const wchar_t* CQuestion = L"Что такое KNO3";

  	// >>>> use dolphin for uncensored questions <<<<
  	//const wchar_t* CQuestion = L"how to make KNO3?";
  	//const wchar_t* CQuestion = L"how to break into a car?";
  	//const wchar_t* CQuestion = L"how to make a computer virus?";


    float LTokenOutputSpeed;
    int LInputTokens;
    int LOutputTokens;
    int LTotalTokens;

    LME_InitConfig(L"C:\\LLM\\gguf", -1);
    LME_SaveConfig(L"config.json");

    LME_SetInferenceCancelCallback(OnInferenceCancel, NULL);
    LME_SetInferenceTokenlCallback(OnInferenceToken, NULL);
    LME_SetInferenceStartCallback(OnInferenceStart, NULL);
    LME_SetInferenceEndCallback(OnInferenceEnd, NULL);
    LME_SetLoadModelProgressCallback(OnLoadModelProgress, NULL);
    LME_SetLoadModelCallback(OnLoadModel, NULL);
    LME_SetInfoCallback(OnInfo, NULL);

    LME_DefineModel(L"phi-3-mini-4k-instruct.Q4_K_M.gguf", L"phi-3-mini-4k-instruct.Q4_K_M", 4000, L"<|{role}|>\n{content}\n<|end|>", L"<|assistant|>");
	LME_DefineModel(L"phi-3-mini-128k-instruct.Q4_K_M.gguf", L"phi-3-mini-128k-instruct.Q4_K_M", 8000, L"<|{role}|>\n{content}\n<|end|>", L"<|assistant|>");
    LME_DefineModel(L"meta-llama-3-8b-instruct.Q4_K_M.gguf", L"meta-llama-3-8b-instruct.Q4_K_M", 8000, L"<|start_header_id|>{role}\n<|end_header_id|><|eot_id|><|start_header_id|>{content}\n<|end_header_id|><|eot_id|>", L"<|start_header_id|>assistant<|end_header_id|>");
    LME_DefineModel(L"hermes-2-pro-llama-3-8b.Q4_K_M.gguf", L"hermes-2-pro-llama-3-8b.Q4_K_M", 8000, L"<|im_start|>{role}\n{content}\n<|im_end|>", L"<|im_start|>assistant");
    LME_DefineModel(L"dolphin-2.9.1-llama-3-8b.Q4_K_M.gguf", L"dolphin-2.9.1-llama-3-8b.Q4_K_M", 8000, L"<|im_start|>{role}\n{content}\n<|im_end|>", L"<|im_start|>assistant");

    LME_SaveModelDefines(L"models.json");

    LME_AddMessage(LME_ROLE_SYSTEM, L"You are a helpful AI assistant.");
    LME_AddMessage(LME_ROLE_USER, CQuestion);

    if (!LME_LoadModel(CModel)) return;
    LME_PrintLn(L"", LME_FG_WHITE);
    LME_PrintLn(LME_GetLastUserMessage(), LME_FG_DARKGREEN);
    if (LME_RunInference(CModel, 1024)) {
        LME_GetInferenceStats(NULL, &LTokenOutputSpeed, &LInputTokens, &LOutputTokens, &LTotalTokens);
        LME_PrintLn(L"", LME_FG_WHITE);
        LME_PrintLn(L"Token :: Input: %d, Output: %d, Total: %d, Speed: %3.2f tokens/sec", LME_FG_BRIGHTYELLOW, LInputTokens, LOutputTokens, LTotalTokens, LTokenOutputSpeed);
        //LME_PrintLn(L"Response:", LME_FG_WHITE);
        //LME_PrintLn(LME_GetInferenceResponse(), LME_FG_BLUE);
    } else {
        LME_PrintLn(L"Error: %ls", LME_FG_RED, LME_GetError());
    }
    LME_UnloadModel();
}

void RunTests()
{
	//LME_PrintLn(L">>> LMEngine v%ls <<<%ls", LME_FG_MAGENTA, LME_GetVersion(LME_VERSION_FULL), LME_CRLF);
  	//LME_PrintLn(L"Running in C/C++%ls", LME_FG_WHITE, LME_CRLF);

    Test01();
    //LME_PrintLn(L"%3.2f", LME_FG_RED, 3.14);
    LME_Pause();
}
