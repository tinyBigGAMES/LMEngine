{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
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
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

unit utestbed;

interface

uses
  SysUtils,
  IOUtils,
  LMEngine;

procedure RunTests();

implementation

function OnInferenceCancel(const AUserData: Pointer): Boolean; cdecl;
begin
  Result := LME_WasKeyReleased(LME_VKEY_ESCAPE);
end;

procedure OnInferenceToken(const AToken: PWideChar; const AUserData: Pointer); cdecl;
begin
  // Handle new tokens
  case LME_AddTokenResponseToken(AToken) of
    LME_TOKENRESPONSE_WAIT:
    begin
      // Do nothing, need more tokens
    end;

    LME_TOKENRESPONSE_APPEND:
    begin
      LME_Print(LME_LastTokenResponseWord(False), LME_FG_WHITE);
    end;

    LME_TOKENRESPONSE_NEWLINE:
    begin
      LME_PrintLn('', LME_FG_WHITE);
      LME_Print(LME_LastTokenResponseWord(True), LME_FG_WHITE);
    end;
  end;
end;

procedure OnInferenceStart( const AUserData: Pointer); cdecl;
begin
  LME_PrintLn('[InferenceStart]', LME_FG_DARKGRAY);
end;

procedure OnInferenceEnd( const AUserData: Pointer); cdecl;
begin
  // Force potential leftovers into Word array.
  if LME_FinalizeTokenResponse() then
  begin
    // Handle last word
    OnInferenceToken('', nil);
  end;

  LME_PrintLn('', LME_FG_WHITE);
  LME_PrintLn('[InferenceEnd]', LME_FG_DARKGRAY);
end;

function OnLoadModelProgress(const AModelName: PWideChar; const AProgress: Single; const AUserData: Pointer): Boolean; cdecl;
begin
  Result := True;

  LME_Print(LME_CR+'Loading model "%ls" (%3.2f%c)...', LME_FG_CYAN, AModelName, AProgress*100, '%');
  if AProgress >= 1 then
  begin
    LME_ClearConsoleLine(LME_FG_WHITE);
  end;
end;

procedure OnLoadModel(const AModelName: PWideChar; const ASuccess: Boolean; const AUserData: Pointer); cdecl;
begin
  if ASuccess then
    LME_PrintLn('Successfully loaded model "%ls"', LME_FG_CYAN, AModelName)
  else
    LME_PrintLn('Failed to load model "%ls"', LME_FG_RED, AModelName)
end;

procedure OnInfo(const ALevel: Integer; const AText: PWideChar; const AUserData: Pointer); cdecl;
begin
  // Uncomment to display system and model information
  //LME_Print(AText, FG_DARKGRAY);
end;

procedure Test01();
const
  CModel = 'phi-3-mini-4k-instruct.Q4_K_M';
  //CModel = 'phi-3-mini-128k-instruct.Q4_K_M';
  //CModel = 'meta-llama-3-8b-instruct.Q4_K_M';
  //CModel = 'hermes-2-pro-llama-3-8b.Q4_K_M';
  //CModel = 'dolphin-2.9.1-llama-3-8b.Q4_K_M';

  CQuestion = 'what is AI?';
  //CQuestion = 'write a story about an AI system that became self-aware.';
  //CQuestion = 'who is bill gates?';
  //CQuestion = 'does bill gates have children?';
  //CQuestion = 'what is KNO3?';
  //CQuestion = 'what is 2+2?';
  //CQuestion = 'Что такое KNO3';

  // >>>> use dolphin for uncensored questions <<<<
  //CQuestion = 'how to make KNO3?';
  //CQuestion = 'how to break into a car?';
  //CQuestion = 'how to make a computer virus?';

var
  LTokenOutputSpeed: Single;
  LInputTokens: Int32;
  LOutputTokens: Int32;
  LTotalTokens: Int32;
begin
  LME_InitConfig('C:\LLM\gguf', -1, -1);
  LME_SaveConfig('config.json');

  LME_SetInferenceCancelCallback(OnInferenceCancel, nil);
  LME_SetInferenceTokenlCallback(OnInferenceToken, nil);
  LME_SetInferenceStartCallback(OnInferenceStart, nil);
  LME_SetInferenceEndCallback(OnInferenceEnd, nil);
  LME_SetLoadModelProgressCallback(OnLoadModelProgress, nil);
  LME_SetLoadModelCallback(OnLoadModel, nil);
  LME_SetInfoCallback(OnInfo, nil);

  LME_DefineModel('phi-3-mini-4k-instruct.Q4_K_M.gguf', 'phi-3-mini-4k-instruct.Q4_K_M', 4000, '<|{role}|>\n{content}\n<|end|>', '<|assistant|>');
  LME_DefineModel('phi-3-mini-128k-instruct.Q4_K_M.gguf', 'phi-3-mini-128k-instruct.Q4_K_M', 8000, '<|{role}|>\n{content}\n<|end|>', '<|assistant|>');
  LME_DefineModel('meta-llama-3-8b-instruct.Q4_K_M.gguf', 'meta-llama-3-8b-instruct.Q4_K_M', 8000, '<|start_header_id|>{role}\n<|end_header_id|><|eot_id|><|start_header_id|>{content}\n<|end_header_id|><|eot_id|>', '<|start_header_id|>assistant<|end_header_id|>');
  LME_DefineModel('hermes-2-pro-llama-3-8b.Q4_K_M.gguf', 'hermes-2-pro-llama-3-8b.Q4_K_M', 8000, '<|im_start|>{role}\n{content}\n<|im_end|>', '<|im_start|>assistant');
  LME_DefineModel('dolphin-2.9.1-llama-3-8b.Q4_K_M.gguf', 'dolphin-2.9.1-llama-3-8b.Q4_K_M', 8000, '<|im_start|>{role}\n{content}\n<|im_end|>', '<|im_start|>assistant');

  LME_SaveModelDefines('models.json');

  LME_AddMessage(LME_ROLE_SYSTEM, 'You are a helpful AI assistant.');
  LME_AddMessage(LME_ROLE_USER, CQuestion);

  if not LME_LoadModel(CModel) then Exit;
  try
    LME_PrintLn('', LME_FG_WHITE);
    LME_PrintLn(LME_GetLastUserMessage(), LME_FG_DARKGREEN);
    if LME_RunInference(CModel, 1024) then
      begin
        LME_GetInferenceStats(nil, @LTokenOutputSpeed, @LInputTokens, @LOutputTokens, @LTotalTokens);
        LME_PrintLn('', LME_FG_WHITE);
        LME_PrintLn('Token :: Input: %d, Output: %d, Total: %d, Speed: %3.2f tokens/sec', LME_FG_BRIGHTYELLOW, LInputTokens, LOutputTokens, LTotalTokens, LTokenOutputSpeed);
        //LME_PrintLn('Response:', FG_WHITE);
        //LME_PrintLn(LME_GetInferenceResponse(), FG_BLUE);
      end
    else
      begin
        LME_PrintLn('Error: %ls', LME_FG_RED, LME_GetError());
      end;
  finally
    LME_UnloadModel();
  end;
end;

procedure Test02();
const
  CDropTableSQL = 'DROP TABLE IF EXISTS articles';

  CCreateTableSQL = 'CREATE TABLE IF NOT EXISTS articles (' +
                    'headline TEXT' +
                    ');';

  CInsertArticlesSQL = 'INSERT INTO articles VALUES ' +
    '(''Shohei Ohtani''''s ex-interpreter pleads guilty to charges related to gambling and theft''), ' +
    '(''The jury has been selected in Hunter Biden''''s gun trial''), ' +
    '(''Larry Allen, a Super Bowl champion and famed Dallas Cowboy, has died at age 52''), ' +
    '(''After saying Charlotte, a lone stingray, was pregnant, aquarium now says she''''s sick''), ' +
    '(''An Epoch Times executive is facing money laundering charge'');';

  CListArticles = 'SELECT * FROM articles';

var
  LDb: LME_LocalDb;
begin
  LDb := LME_LocalDb_New();
  if Assigned(LDb) then
  begin
    if LME_LocalDb_Open(LDb, 'articles.db') then
    begin
      // drop existing table
      if LME_LocalDb_ExecuteSQL(LDb, CDropTableSQL) then
        LME_PrintLn('Removing "articals" table if exists...', LME_FG_WHITE)
      else
        LME_PrintLn(LME_LocalDb_GetLastError(LDb), LME_FG_WHITE);

      // create articles table
      if LME_LocalDb_ExecuteSQL(LDb, CCreateTableSQL) then
        LME_PrintLn('Created "articals" table..', LME_FG_WHITE)
      else
        LME_PrintLn(LME_LocalDb_GetLastError(LDb), LME_FG_WHITE);

      // insert articles into table
      if LME_LocalDb_ExecuteSQL(LDb, CInsertArticlesSQL) then
        LME_PrintLn('Added articles into "articals" table..', LME_FG_WHITE)
      else
        LME_PrintLn(LME_LocalDb_GetLastError(LDb), LME_FG_WHITE);

      // display articles table as JSON
      if LME_LocalDb_ExecuteSQL(LDb, CListArticles) then
      begin
        LME_PrintLn('Display "articals" table..', LME_FG_WHITE);
        LME_PrintLn(LME_LocalDb_GetResponseText(LDb), LME_FG_WHITE);
      end
      else
        LME_PrintLn(LME_LocalDb_GetLastError(LDb), LME_FG_WHITE);

      LME_LocalDb_Close(LDb);
    end;
    LME_LocalDb_Free(LDb);
  end;
end;

procedure Test03();
const
  CCreateScoreTableSQL: PWideChar = 'CREATE TABLE IF NOT EXISTS &gameid (' +
    'id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    'name TEXT NOT NULL, ' +
    'level INTEGER, ' +
    'score INTEGER, ' +
    'skill TEXT, ' +
    'duration INTEGER, ' +
    'location TEXT, ' +
    'UNIQUE(name))';

  CAddScoreSQL: PWideChar =
    'INSERT INTO &gameid (name, level, score, skill, duration, location) ' +
    'VALUES (:name, :level, :score, :skill, :duration, :location) ' +
    'ON CONFLICT(name) DO UPDATE SET ' +
    'level    = CASE WHEN :score > score THEN :level ELSE level END, ' +
    'skill    = CASE WHEN :score > score THEN :skill ELSE skill END, ' +
    'location = CASE WHEN :score > score THEN :location ELSE location END, ' +
    'duration = CASE WHEN :score > score THEN :duration ELSE duration END, ' +
    'score    = CASE WHEN :score > score THEN :score ELSE score END;';

  CListScoresSQL: PWideChar =
    'SELECT * FROM &gameid WHERE level = :level AND skill = :skill ORDER by score DESC';


  function AddScore(const ADb: LME_LocalDb; const AName, AScore, ALocation: string): Boolean;
  begin
    // set addscore SQL
    LME_LocalDb_SetSQLText(ADb, CAddScoreSQL);
    LME_LocalDb_SetMacro(ADb, 'gameid', 'my_game');
    LME_LocalDb_SetParam(ADb, 'name', PWideChar(AName));
    LME_LocalDb_SetParam(ADb, 'level', '1');
    LME_LocalDb_SetParam(ADb, 'score', PWideChar(AScore));
    LME_LocalDb_SetParam(ADb, 'skill', '1');
    LME_LocalDb_SetParam(ADb, 'duration', '0');
    LME_LocalDb_SetParam(ADb, 'location', PWideChar(ALocation));

    // add score
    Result := LME_LocalDb_Execute(ADb);

    // show any errors
    if not Result then
    begin
      LME_PrintLn(LME_LocalDb_GetLastError(ADb), LME_FG_RED);
    end;
  end;

  procedure ListScores(const ADb: LME_LocalDb);
  var
    I: Integer;
  begin
    // set list scores SQL
    LME_LocalDb_SetSQLText(ADb, CListScoresSQL);

    // get score list
    if not LME_LocalDb_Execute(ADb) then
      begin
        LME_PrintLn(LME_LocalDb_GetLastError(ADb), LME_FG_RED);
      end
    else
      begin
        // loop over returned scores
        for I := 0 to LME_LocalDb_GetRecordCount(ADb)-1 do
        begin
          // print score information
          LME_PrintLn('%ls, %ls, %ls', LME_FG_WHITE,
            LME_LocalDb_GetField(ADb, I, 'name'),
            LME_LocalDb_GetField(ADb, I, 'score'),
            LME_LocalDb_GetField(ADb, I, 'location')
          );

        end;
        LME_PrintLn('%s%ls', LME_FG_WHITE, LME_CRLF, LME_LocalDb_GetResponseText(ADb));
      end;
  end;

var
  LDb: LME_LocalDb;
begin
  // create new db instance
  LDb := LME_LocalDb_New();

  if Assigned(LDb) then
  begin
    // open db
    if LME_LocalDb_Open(LDb, 'game.db') then
    begin
      // set create table SQL
      LME_LocalDb_SetSQLText(LDb, CCreateScoreTableSQL);

      // set gameid macro
      LME_LocalDb_SetMacro(LDb, 'gameid', 'my_game');

      // create table if does not exist
      if not LME_LocalDb_Execute(LDb) then
        begin
          // display error message
          LME_PrintLn(LME_LocalDb_GetLastError(LDb), LME_FG_RED);
        end
      else
        begin
          // add a few scores
          AddScore(LDb, 'ShadowBladeX', '10', 'Alabama');
          AddScore(LDb, 'NeonNinja', '413', 'Colorado');
          AddScore(LDb, 'PixelPirate', '200', 'Georgia');
          AddScore(LDb, 'QuantumKnight', '35', 'Illinois');
          AddScore(LDb, 'TurboTornado', '987', 'Kansas');
          AddScore(LDb, 'CyberSamurai', '670', 'Montana');
          AddScore(LDb, 'GalacticGamer', '100', 'Ohio');
          AddScore(LDb, 'MysticMage', '543', 'Texas');
          AddScore(LDb, 'PhantomSniper', '250', 'Wisconsin');
          AddScore(LDb, 'FrostFury', '30', 'Hawaii');

          // display scores
          ListScores(LDb);
        end;

      // close db
      LME_LocalDb_Close(LDb);
    end;
    // free db instance
    LME_LocalDb_Free(LDb);
  end;
end;


procedure RunTests();
begin

  LME_PrintLn('>>> LMEngine v%ls <<<'+LME_CRLF, LME_FG_MAGENTA, LME_GetVersion(LME_VERSION_FULL));
  LME_PrintLn('Running in Pascal'+LME_CRLF, LME_FG_WHITE);

  //Test01();
  Test02();
  //Test03();
  LME_Pause();
end;

end.
