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

    LME_InitConfig(L"C:\\LLM\\gguf", -1, -1);
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

void Test02() {
    const wchar_t *CDropTableSQL = L"DROP TABLE IF EXISTS articles";

    const wchar_t *CCreateTableSQL = L"CREATE TABLE IF NOT EXISTS articles ("
                                     L"headline TEXT"
                                     L");";

    const wchar_t *CInsertArticlesSQL = L"INSERT INTO articles VALUES "
                                         L"('Shohei Ohtani''s ex-interpreter pleads guilty to charges related to gambling and theft'), "
                                         L"('The jury has been selected in Hunter Biden''s gun trial'), "
                                         L"('Larry Allen, a Super Bowl champion and famed Dallas Cowboy, has died at age 52'), "
                                         L"('After saying Charlotte, a lone stingray, was pregnant, aquarium now says she''s sick'), "
                                         L"('An Epoch Times executive is facing money laundering charge');";

    const wchar_t *CListArticles = L"SELECT * FROM articles";

    LME_LocalDb LDb = LME_LocalDb_New();
    if (LDb) {
        if (LME_LocalDb_Open(LDb, L"articles.db")) {
            // drop existing table
            if (LME_LocalDb_ExecuteSQL(LDb, CDropTableSQL)) {
                LME_PrintLn(L"Removing \"articles\" table if exists...", LME_FG_WHITE);
            } else {
                LME_PrintLn(LME_LocalDb_GetLastError(LDb), LME_FG_WHITE);
            }

            // create articles table
            if (LME_LocalDb_ExecuteSQL(LDb, CCreateTableSQL)) {
                LME_PrintLn(L"Created \"articles\" table..", LME_FG_WHITE);
            } else {
                LME_PrintLn(LME_LocalDb_GetLastError(LDb), LME_FG_WHITE);
            }

            // insert articles into table
            if (LME_LocalDb_ExecuteSQL(LDb, CInsertArticlesSQL)) {
                LME_PrintLn(L"Added articles into \"articles\" table..", LME_FG_WHITE);
            } else {
                LME_PrintLn(LME_LocalDb_GetLastError(LDb), LME_FG_WHITE);
            }

            // display articles table as JSON
            if (LME_LocalDb_ExecuteSQL(LDb, CListArticles)) {
                LME_PrintLn(L"Display \"articles\" table..", LME_FG_WHITE);
                LME_PrintLn(LME_LocalDb_GetResponseText(LDb), LME_FG_WHITE);
            } else {
                LME_PrintLn(LME_LocalDb_GetLastError(LDb), LME_FG_WHITE);
            }

            LME_LocalDb_Close(LDb);
        }
        LME_LocalDb_Free(&LDb);
    }
}

void AddScore(LME_LocalDb ADb, const wchar_t *AName, const wchar_t *AScore, const wchar_t *ALocation) {
    const wchar_t *CAddScoreSQL =
        L"INSERT INTO &gameid (name, level, score, skill, duration, location) "
        L"VALUES (:name, :level, :score, :skill, :duration, :location) "
        L"ON CONFLICT(name) DO UPDATE SET "
        L"level    = CASE WHEN :score > score THEN :level ELSE level END, "
        L"skill    = CASE WHEN :score > score THEN :skill ELSE skill END, "
        L"location = CASE WHEN :score > score THEN :location ELSE location END, "
        L"duration = CASE WHEN :score > score THEN :duration ELSE duration END, "
        L"score    = CASE WHEN :score > score THEN :score ELSE score END;";

    // set addscore SQL
    LME_LocalDb_SetSQLText(ADb, CAddScoreSQL);
    LME_LocalDb_SetMacro(ADb, L"gameid", L"my_game");
    LME_LocalDb_SetParam(ADb, L"name", AName);
    LME_LocalDb_SetParam(ADb, L"level", L"1");
    LME_LocalDb_SetParam(ADb, L"score", AScore);
    LME_LocalDb_SetParam(ADb, L"skill", L"1");
    LME_LocalDb_SetParam(ADb, L"duration", L"0");
    LME_LocalDb_SetParam(ADb, L"location", ALocation);

    // add score
    if (!LME_LocalDb_Execute(ADb)) {
        LME_PrintLn(LME_LocalDb_GetLastError(ADb), LME_FG_RED);
    }
}

void ListScores(LME_LocalDb ADb) {
	const wchar_t *CListScoresSQL =
    	L"SELECT * FROM &gameid WHERE level = :level AND skill = :skill ORDER by score DESC";

    // set list scores SQL
    LME_LocalDb_SetSQLText(ADb, CListScoresSQL);

    // get score list
    if (!LME_LocalDb_Execute(ADb)) {
        LME_PrintLn(LME_LocalDb_GetLastError(ADb), LME_FG_RED);
    } else {
        // loop over returned scores
        int recordCount = LME_LocalDb_GetRecordCount(ADb);
        for (int i = 0; i < recordCount; i++) {
            // print score information
            LME_PrintLn(L"%ls, %ls, %ls", LME_FG_WHITE,
                        LME_LocalDb_GetField(ADb, i, L"name"),
                        LME_LocalDb_GetField(ADb, i, L"score"),
                        LME_LocalDb_GetField(ADb, i, L"location"));
        }
        LME_PrintLn(L"%s%ls", LME_FG_WHITE, LME_CRLF, LME_LocalDb_GetResponseText(ADb));
    }
}

void Test03() {
	const wchar_t *CCreateScoreTableSQL =
        L"CREATE TABLE IF NOT EXISTS &gameid ("
        L"id INTEGER PRIMARY KEY AUTOINCREMENT, "
        L"name TEXT NOT NULL, "
        L"level INTEGER, "
        L"score INTEGER, "
        L"skill TEXT, "
        L"duration INTEGER, "
        L"location TEXT, "
        L"UNIQUE(name))";

    LME_LocalDb LDb = LME_LocalDb_New();

    if (LDb) {
        if (LME_LocalDb_Open(LDb, L"game.db")) {
            // set create table SQL
            LME_LocalDb_SetSQLText(LDb, CCreateScoreTableSQL);

            // set gameid macro
            LME_LocalDb_SetMacro(LDb, L"gameid", L"my_game");

            // create table if does not exist
            if (!LME_LocalDb_Execute(LDb)) {
                // display error message
                LME_PrintLn(LME_LocalDb_GetLastError(LDb), LME_FG_RED);
            } else {
                // add a few scores
                AddScore(LDb, L"ShadowBladeX", L"10", L"Alabama");
                AddScore(LDb, L"NeonNinja", L"413", L"Colorado");
                AddScore(LDb, L"PixelPirate", L"200", L"Georgia");
                AddScore(LDb, L"QuantumKnight", L"35", L"Illinois");
                AddScore(LDb, L"TurboTornado", L"987", L"Kansas");
                AddScore(LDb, L"CyberSamurai", L"670", L"Montana");
                AddScore(LDb, L"GalacticGamer", L"100", L"Ohio");
                AddScore(LDb, L"MysticMage", L"543", L"Texas");
                AddScore(LDb, L"PhantomSniper", L"250", L"Wisconsin");
                AddScore(LDb, L"FrostFury", L"30", L"Hawaii");

                // display scores
                ListScores(LDb);
            }

            // close db
            LME_LocalDb_Close(LDb);
        }
        // free db instance
        LME_LocalDb_Free(&LDb);
    }
}

void RunTests()
{
	LME_PrintLn(L">>> LMEngine v%ls <<<%ls", LME_FG_MAGENTA, LME_GetVersion(LME_VERSION_FULL), LME_CRLF);
  	LME_PrintLn(L"Running in C/C++%ls", LME_FG_WHITE, LME_CRLF);

    //Test01();
    Test02();
    //Test03();
    LME_Pause();
}
