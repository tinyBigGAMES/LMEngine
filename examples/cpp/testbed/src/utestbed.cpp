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

#include <stdio.h>
#include <lme.h>
#include "utestbed.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

#include <stdio.h>
#include <stdbool.h>

bool OnInferenceCancel(const void* AUserData) {
    return WasKeyReleased(VKEY_ESCAPE);
}

void OnInferenceToken(const wchar_t* AToken, const void* AUserData) {
    // Handle new tokens
    switch (AddTokenResponseToken(AToken)) {
        case TOKENRESPONSE_WAIT:
            // Do nothing, need more tokens
            break;

        case TOKENRESPONSE_APPEND:
            Print(LastTokenResponseWord(false), FG_WHITE);
            break;

        case TOKENRESPONSE_NEWLINE:
            PrintLn(L"", FG_WHITE);
            Print(LastTokenResponseWord(true), FG_WHITE);
            break;
    }
}

void OnInferenceStart(const void* AUserData) {
    PrintLn(L"[InferenceStart]", FG_DARKGRAY);
}

void OnInferenceEnd(const void* AUserData) {
    // Force potential leftovers into Word array.
    if (FinalizeTokenResponse()) {
        // Handle last word
        OnInferenceToken(L"", NULL);
    }

    PrintLn(L"", FG_WHITE);
    PrintLn(L"[InferenceEnd]", FG_DARKGRAY);
}

bool OnLoadModelProgress(const wchar_t* AModelName, float AProgress, const void* AUserData) {
    bool Result = true;

    Print(L"%lcLoading model '%ls' (%3.2f%ls)...", FG_CYAN, CR, AModelName, AProgress*100, L"%");
    if (AProgress >= 1) {
        ClearConsoleLine(FG_WHITE);
    }

    return Result;
}

void OnLoadModel(const wchar_t* AModelName, bool ASuccess, const void* AUserData) {
    if (ASuccess)
        PrintLn(L"Successfully loaded model '%ls'", FG_CYAN, AModelName);
    else
        PrintLn(L"Failed to load model '%ls'", FG_RED, AModelName);
}

void OnInfo(int ALevel, const wchar_t* AText, const void* AUserData) {
    // Uncomment to display system and model information
    //Print(AText, FG_DARKGRAY);
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

    InitConfig(L"C:\\LLM\\gguf", -1);
    SaveConfig(L"config.json");

    SetInferenceCancelCallback(OnInferenceCancel, NULL);
    SetInferenceTokenlCallback(OnInferenceToken, NULL);
    SetInferenceStartCallback(OnInferenceStart, NULL);
    SetInferenceEndCallback(OnInferenceEnd, NULL);
    SetLoadModelProgressCallback(OnLoadModelProgress, NULL);
    SetLoadModelCallback(OnLoadModel, NULL);
    SetInfoCallback(OnInfo, NULL);

    DefineModel(L"phi-3-mini-4k-instruct.Q4_K_M.gguf", L"phi-3-mini-4k-instruct.Q4_K_M", 4000, L"<|{role}|>{content}<|end|>", L"<|assistant|>");
	DefineModel(L"phi-3-mini-128k-instruct.Q4_K_M.gguf", L"phi-3-mini-128k-instruct.Q4_K_M", 8000, L"<|{role}|>{content}<|end|>", L"<|assistant|>");
    DefineModel(L"meta-llama-3-8b-instruct.Q4_K_M.gguf", L"meta-llama-3-8b-instruct.Q4_K_M", 8000, L"<|start_header_id|>{role}\n<|end_header_id|><|eot_id|><|start_header_id|>{content}\n<|end_header_id|><|eot_id|>", L"<|start_header_id|>assistant<|end_header_id|>");
    DefineModel(L"hermes-2-pro-llama-3-8b.Q4_K_M.gguf", L"hermes-2-pro-llama-3-8b.Q4_K_M", 8000, L"<|im_start|>{role}\n{content}\n<|im_end|>", L"<|im_start|>assistant");
    DefineModel(L"dolphin-2.9.1-llama-3-8b.Q4_K_M.gguf", L"dolphin-2.9.1-llama-3-8b.Q4_K_M", 8000, L"<|im_start|>{role}\n{content}\n<|im_end|>", L"<|im_start|>assistant");

    SaveModelDefines(L"models.json");

    AddMessage(ROLE_SYSTEM, L"You are a helpful AI assistant.");
    AddMessage(ROLE_USER, CQuestion);

    if (!LoadModel(CModel)) return;
    PrintLn(L"", FG_WHITE);
    PrintLn(GetLastUserMessage(), FG_DARKGREEN);
    if (RunInference(CModel, 1024)) {
        GetInferenceStats(NULL, &LTokenOutputSpeed, &LInputTokens, &LOutputTokens, &LTotalTokens);
        PrintLn(L"", FG_WHITE);
        PrintLn(L"Token :: Input: %d, Output: %d, Total: %d, Speed: %3.2f tokens/sec", FG_BRIGHTYELLOW, LInputTokens, LOutputTokens, LTotalTokens, LTokenOutputSpeed);
        //PrintLn(L"Response:", FG_WHITE);
        //PrintLn(GetInferenceResponse(), FG_BLUE);
    } else {
        PrintLn(L"Error: %ls", FG_RED, GetError());
    }
    UnloadModel();
}

void RunTests()
{
	PrintLn(L">>> LMEngine v%ls <<<%ls", FG_MAGENTA, GetVersionInfo(VERSION_FULL), CRLF);
   	PrintLn(L"Running in C/C++%ls", FG_WHITE, CRLF);

    Test01();
    Pause();
}
