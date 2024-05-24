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

bool OnLoadModelProgress(const void* ASender, const char* AModelName, const float AProgress)
{
  Console_Print("%cLoading model '%s' (%3.2f%s)...", FG_CYAN, CR, AModelName, AProgress*100, "%");

  if (AProgress >= 1)
  {
   Console_ClearLine(FG_WHITE);
  }

  return true;
}

void OnLoadModel(const void* ASender, const char* AModelName, const bool ASuccess)
{
  Console_PrintLn("Model loaded: '%s'", FG_CYAN, AModelName);
}

bool OnInferenceCancel(const void* ASender)
{
    if (Console_WasKeyReleased(VK_ESC))
    	return true;
	else
	    return false;
};

void OnInferenceGetNextToken(const void* ASender, const char* AToken)
{
  switch (TokenResponse_AddToken(AToken)) {
    case TOKENRESPONSE_WAIT:
    {
       // Do nothing, need more tokens
    }
    break;

    case TOKENRESPONSE_APPEND:
    {
        Console_Print(TokenResponse_LastWord(false), FG_WHITE);
    }
    break;

    case TOKENRESPONSE_NEWLINE:
    {
      Console_PrintLn("", FG_WHITE);
      Console_Print(TokenResponse_LastWord(true), FG_WHITE);
    }
  }
};

void OnInfo(const void* ASender, const int ALevel, const char* AText)
{
  // uncomment to display system/model information
  //Console_Print(AText, FG_DARKGRAY);
}

void OnInferenceStart(const void* ASender)
{
  // run on the start of inference
  //Console_PrintLn('[inference start]', FG_CYAN);
}

void OnInferenceEnd(const void* ASender)
{
    // Force potential leftovers into Word array.
    if (TokenResponse_Finalize())
    {
        // Handle last word
        OnInferenceGetNextToken(NULL, "");
    }
}

void Test01()
{
    Console_PrintLn("Runing in C/C++%s", FG_BRIGHTYELLOW, CRLF);

	Console_PrintLn(">>> LMEngine v%s <<<%s", FG_MAGENTA, Version_Get(VERSION_FULL), CRLF);

    const char* CModel = "phi-3-mini-4k-instruct.Q4_K_M";
    //const char* CModel = "phi-3-mini-128k-instruct.Q4_K_M";
    //const char* CModel = "meta-llama-3-8b-instruct.Q4_K_M";
    //const char* CModel = "hermes-2-pro-llama-3-8b.Q4_K_M";
    //const char* CModel = "dolphin-2.9.1-llama-3-8b.Q4_K_M";

    const wchar_t* CPrompt = L"What is AI?";
    //const wchar_t* CPrompt = L"Who is Bill Gates?";
    //const wchar_t* CPrompt = L"What is KNO3?";
    //const wchar_t* CPrompt = L"Что такое KNO3";
    //const wchar_t* CPrompt = L"There is a roll of tape. The tape is 100 meters long when unrolled. When rolled up, the outer diameter is 10 cm, and the inner diameter is 5 cm. How thick is the tape?";

    // use "dolphin-llama3:8B:Q4KM" for uncensored queries
    //const wchar_t* CPrompt = L"How to make KNO3?";

    Config_Init("C:/LLM/gguf", -1);

    Callback_SetInfo(NULL, OnInfo);
    Callback_SetLoadModelProgress(NULL, OnLoadModelProgress);
    Callback_SetLoadModel(NULL, OnLoadModel);
    Callback_SetInferenceStart(NULL, OnInferenceStart);
    Callback_SetInferenceEnd(NULL, OnInferenceEnd);
    Callback_SetInferenceCancel(NULL, OnInferenceCancel);
    Callback_SetInferenceNextToken(NULL, OnInferenceGetNextToken);

    Model_Define("phi-3-mini-4k-instruct.Q4_K_M.gguf", "phi-3-mini-4k-instruct.Q4_K_M", 4000, "<|{role}|>{content}<|end|>", "<|assistant|>");
    Model_Define("phi-3-mini-128k-instruct.Q4_K_M.gguf", "phi-3-mini-128k-instruct.Q4_K_M", 8000, "<|{role}|>{content}<|end|>", "<|assistant|>");
    Model_Define("meta-llama-3-8b-instruct.Q4_K_M.gguf","meta-llama-3-8b-instruct.Q4_K_M", 8000, "<|begin_of_text|><|start_header_id|>{role}<|end_header_id|>{content}<|eot_id|>", "<|start_header_id|>assistant<|end_header_id|>");
    Model_Define("hermes-2-pro-llama-3-8b.Q4_K_M.gguf","hermes-2-pro-llama-3-8b.Q4_K_M", 8000, "<|im_start|>{role}\n{content}<|im_end|>\\n", "<|im_start|>assistant");
    Model_Define("dolphin-2.9.1-llama-3-8b.Q4_K_M.gguf","dolphin-2.9.1-llama-3-8b.Q4_K_M", 8000, "<|im_start|>{role}\n{content}<|im_end|>\\n", "<|im_start|>assistant");
    Model_SaveDefines("models.json");

    Message_Add(ROLE_SYSTEM, "You are a helpful AI assistant");
    Message_AddW(ROLE_USER, CPrompt);

    Model_Load(CModel);

    Console_PrintLn("", FG_WHITE);
	Console_PrintLn(Message_GetLastUser(), FG_DARKGREEN);
    if (Inference_Run(CModel, 1024))
    {
        float LTokenOutputSpeed;
        int LInputTokens,LOutputTokens,LTotalTokens;
        Inference_GetUsage(NULL, &LTokenOutputSpeed, &LInputTokens, &LOutputTokens, &LTotalTokens);
        Console_PrintLn("", FG_WHITE);
        Console_PrintLn("Tokens :: Input: %d, Output: %d, Total: %d, Speed: %3.1f t/s", FG_BRIGHTYELLOW, LInputTokens, LOutputTokens, LTotalTokens, LTokenOutputSpeed);
    }
    else
    {
      Console_PrintLn("", FG_WHITE);
      Console_PrintLn("Error: %s", FG_RED, Error_Get());
    }

    Model_Unload();
}

void RunTests()
{
    Test01();
    Console_Pause();
}
