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

unit LMEngine.Deps;

{$I LMEngine.Defines.inc}

interface

const
  {$IF Defined(WIN64)}
  LMENGINE_DLL = 'LMEngine.dll';
  _PU = '';
  {$ELSE}
    {$MESSAGE Error 'Unsupported platform'}
  {$ENDIF}

const
  GGML_FILE_MAGIC = $67676d6c;
  GGML_FILE_VERSION = 1;
  GGML_QNT_VERSION = 2;
  GGML_QNT_VERSION_FACTOR = 1000;
  GGML_MAX_DIMS = 4;
  GGML_MAX_PARAMS = 2048;
  GGML_MAX_CONTEXTS = 64;
  GGML_MAX_SRC = 10;
  GGML_MAX_NAME = 64;
  GGML_MAX_OP_PARAMS = 64;
  GGML_DEFAULT_N_THREADS = 4;
  GGML_DEFAULT_GRAPH_SIZE = 2048;
  GGML_MEM_ALIGN = 16;
  GGML_EXIT_SUCCESS = 0;
  GGML_EXIT_ABORTED = 1;
  GGUF_MAGIC = 'GGUF';
  GGUF_VERSION = 3;
  GGUF_DEFAULT_ALIGNMENT = 32;
  GGML_KQ_MASK_PAD = 32;
  GGML_N_TASKS_MAX = -1;
  LLAMA_DEFAULT_SEED = $FFFFFFFF;
  LLAMA_MAX_RNG_STATE = (64*1024);
  LLAMA_FILE_MAGIC_GGLA = $67676c61;
  LLAMA_FILE_MAGIC_GGSN = $6767736e;
  LLAMA_FILE_MAGIC_GGSQ = $67677371;
  LLAMA_SESSION_MAGIC = LLAMA_FILE_MAGIC_GGSN;
  LLAMA_SESSION_VERSION = 6;
  LLAMA_STATE_SEQ_MAGIC = LLAMA_FILE_MAGIC_GGSQ;
  LLAMA_STATE_SEQ_VERSION = 1;

type
  ggml_status = Integer;
  Pggml_status = ^ggml_status;

const
  GGML_STATUS_ALLOC_FAILED = -2;
  GGML_STATUS_FAILED = -1;
  GGML_STATUS_SUCCESS = 0;
  GGML_STATUS_ABORTED = 1;

type
  ggml_type = Integer;
  Pggml_type = ^ggml_type;

const
  GGML_TYPE_F32 = 0;
  GGML_TYPE_F16 = 1;
  GGML_TYPE_Q4_0 = 2;
  GGML_TYPE_Q4_1 = 3;
  GGML_TYPE_Q5_0 = 6;
  GGML_TYPE_Q5_1 = 7;
  GGML_TYPE_Q8_0 = 8;
  GGML_TYPE_Q8_1 = 9;
  GGML_TYPE_Q2_K = 10;
  GGML_TYPE_Q3_K = 11;
  GGML_TYPE_Q4_K = 12;
  GGML_TYPE_Q5_K = 13;
  GGML_TYPE_Q6_K = 14;
  GGML_TYPE_Q8_K = 15;
  GGML_TYPE_IQ2_XXS = 16;
  GGML_TYPE_IQ2_XS = 17;
  GGML_TYPE_IQ3_XXS = 18;
  GGML_TYPE_IQ1_S = 19;
  GGML_TYPE_IQ4_NL = 20;
  GGML_TYPE_IQ3_S = 21;
  GGML_TYPE_IQ2_S = 22;
  GGML_TYPE_IQ4_XS = 23;
  GGML_TYPE_I8 = 24;
  GGML_TYPE_I16 = 25;
  GGML_TYPE_I32 = 26;
  GGML_TYPE_I64 = 27;
  GGML_TYPE_F64 = 28;
  GGML_TYPE_IQ1_M = 29;
  GGML_TYPE_BF16 = 30;
  GGML_TYPE_COUNT = 31;

type
  ggml_prec = Integer;
  Pggml_prec = ^ggml_prec;

const
  GGML_PREC_DEFAULT = 0;
  GGML_PREC_F32 = 1;

type
  ggml_backend_type = Integer;
  Pggml_backend_type = ^ggml_backend_type;

const
  GGML_BACKEND_TYPE_CPU = 0;
  GGML_BACKEND_TYPE_GPU = 10;
  GGML_BACKEND_TYPE_GPU_SPLIT = 20;

type
  ggml_ftype = Integer;
  Pggml_ftype = ^ggml_ftype;

const
  GGML_FTYPE_UNKNOWN = -1;
  GGML_FTYPE_ALL_F32 = 0;
  GGML_FTYPE_MOSTLY_F16 = 1;
  GGML_FTYPE_MOSTLY_Q4_0 = 2;
  GGML_FTYPE_MOSTLY_Q4_1 = 3;
  GGML_FTYPE_MOSTLY_Q4_1_SOME_F16 = 4;
  GGML_FTYPE_MOSTLY_Q8_0 = 7;
  GGML_FTYPE_MOSTLY_Q5_0 = 8;
  GGML_FTYPE_MOSTLY_Q5_1 = 9;
  GGML_FTYPE_MOSTLY_Q2_K = 10;
  GGML_FTYPE_MOSTLY_Q3_K = 11;
  GGML_FTYPE_MOSTLY_Q4_K = 12;
  GGML_FTYPE_MOSTLY_Q5_K = 13;
  GGML_FTYPE_MOSTLY_Q6_K = 14;
  GGML_FTYPE_MOSTLY_IQ2_XXS = 15;
  GGML_FTYPE_MOSTLY_IQ2_XS = 16;
  GGML_FTYPE_MOSTLY_IQ3_XXS = 17;
  GGML_FTYPE_MOSTLY_IQ1_S = 18;
  GGML_FTYPE_MOSTLY_IQ4_NL = 19;
  GGML_FTYPE_MOSTLY_IQ3_S = 20;
  GGML_FTYPE_MOSTLY_IQ2_S = 21;
  GGML_FTYPE_MOSTLY_IQ4_XS = 22;
  GGML_FTYPE_MOSTLY_IQ1_M = 23;
  GGML_FTYPE_MOSTLY_BF16 = 24;

type
  ggml_op = Integer;
  Pggml_op = ^ggml_op;

const
  GGML_OP_NONE = 0;
  GGML_OP_DUP = 1;
  GGML_OP_ADD = 2;
  GGML_OP_ADD1 = 3;
  GGML_OP_ACC = 4;
  GGML_OP_SUB = 5;
  GGML_OP_MUL = 6;
  GGML_OP_DIV = 7;
  GGML_OP_SQR = 8;
  GGML_OP_SQRT = 9;
  GGML_OP_LOG = 10;
  GGML_OP_SUM = 11;
  GGML_OP_SUM_ROWS = 12;
  GGML_OP_MEAN = 13;
  GGML_OP_ARGMAX = 14;
  GGML_OP_REPEAT = 15;
  GGML_OP_REPEAT_BACK = 16;
  GGML_OP_CONCAT = 17;
  GGML_OP_SILU_BACK = 18;
  GGML_OP_NORM = 19;
  GGML_OP_RMS_NORM = 20;
  GGML_OP_RMS_NORM_BACK = 21;
  GGML_OP_GROUP_NORM = 22;
  GGML_OP_MUL_MAT = 23;
  GGML_OP_MUL_MAT_ID = 24;
  GGML_OP_OUT_PROD = 25;
  GGML_OP_SCALE = 26;
  GGML_OP_SET = 27;
  GGML_OP_CPY = 28;
  GGML_OP_CONT = 29;
  GGML_OP_RESHAPE = 30;
  GGML_OP_VIEW = 31;
  GGML_OP_PERMUTE = 32;
  GGML_OP_TRANSPOSE = 33;
  GGML_OP_GET_ROWS = 34;
  GGML_OP_GET_ROWS_BACK = 35;
  GGML_OP_DIAG = 36;
  GGML_OP_DIAG_MASK_INF = 37;
  GGML_OP_DIAG_MASK_ZERO = 38;
  GGML_OP_SOFT_MAX = 39;
  GGML_OP_SOFT_MAX_BACK = 40;
  GGML_OP_ROPE = 41;
  GGML_OP_ROPE_BACK = 42;
  GGML_OP_CLAMP = 43;
  GGML_OP_CONV_TRANSPOSE_1D = 44;
  GGML_OP_IM2COL = 45;
  GGML_OP_CONV_TRANSPOSE_2D = 46;
  GGML_OP_POOL_1D = 47;
  GGML_OP_POOL_2D = 48;
  GGML_OP_UPSCALE = 49;
  GGML_OP_PAD = 50;
  GGML_OP_ARANGE = 51;
  GGML_OP_TIMESTEP_EMBEDDING = 52;
  GGML_OP_ARGSORT = 53;
  GGML_OP_LEAKY_RELU = 54;
  GGML_OP_FLASH_ATTN_EXT = 55;
  GGML_OP_FLASH_ATTN_BACK = 56;
  GGML_OP_SSM_CONV = 57;
  GGML_OP_SSM_SCAN = 58;
  GGML_OP_WIN_PART = 59;
  GGML_OP_WIN_UNPART = 60;
  GGML_OP_GET_REL_POS = 61;
  GGML_OP_ADD_REL_POS = 62;
  GGML_OP_UNARY = 63;
  GGML_OP_MAP_UNARY = 64;
  GGML_OP_MAP_BINARY = 65;
  GGML_OP_MAP_CUSTOM1_F32 = 66;
  GGML_OP_MAP_CUSTOM2_F32 = 67;
  GGML_OP_MAP_CUSTOM3_F32 = 68;
  GGML_OP_MAP_CUSTOM1 = 69;
  GGML_OP_MAP_CUSTOM2 = 70;
  GGML_OP_MAP_CUSTOM3 = 71;
  GGML_OP_CROSS_ENTROPY_LOSS = 72;
  GGML_OP_CROSS_ENTROPY_LOSS_BACK = 73;
  GGML_OP_COUNT = 74;

type
  ggml_unary_op = Integer;
  Pggml_unary_op = ^ggml_unary_op;

const
  GGML_UNARY_OP_ABS = 0;
  GGML_UNARY_OP_SGN = 1;
  GGML_UNARY_OP_NEG = 2;
  GGML_UNARY_OP_STEP = 3;
  GGML_UNARY_OP_TANH = 4;
  GGML_UNARY_OP_ELU = 5;
  GGML_UNARY_OP_RELU = 6;
  GGML_UNARY_OP_SIGMOID = 7;
  GGML_UNARY_OP_GELU = 8;
  GGML_UNARY_OP_GELU_QUICK = 9;
  GGML_UNARY_OP_SILU = 10;
  GGML_UNARY_OP_HARDSWISH = 11;
  GGML_UNARY_OP_HARDSIGMOID = 12;
  GGML_UNARY_OP_COUNT = 13;

type
  ggml_object_type = Integer;
  Pggml_object_type = ^ggml_object_type;

const
  GGML_OBJECT_TYPE_TENSOR = 0;
  GGML_OBJECT_TYPE_GRAPH = 1;
  GGML_OBJECT_TYPE_WORK_BUFFER = 2;

type
  ggml_log_level = Integer;
  Pggml_log_level = ^ggml_log_level;

const
  GGML_LOG_LEVEL_ERROR = 2;
  GGML_LOG_LEVEL_WARN = 3;
  GGML_LOG_LEVEL_INFO = 4;
  GGML_LOG_LEVEL_DEBUG = 5;

type
  ggml_tensor_flag = Integer;
  Pggml_tensor_flag = ^ggml_tensor_flag;

const
  GGML_TENSOR_FLAG_INPUT = 1;
  GGML_TENSOR_FLAG_OUTPUT = 2;
  GGML_TENSOR_FLAG_PARAM = 4;

type
  ggml_cgraph_eval_order = Integer;
  Pggml_cgraph_eval_order = ^ggml_cgraph_eval_order;

const
  GGML_CGRAPH_EVAL_ORDER_LEFT_TO_RIGHT = 0;
  GGML_CGRAPH_EVAL_ORDER_RIGHT_TO_LEFT = 1;
  GGML_CGRAPH_EVAL_ORDER_COUNT = 2;

type
  ggml_task_type = Integer;
  Pggml_task_type = ^ggml_task_type;

const
  GGML_TASK_TYPE_INIT = 0;
  GGML_TASK_TYPE_COMPUTE = 1;
  GGML_TASK_TYPE_FINALIZE = 2;

type
  ggml_numa_strategy = Integer;
  Pggml_numa_strategy = ^ggml_numa_strategy;

const
  GGML_NUMA_STRATEGY_DISABLED = 0;
  GGML_NUMA_STRATEGY_DISTRIBUTE = 1;
  GGML_NUMA_STRATEGY_ISOLATE = 2;
  GGML_NUMA_STRATEGY_NUMACTL = 3;
  GGML_NUMA_STRATEGY_MIRROR = 4;
  GGML_NUMA_STRATEGY_COUNT = 5;

type
  ggml_op_pool = Integer;
  Pggml_op_pool = ^ggml_op_pool;

const
  GGML_OP_POOL_MAX = 0;
  GGML_OP_POOL_AVG = 1;
  GGML_OP_POOL_COUNT = 2;

type
  ggml_sort_order = Integer;
  Pggml_sort_order = ^ggml_sort_order;

const
  GGML_SORT_ORDER_ASC = 0;
  GGML_SORT_ORDER_DESC = 1;

type
  ggml_opt_type = Integer;
  Pggml_opt_type = ^ggml_opt_type;

const
  GGML_OPT_TYPE_ADAM = 0;
  GGML_OPT_TYPE_LBFGS = 1;

type
  ggml_linesearch = Integer;
  Pggml_linesearch = ^ggml_linesearch;

const
  GGML_LINESEARCH_DEFAULT = 1;
  GGML_LINESEARCH_BACKTRACKING_ARMIJO = 0;
  GGML_LINESEARCH_BACKTRACKING_WOLFE = 1;
  GGML_LINESEARCH_BACKTRACKING_STRONG_WOLFE = 2;

type
  ggml_opt_result = Integer;
  Pggml_opt_result = ^ggml_opt_result;

const
  GGML_OPT_RESULT_OK = 0;
  GGML_OPT_RESULT_DID_NOT_CONVERGE = 1;
  GGML_OPT_RESULT_NO_CONTEXT = 2;
  GGML_OPT_RESULT_INVALID_WOLFE = 3;
  GGML_OPT_RESULT_FAIL = 4;
  GGML_OPT_RESULT_CANCEL = 5;
  GGML_LINESEARCH_FAIL = -128;
  GGML_LINESEARCH_MINIMUM_STEP = -127;
  GGML_LINESEARCH_MAXIMUM_STEP = -126;
  GGML_LINESEARCH_MAXIMUM_ITERATIONS = -125;
  GGML_LINESEARCH_INVALID_PARAMETERS = -124;

type
  gguf_type = Integer;
  Pgguf_type = ^gguf_type;

const
  GGUF_TYPE_UINT8 = 0;
  GGUF_TYPE_INT8 = 1;
  GGUF_TYPE_UINT16 = 2;
  GGUF_TYPE_INT16 = 3;
  GGUF_TYPE_UINT32 = 4;
  GGUF_TYPE_INT32 = 5;
  GGUF_TYPE_FLOAT32 = 6;
  GGUF_TYPE_BOOL = 7;
  GGUF_TYPE_STRING = 8;
  GGUF_TYPE_ARRAY = 9;
  GGUF_TYPE_UINT64 = 10;
  GGUF_TYPE_INT64 = 11;
  GGUF_TYPE_FLOAT64 = 12;
  GGUF_TYPE_COUNT = 13;

type
  ggml_backend_buffer_usage = Integer;
  Pggml_backend_buffer_usage = ^ggml_backend_buffer_usage;

const
  GGML_BACKEND_BUFFER_USAGE_ANY = 0;
  GGML_BACKEND_BUFFER_USAGE_WEIGHTS = 1;

type
  llama_vocab_type = Integer;
  Pllama_vocab_type = ^llama_vocab_type;

const
  LLAMA_VOCAB_TYPE_NONE = 0;
  LLAMA_VOCAB_TYPE_SPM = 1;
  LLAMA_VOCAB_TYPE_BPE = 2;
  LLAMA_VOCAB_TYPE_WPM = 3;

type
  llama_vocab_pre_type = Integer;
  Pllama_vocab_pre_type = ^llama_vocab_pre_type;

const
  LLAMA_VOCAB_PRE_TYPE_DEFAULT = 0;
  LLAMA_VOCAB_PRE_TYPE_LLAMA3 = 1;
  LLAMA_VOCAB_PRE_TYPE_DEEPSEEK_LLM = 2;
  LLAMA_VOCAB_PRE_TYPE_DEEPSEEK_CODER = 3;
  LLAMA_VOCAB_PRE_TYPE_FALCON = 4;
  LLAMA_VOCAB_PRE_TYPE_MPT = 5;
  LLAMA_VOCAB_PRE_TYPE_STARCODER = 6;
  LLAMA_VOCAB_PRE_TYPE_GPT2 = 7;
  LLAMA_VOCAB_PRE_TYPE_REFACT = 8;
  LLAMA_VOCAB_PRE_TYPE_COMMAND_R = 9;
  LLAMA_VOCAB_PRE_TYPE_STABLELM2 = 10;
  LLAMA_VOCAB_PRE_TYPE_QWEN2 = 11;
  LLAMA_VOCAB_PRE_TYPE_OLMO = 12;
  LLAMA_VOCAB_PRE_TYPE_DBRX = 13;

type
  llama_rope_type = Integer;
  Pllama_rope_type = ^llama_rope_type;

const
  LLAMA_ROPE_TYPE_NONE = -1;
  LLAMA_ROPE_TYPE_NORM = 0;
  LLAMA_ROPE_TYPE_NEOX = 2;
  LLAMA_ROPE_TYPE_GLM = 4;

type
  llama_token_type = Integer;
  Pllama_token_type = ^llama_token_type;

const
  LLAMA_TOKEN_TYPE_UNDEFINED = 0;
  LLAMA_TOKEN_TYPE_NORMAL = 1;
  LLAMA_TOKEN_TYPE_UNKNOWN = 2;
  LLAMA_TOKEN_TYPE_CONTROL = 3;
  LLAMA_TOKEN_TYPE_USER_DEFINED = 4;
  LLAMA_TOKEN_TYPE_UNUSED = 5;
  LLAMA_TOKEN_TYPE_BYTE = 6;

type
  llama_ftype = Integer;
  Pllama_ftype = ^llama_ftype;

const
  LLAMA_FTYPE_ALL_F32 = 0;
  LLAMA_FTYPE_MOSTLY_F16 = 1;
  LLAMA_FTYPE_MOSTLY_Q4_0 = 2;
  LLAMA_FTYPE_MOSTLY_Q4_1 = 3;
  LLAMA_FTYPE_MOSTLY_Q4_1_SOME_F16 = 4;
  LLAMA_FTYPE_MOSTLY_Q8_0 = 7;
  LLAMA_FTYPE_MOSTLY_Q5_0 = 8;
  LLAMA_FTYPE_MOSTLY_Q5_1 = 9;
  LLAMA_FTYPE_MOSTLY_Q2_K = 10;
  LLAMA_FTYPE_MOSTLY_Q3_K_S = 11;
  LLAMA_FTYPE_MOSTLY_Q3_K_M = 12;
  LLAMA_FTYPE_MOSTLY_Q3_K_L = 13;
  LLAMA_FTYPE_MOSTLY_Q4_K_S = 14;
  LLAMA_FTYPE_MOSTLY_Q4_K_M = 15;
  LLAMA_FTYPE_MOSTLY_Q5_K_S = 16;
  LLAMA_FTYPE_MOSTLY_Q5_K_M = 17;
  LLAMA_FTYPE_MOSTLY_Q6_K = 18;
  LLAMA_FTYPE_MOSTLY_IQ2_XXS = 19;
  LLAMA_FTYPE_MOSTLY_IQ2_XS = 20;
  LLAMA_FTYPE_MOSTLY_Q2_K_S = 21;
  LLAMA_FTYPE_MOSTLY_IQ3_XS = 22;
  LLAMA_FTYPE_MOSTLY_IQ3_XXS = 23;
  LLAMA_FTYPE_MOSTLY_IQ1_S = 24;
  LLAMA_FTYPE_MOSTLY_IQ4_NL = 25;
  LLAMA_FTYPE_MOSTLY_IQ3_S = 26;
  LLAMA_FTYPE_MOSTLY_IQ3_M = 27;
  LLAMA_FTYPE_MOSTLY_IQ2_S = 28;
  LLAMA_FTYPE_MOSTLY_IQ2_M = 29;
  LLAMA_FTYPE_MOSTLY_IQ4_XS = 30;
  LLAMA_FTYPE_MOSTLY_IQ1_M = 31;
  LLAMA_FTYPE_MOSTLY_BF16 = 32;
  LLAMA_FTYPE_GUESSED = 1024;

type
  llama_rope_scaling_type = Integer;
  Pllama_rope_scaling_type = ^llama_rope_scaling_type;

const
  LLAMA_ROPE_SCALING_TYPE_UNSPECIFIED = -1;
  LLAMA_ROPE_SCALING_TYPE_NONE = 0;
  LLAMA_ROPE_SCALING_TYPE_LINEAR = 1;
  LLAMA_ROPE_SCALING_TYPE_YARN = 2;
  LLAMA_ROPE_SCALING_TYPE_MAX_VALUE = 2;

type
  llama_pooling_type = Integer;
  Pllama_pooling_type = ^llama_pooling_type;

const
  LLAMA_POOLING_TYPE_UNSPECIFIED = -1;
  LLAMA_POOLING_TYPE_NONE = 0;
  LLAMA_POOLING_TYPE_MEAN = 1;
  LLAMA_POOLING_TYPE_CLS = 2;

type
  llama_split_mode = Integer;
  Pllama_split_mode = ^llama_split_mode;

const
  LLAMA_SPLIT_MODE_NONE = 0;
  LLAMA_SPLIT_MODE_LAYER = 1;
  LLAMA_SPLIT_MODE_ROW = 2;

type
  llama_model_kv_override_type = Integer;
  Pllama_model_kv_override_type = ^llama_model_kv_override_type;

const
  LLAMA_KV_OVERRIDE_TYPE_INT = 0;
  LLAMA_KV_OVERRIDE_TYPE_FLOAT = 1;
  LLAMA_KV_OVERRIDE_TYPE_BOOL = 2;
  LLAMA_KV_OVERRIDE_TYPE_STR = 3;

type
  llama_gretype = Integer;
  Pllama_gretype = ^llama_gretype;

const
  LLAMA_GRETYPE_END = 0;
  LLAMA_GRETYPE_ALT = 1;
  LLAMA_GRETYPE_RULE_REF = 2;
  LLAMA_GRETYPE_CHAR = 3;
  LLAMA_GRETYPE_CHAR_NOT = 4;
  LLAMA_GRETYPE_CHAR_RNG_UPPER = 5;
  LLAMA_GRETYPE_CHAR_ALT = 6;

type
  // Forward declarations
  PPUTF8Char = ^PUTF8Char;
  PUInt8 = ^UInt8;
  PInt8 = ^Int8;
  PInt64 = ^Int64;
  PInt32 = ^Int32;
  PPointer = ^Pointer;
  PNativeUInt = ^NativeUInt;
  Pggml_context = Pointer;
  PPggml_context = ^Pggml_context;
  Pggml_backend_buffer = Pointer;
  PPggml_backend_buffer = ^Pggml_backend_buffer;
  Pgguf_context = Pointer;
  PPgguf_context = ^Pgguf_context;
  Pggml_backend_buffer_type = Pointer;
  PPggml_backend_buffer_type = ^Pggml_backend_buffer_type;
  Pggml_backend = Pointer;
  PPggml_backend = ^Pggml_backend;
  Pggml_gallocr = Pointer;
  PPggml_gallocr = ^Pggml_gallocr;
  Pggml_backend_event = Pointer;
  PPggml_backend_event = ^Pggml_backend_event;
  Pggml_backend_sched = Pointer;
  PPggml_backend_sched = ^Pggml_backend_sched;
  Pllama_model = Pointer;
  PPllama_model = ^Pllama_model;
  Pllama_context = Pointer;
  PPllama_context = ^Pllama_context;
  Pllama_grammar = Pointer;
  PPllama_grammar = ^Pllama_grammar;
  Pggml_bf16_t = ^ggml_bf16_t;
  Pggml_object = ^ggml_object;
  Pggml_tensor = ^ggml_tensor;
  PPggml_tensor = ^Pggml_tensor;
  Pggml_cplan = ^ggml_cplan;
  Pggml_hash_set = ^ggml_hash_set;
  Pggml_cgraph = ^ggml_cgraph;
  Pggml_scratch = ^ggml_scratch;
  Pggml_init_params = ^ggml_init_params;
  Pggml_compute_params = ^ggml_compute_params;
  Pggml_opt_params = ^ggml_opt_params;
  Pggml_opt_context = ^ggml_opt_context;
  Pgguf_init_params = ^gguf_init_params;
  Pggml_type_traits_t = ^ggml_type_traits_t;
  Pggml_tallocr = ^ggml_tallocr;
  Pggml_backend_graph_copy = ^ggml_backend_graph_copy;
  Pllama_token_data = ^llama_token_data;
  Pllama_token_data_array = ^llama_token_data_array;
  Pllama_batch = ^llama_batch;
  Pllama_model_kv_override = ^llama_model_kv_override;
  Pllama_model_params = ^llama_model_params;
  Pllama_context_params = ^llama_context_params;
  Pllama_model_quantize_params = ^llama_model_quantize_params;
  Pllama_grammar_element = ^llama_grammar_element;
  PPllama_grammar_element = ^Pllama_grammar_element;
  Pllama_timings = ^llama_timings;
  Pllama_chat_message = ^llama_chat_message;
  Pllama_kv_cache_view_cell = ^llama_kv_cache_view_cell;
  Pllama_kv_cache_view = ^llama_kv_cache_view;
  Pllama_beam_view = ^llama_beam_view;
  Pllama_beams_state = ^llama_beams_state;

  ggml_fp16_t = UInt16;
  Pggml_fp16_t = ^ggml_fp16_t;

  ggml_bf16_t = record
    bits: UInt16;
  end;

  ggml_object = record
    offs: NativeUInt;
    size: NativeUInt;
    next: Pggml_object;
    &type: ggml_object_type;
    padding: array [0..3] of UTF8Char;
  end;

  ggml_tensor = record
    &type: ggml_type;
    backend: ggml_backend_type;
    buffer: Pggml_backend_buffer;
    ne: array [0..3] of Int64;
    nb: array [0..3] of NativeUInt;
    op: ggml_op;
    op_params: array [0..15] of Int32;
    flags: Int32;
    grad: Pggml_tensor;
    src: array [0..9] of Pggml_tensor;
    perf_runs: Integer;
    perf_cycles: Int64;
    perf_time_us: Int64;
    view_src: Pggml_tensor;
    view_offs: NativeUInt;
    data: Pointer;
    name: array [0..63] of UTF8Char;
    extra: Pointer;
    padding: array [0..7] of UTF8Char;
  end;

  ggml_abort_callback = function(data: Pointer): Boolean; cdecl;

  ggml_cplan = record
    work_size: NativeUInt;
    work_data: PUInt8;
    n_threads: Integer;
    abort_callback: ggml_abort_callback;
    abort_callback_data: Pointer;
  end;

  ggml_hash_set = record
    size: NativeUInt;
    keys: PPggml_tensor;
  end;

  ggml_cgraph = record
    size: Integer;
    n_nodes: Integer;
    n_leafs: Integer;
    nodes: PPggml_tensor;
    grads: PPggml_tensor;
    leafs: PPggml_tensor;
    visited_hash_table: ggml_hash_set;
    order: ggml_cgraph_eval_order;
    perf_runs: Integer;
    perf_cycles: Int64;
    perf_time_us: Int64;
  end;

  ggml_scratch = record
    offs: NativeUInt;
    size: NativeUInt;
    data: Pointer;
  end;

  ggml_init_params = record
    mem_size: NativeUInt;
    mem_buffer: Pointer;
    no_alloc: Boolean;
  end;

  ggml_compute_params = record
    &type: ggml_task_type;
    ith: Integer;
    nth: Integer;
    wsize: NativeUInt;
    wdata: Pointer;
  end;

  ggml_guid = array [0..15] of UInt8;
  ggml_guid_t = ^ggml_guid;

  ggml_unary_op_f32_t = procedure(const p1: Integer; p2: PSingle; const p3: PSingle); cdecl;

  ggml_binary_op_f32_t = procedure(const p1: Integer; p2: PSingle; const p3: PSingle; const p4: PSingle); cdecl;

  ggml_custom1_op_f32_t = procedure(p1: Pggml_tensor; const p2: Pggml_tensor); cdecl;

  ggml_custom2_op_f32_t = procedure(p1: Pggml_tensor; const p2: Pggml_tensor; const p3: Pggml_tensor); cdecl;

  ggml_custom3_op_f32_t = procedure(p1: Pggml_tensor; const p2: Pggml_tensor; const p3: Pggml_tensor; const p4: Pggml_tensor); cdecl;

  ggml_custom1_op_t = procedure(dst: Pggml_tensor; const a: Pggml_tensor; ith: Integer; nth: Integer; userdata: Pointer); cdecl;

  ggml_custom2_op_t = procedure(dst: Pggml_tensor; const a: Pggml_tensor; const b: Pggml_tensor; ith: Integer; nth: Integer; userdata: Pointer); cdecl;

  ggml_custom3_op_t = procedure(dst: Pggml_tensor; const a: Pggml_tensor; const b: Pggml_tensor; const c: Pggml_tensor; ith: Integer; nth: Integer; userdata: Pointer); cdecl;

  ggml_opt_callback = procedure(data: Pointer; accum_step: Integer; sched: PSingle; cancel: PBoolean); cdecl;

  ggml_log_callback = procedure(level: ggml_log_level; const text: PUTF8Char; user_data: Pointer); cdecl;

  P_anonymous_type_1 = ^_anonymous_type_1;
  _anonymous_type_1 = record
    n_iter: Integer;
    sched: Single;
    decay: Single;
    decay_min_ndim: Integer;
    alpha: Single;
    beta1: Single;
    beta2: Single;
    eps: Single;
    eps_f: Single;
    eps_g: Single;
    gclip: Single;
  end;

  P_anonymous_type_2 = ^_anonymous_type_2;
  _anonymous_type_2 = record
    m: Integer;
    n_iter: Integer;
    max_linesearch: Integer;
    eps: Single;
    ftol: Single;
    wolfe: Single;
    min_step: Single;
    max_step: Single;
    linesearch: ggml_linesearch;
  end;

  ggml_opt_params = record
    &type: ggml_opt_type;
    graph_size: NativeUInt;
    n_threads: Integer;
    past: Integer;
    delta: Single;
    max_no_improvement: Integer;
    print_forward_graph: Boolean;
    print_backward_graph: Boolean;
    n_gradient_accumulation: Integer;
    adam: _anonymous_type_1;
    lbfgs: _anonymous_type_2;
  end;

  P_anonymous_type_3 = ^_anonymous_type_3;
  _anonymous_type_3 = record
    g: Pggml_tensor;
    m: Pggml_tensor;
    v: Pggml_tensor;
    pf: Pggml_tensor;
    fx_best: Single;
    fx_prev: Single;
    n_no_improvement: Integer;
  end;

  P_anonymous_type_4 = ^_anonymous_type_4;
  _anonymous_type_4 = record
    x: Pggml_tensor;
    xp: Pggml_tensor;
    g: Pggml_tensor;
    gp: Pggml_tensor;
    d: Pggml_tensor;
    pf: Pggml_tensor;
    lmal: Pggml_tensor;
    lmys: Pggml_tensor;
    lms: Pggml_tensor;
    lmy: Pggml_tensor;
    fx_best: Single;
    step: Single;
    j: Integer;
    k: Integer;
    &end: Integer;
    n_no_improvement: Integer;
  end;

  ggml_opt_context = record
    ctx: Pggml_context;
    params: ggml_opt_params;
    iter: Integer;
    nx: Int64;
    just_initialized: Boolean;
    loss_before: Single;
    loss_after: Single;
    adam: _anonymous_type_3;
    lbfgs: _anonymous_type_4;
  end;

  gguf_init_params = record
    no_alloc: Boolean;
    ctx: PPggml_context;
  end;

  ggml_to_float_t = procedure(const x: Pointer; y: PSingle; k: Int64); cdecl;

  ggml_from_float_t = procedure(const x: PSingle; y: Pointer; k: Int64); cdecl;

  ggml_vec_dot_t = procedure(n: Integer; s: PSingle; bs: NativeUInt; const x: Pointer; bx: NativeUInt; const y: Pointer; by: NativeUInt; nrc: Integer); cdecl;

  ggml_type_traits_t = record
    type_name: PUTF8Char;
    blck_size: Integer;
    type_size: NativeUInt;
    is_quantized: Boolean;
    to_float: ggml_to_float_t;
    from_float: ggml_from_float_t;
    from_float_reference: ggml_from_float_t;
    vec_dot: ggml_vec_dot_t;
    vec_dot_type: ggml_type;
    nrows: Int64;
  end;

  ggml_backend_buffer_type_t = Pointer;
  Pggml_backend_buffer_type_t = ^ggml_backend_buffer_type_t;
  ggml_backend_buffer_t = Pointer;
  Pggml_backend_buffer_t = ^ggml_backend_buffer_t;
  ggml_backend_t = Pointer;
  Pggml_backend_t = ^ggml_backend_t;

  ggml_tallocr = record
    buffer: ggml_backend_buffer_t;
    base: Pointer;
    alignment: NativeUInt;
    offset: NativeUInt;
  end;

  ggml_gallocr_t = Pointer;
  Pggml_gallocr_t = ^ggml_gallocr_t;
  ggml_backend_event_t = Pointer;
  Pggml_backend_event_t = ^ggml_backend_event_t;
  ggml_backend_graph_plan_t = Pointer;
  ggml_backend_sched_t = Pointer;
  Pggml_backend_sched_t = ^ggml_backend_sched_t;

  ggml_backend_sched_eval_callback = function(t: Pggml_tensor; ask: Boolean; user_data: Pointer): Boolean; cdecl;

  ggml_backend_graph_copy = record
    buffer: ggml_backend_buffer_t;
    ctx_allocated: Pggml_context;
    ctx_unallocated: Pggml_context;
    graph: Pggml_cgraph;
  end;

  ggml_backend_eval_callback = function(node_index: Integer; t1: Pggml_tensor; t2: Pggml_tensor; user_data: Pointer): Boolean; cdecl;
  llama_pos = Int32;
  Pllama_pos = ^llama_pos;
  llama_token = Int32;
  Pllama_token = ^llama_token;
  llama_seq_id = Int32;
  Pllama_seq_id = ^llama_seq_id;
  PPllama_seq_id = ^Pllama_seq_id;

  llama_token_data = record
    id: llama_token;
    logit: Single;
    p: Single;
  end;

  llama_token_data_array = record
    data: Pllama_token_data;
    size: NativeUInt;
    sorted: Boolean;
  end;

  llama_progress_callback = function(progress: Single; user_data: Pointer): Boolean; cdecl;

  llama_batch = record
    n_tokens: Int32;
    token: Pllama_token;
    embd: PSingle;
    pos: Pllama_pos;
    n_seq_id: PInt32;
    seq_id: PPllama_seq_id;
    logits: PInt8;
    all_pos_0: llama_pos;
    all_pos_1: llama_pos;
    all_seq_id: llama_seq_id;
  end;

  P_anonymous_type_5 = ^_anonymous_type_5;
  _anonymous_type_5 = record
    case Integer of
      0: (val_i64: Int64);
      1: (val_f64: Double);
      2: (val_bool: Boolean);
      3: (val_str: array [0..127] of UTF8Char);
  end;

  llama_model_kv_override = record
    tag: llama_model_kv_override_type;
    key: array [0..127] of UTF8Char;
    f3: _anonymous_type_5;
  end;

  llama_model_params = record
    n_gpu_layers: Int32;
    split_mode: llama_split_mode;
    main_gpu: Int32;
    tensor_split: PSingle;
    rpc_servers: PUTF8Char;
    progress_callback: llama_progress_callback;
    progress_callback_user_data: Pointer;
    kv_overrides: Pllama_model_kv_override;
    vocab_only: Boolean;
    use_mmap: Boolean;
    use_mlock: Boolean;
    check_tensors: Boolean;
  end;

  llama_context_params = record
    seed: UInt32;
    n_ctx: UInt32;
    n_batch: UInt32;
    n_ubatch: UInt32;
    n_seq_max: UInt32;
    n_threads: UInt32;
    n_threads_batch: UInt32;
    rope_scaling_type: llama_rope_scaling_type;
    pooling_type: llama_pooling_type;
    rope_freq_base: Single;
    rope_freq_scale: Single;
    yarn_ext_factor: Single;
    yarn_attn_factor: Single;
    yarn_beta_fast: Single;
    yarn_beta_slow: Single;
    yarn_orig_ctx: UInt32;
    defrag_thold: Single;
    cb_eval: ggml_backend_sched_eval_callback;
    cb_eval_user_data: Pointer;
    type_k: ggml_type;
    type_v: ggml_type;
    logits_all: Boolean;
    embeddings: Boolean;
    offload_kqv: Boolean;
    flash_attn: Boolean;
    abort_callback: ggml_abort_callback;
    abort_callback_data: Pointer;
  end;

  llama_model_quantize_params = record
    nthread: Int32;
    ftype: llama_ftype;
    output_tensor_type: ggml_type;
    token_embedding_type: ggml_type;
    allow_requantize: Boolean;
    quantize_output_tensor: Boolean;
    only_copy: Boolean;
    pure: Boolean;
    keep_split: Boolean;
    imatrix: Pointer;
    kv_overrides: Pointer;
  end;

  llama_grammar_element = record
    &type: llama_gretype;
    value: UInt32;
  end;

  llama_timings = record
    t_start_ms: Double;
    t_end_ms: Double;
    t_load_ms: Double;
    t_sample_ms: Double;
    t_p_eval_ms: Double;
    t_eval_ms: Double;
    n_sample: Int32;
    n_p_eval: Int32;
    n_eval: Int32;
  end;

  llama_chat_message = record
    role: PUTF8Char;
    content: PUTF8Char;
  end;

  llama_kv_cache_view_cell = record
    pos: llama_pos;
  end;

  llama_kv_cache_view = record
    n_cells: Int32;
    n_seq_max: Int32;
    token_count: Int32;
    used_cells: Int32;
    max_contiguous: Int32;
    max_contiguous_idx: Int32;
    cells: Pllama_kv_cache_view_cell;
    cells_sequences: Pllama_seq_id;
  end;

  llama_beam_view = record
    tokens: Pllama_token;
    n_tokens: NativeUInt;
    p: Single;
    eob: Boolean;
  end;

  llama_beams_state = record
    beam_views: Pllama_beam_view;
    n_beams: NativeUInt;
    common_prefix_length: NativeUInt;
    last_call: Boolean;
  end;

  llama_beam_search_callback_fn_t = procedure(callback_data: Pointer; p2: llama_beams_state); cdecl;

  cerr_callback = procedure(const text: PUTF8Char; user_data: Pointer); cdecl;

function ggml_status_to_string(status: ggml_status): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_status_to_string';

function ggml_fp16_to_fp32(p1: ggml_fp16_t): Single; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_fp16_to_fp32';

function ggml_fp32_to_fp16(p1: Single): ggml_fp16_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_fp32_to_fp16';

procedure ggml_fp16_to_fp32_row(const p1: Pggml_fp16_t; p2: PSingle; p3: Int64); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_fp16_to_fp32_row';

procedure ggml_fp32_to_fp16_row(const p1: PSingle; p2: Pggml_fp16_t; p3: Int64); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_fp32_to_fp16_row';

function ggml_fp32_to_bf16(p1: Single): ggml_bf16_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_fp32_to_bf16';

function ggml_bf16_to_fp32(p1: ggml_bf16_t): Single; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_bf16_to_fp32';

procedure ggml_bf16_to_fp32_row(const p1: Pggml_bf16_t; p2: PSingle; p3: Int64); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_bf16_to_fp32_row';

procedure ggml_fp32_to_bf16_row(const p1: PSingle; p2: Pggml_bf16_t; p3: Int64); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_fp32_to_bf16_row';

function ggml_guid_matches(guid_a: ggml_guid_t; guid_b: ggml_guid_t): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_guid_matches';

procedure ggml_time_init(); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_time_init';

function ggml_time_ms(): Int64; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_time_ms';

function ggml_time_us(): Int64; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_time_us';

function ggml_cycles(): Int64; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cycles';

function ggml_cycles_per_ms(): Int64; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cycles_per_ms';

procedure ggml_print_backtrace(); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_print_backtrace';

function ggml_fopen(const fname: PUTF8Char; const mode: PUTF8Char): PPointer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_fopen';

procedure ggml_numa_init(numa: ggml_numa_strategy); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_numa_init';

function ggml_is_numa(): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_numa';

procedure ggml_print_object(const obj: Pggml_object); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_print_object';

procedure ggml_print_objects(const ctx: Pggml_context); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_print_objects';

function ggml_nelements(const tensor: Pggml_tensor): Int64; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_nelements';

function ggml_nrows(const tensor: Pggml_tensor): Int64; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_nrows';

function ggml_nbytes(const tensor: Pggml_tensor): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_nbytes';

function ggml_nbytes_pad(const tensor: Pggml_tensor): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_nbytes_pad';

function ggml_blck_size(&type: ggml_type): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_blck_size';

function ggml_type_size(&type: ggml_type): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_type_size';

function ggml_row_size(&type: ggml_type; ne: Int64): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_row_size';

function ggml_type_sizef(&type: ggml_type): Double; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_type_sizef';

function ggml_type_name(&type: ggml_type): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_type_name';

function ggml_op_name(op: ggml_op): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_op_name';

function ggml_op_symbol(op: ggml_op): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_op_symbol';

function ggml_unary_op_name(op: ggml_unary_op): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_unary_op_name';

function ggml_op_desc(const t: Pggml_tensor): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_op_desc';

function ggml_element_size(const tensor: Pggml_tensor): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_element_size';

function ggml_is_quantized(&type: ggml_type): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_quantized';

function ggml_ftype_to_ggml_type(ftype: ggml_ftype): ggml_type; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_ftype_to_ggml_type';

function ggml_is_transposed(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_transposed';

function ggml_is_contiguous(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_contiguous';

function ggml_is_permuted(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_permuted';

function ggml_is_empty(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_empty';

function ggml_is_scalar(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_scalar';

function ggml_is_vector(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_vector';

function ggml_is_matrix(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_matrix';

function ggml_is_3d(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_3d';

function ggml_n_dims(const tensor: Pggml_tensor): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_n_dims';

function ggml_are_same_shape(const t0: Pggml_tensor; const t1: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_are_same_shape';

function ggml_are_same_stride(const t0: Pggml_tensor; const t1: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_are_same_stride';

function ggml_tensor_overhead(): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_tensor_overhead';

function ggml_validate_row_data(&type: ggml_type; const data: Pointer; nbytes: NativeUInt): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_validate_row_data';

function ggml_init(params: ggml_init_params): Pggml_context; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_init';

procedure ggml_free(ctx: Pggml_context); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_free';

function ggml_used_mem(const ctx: Pggml_context): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_used_mem';

function ggml_set_scratch(ctx: Pggml_context; scratch: ggml_scratch): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_scratch';

function ggml_get_no_alloc(ctx: Pggml_context): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_no_alloc';

procedure ggml_set_no_alloc(ctx: Pggml_context; no_alloc: Boolean); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_no_alloc';

function ggml_get_mem_buffer(const ctx: Pggml_context): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_mem_buffer';

function ggml_get_mem_size(const ctx: Pggml_context): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_mem_size';

function ggml_get_max_tensor_size(const ctx: Pggml_context): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_max_tensor_size';

function ggml_new_tensor(ctx: Pggml_context; &type: ggml_type; n_dims: Integer; const ne: PInt64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_new_tensor';

function ggml_new_tensor_1d(ctx: Pggml_context; &type: ggml_type; ne0: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_new_tensor_1d';

function ggml_new_tensor_2d(ctx: Pggml_context; &type: ggml_type; ne0: Int64; ne1: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_new_tensor_2d';

function ggml_new_tensor_3d(ctx: Pggml_context; &type: ggml_type; ne0: Int64; ne1: Int64; ne2: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_new_tensor_3d';

function ggml_new_tensor_4d(ctx: Pggml_context; &type: ggml_type; ne0: Int64; ne1: Int64; ne2: Int64; ne3: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_new_tensor_4d';

function ggml_new_i32(ctx: Pggml_context; value: Int32): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_new_i32';

function ggml_new_f32(ctx: Pggml_context; value: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_new_f32';

function ggml_dup_tensor(ctx: Pggml_context; const src: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_dup_tensor';

function ggml_view_tensor(ctx: Pggml_context; src: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_view_tensor';

function ggml_get_first_tensor(const ctx: Pggml_context): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_first_tensor';

function ggml_get_next_tensor(const ctx: Pggml_context; tensor: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_next_tensor';

function ggml_get_tensor(ctx: Pggml_context; const name: PUTF8Char): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_tensor';

function ggml_set_zero(tensor: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_zero';

function ggml_set_i32(tensor: Pggml_tensor; value: Int32): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_i32';

function ggml_set_f32(tensor: Pggml_tensor; value: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_f32';

procedure ggml_unravel_index(const tensor: Pggml_tensor; i: Int64; i0: PInt64; i1: PInt64; i2: PInt64; i3: PInt64); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_unravel_index';

function ggml_get_i32_1d(const tensor: Pggml_tensor; i: Integer): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_i32_1d';

procedure ggml_set_i32_1d(const tensor: Pggml_tensor; i: Integer; value: Int32); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_i32_1d';

function ggml_get_i32_nd(const tensor: Pggml_tensor; i0: Integer; i1: Integer; i2: Integer; i3: Integer): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_i32_nd';

procedure ggml_set_i32_nd(const tensor: Pggml_tensor; i0: Integer; i1: Integer; i2: Integer; i3: Integer; value: Int32); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_i32_nd';

function ggml_get_f32_1d(const tensor: Pggml_tensor; i: Integer): Single; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_f32_1d';

procedure ggml_set_f32_1d(const tensor: Pggml_tensor; i: Integer; value: Single); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_f32_1d';

function ggml_get_f32_nd(const tensor: Pggml_tensor; i0: Integer; i1: Integer; i2: Integer; i3: Integer): Single; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_f32_nd';

procedure ggml_set_f32_nd(const tensor: Pggml_tensor; i0: Integer; i1: Integer; i2: Integer; i3: Integer; value: Single); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_f32_nd';

function ggml_get_data(const tensor: Pggml_tensor): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_data';

function ggml_get_data_f32(const tensor: Pggml_tensor): PSingle; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_data_f32';

function ggml_get_unary_op(const tensor: Pggml_tensor): ggml_unary_op; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_unary_op';

function ggml_get_name(const tensor: Pggml_tensor): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_name';

function ggml_set_name(tensor: Pggml_tensor; const name: PUTF8Char): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_name';

function ggml_format_name(tensor: Pggml_tensor; const fmt: PUTF8Char): Pggml_tensor varargs; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_format_name';

function ggml_dup(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_dup';

function ggml_dup_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_dup_inplace';

function ggml_add(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_add';

function ggml_add_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_add_inplace';

function ggml_add_cast(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; &type: ggml_type): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_add_cast';

function ggml_add1(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_add1';

function ggml_add1_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_add1_inplace';

function ggml_acc(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; nb1: NativeUInt; nb2: NativeUInt; nb3: NativeUInt; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_acc';

function ggml_acc_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; nb1: NativeUInt; nb2: NativeUInt; nb3: NativeUInt; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_acc_inplace';

function ggml_sub(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sub';

function ggml_sub_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sub_inplace';

function ggml_mul(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_mul';

function ggml_mul_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_mul_inplace';

function ggml_div(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_div';

function ggml_div_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_div_inplace';

function ggml_sqr(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sqr';

function ggml_sqr_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sqr_inplace';

function ggml_sqrt(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sqrt';

function ggml_sqrt_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sqrt_inplace';

function ggml_log(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_log';

function ggml_log_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_log_inplace';

function ggml_sum(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sum';

function ggml_sum_rows(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sum_rows';

function ggml_mean(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_mean';

function ggml_argmax(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_argmax';

function ggml_repeat(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_repeat';

function ggml_repeat_back(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_repeat_back';

function ggml_concat(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_concat';

function ggml_abs(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_abs';

function ggml_abs_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_abs_inplace';

function ggml_sgn(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sgn';

function ggml_sgn_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sgn_inplace';

function ggml_neg(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_neg';

function ggml_neg_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_neg_inplace';

function ggml_step(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_step';

function ggml_step_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_step_inplace';

function ggml_tanh(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_tanh';

function ggml_tanh_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_tanh_inplace';

function ggml_elu(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_elu';

function ggml_elu_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_elu_inplace';

function ggml_relu(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_relu';

function ggml_leaky_relu(ctx: Pggml_context; a: Pggml_tensor; negative_slope: Single; inplace: Boolean): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_leaky_relu';

function ggml_relu_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_relu_inplace';

function ggml_sigmoid(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sigmoid';

function ggml_sigmoid_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_sigmoid_inplace';

function ggml_gelu(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gelu';

function ggml_gelu_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gelu_inplace';

function ggml_gelu_quick(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gelu_quick';

function ggml_gelu_quick_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gelu_quick_inplace';

function ggml_silu(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_silu';

function ggml_silu_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_silu_inplace';

function ggml_silu_back(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_silu_back';

function ggml_hardswish(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_hardswish';

function ggml_hardsigmoid(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_hardsigmoid';

function ggml_norm(ctx: Pggml_context; a: Pggml_tensor; eps: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_norm';

function ggml_norm_inplace(ctx: Pggml_context; a: Pggml_tensor; eps: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_norm_inplace';

function ggml_rms_norm(ctx: Pggml_context; a: Pggml_tensor; eps: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rms_norm';

function ggml_rms_norm_inplace(ctx: Pggml_context; a: Pggml_tensor; eps: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rms_norm_inplace';

function ggml_group_norm(ctx: Pggml_context; a: Pggml_tensor; n_groups: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_group_norm';

function ggml_group_norm_inplace(ctx: Pggml_context; a: Pggml_tensor; n_groups: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_group_norm_inplace';

function ggml_rms_norm_back(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; eps: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rms_norm_back';

function ggml_mul_mat(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_mul_mat';

procedure ggml_mul_mat_set_prec(a: Pggml_tensor; prec: ggml_prec); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_mul_mat_set_prec';

function ggml_mul_mat_id(ctx: Pggml_context; &as: Pggml_tensor; b: Pggml_tensor; ids: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_mul_mat_id';

function ggml_out_prod(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_out_prod';

function ggml_scale(ctx: Pggml_context; a: Pggml_tensor; s: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_scale';

function ggml_scale_inplace(ctx: Pggml_context; a: Pggml_tensor; s: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_scale_inplace';

function ggml_set(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; nb1: NativeUInt; nb2: NativeUInt; nb3: NativeUInt; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set';

function ggml_set_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; nb1: NativeUInt; nb2: NativeUInt; nb3: NativeUInt; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_inplace';

function ggml_set_1d(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_1d';

function ggml_set_1d_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_1d_inplace';

function ggml_set_2d(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; nb1: NativeUInt; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_2d';

function ggml_set_2d_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; nb1: NativeUInt; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_2d_inplace';

function ggml_cpy(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpy';

function ggml_cast(ctx: Pggml_context; a: Pggml_tensor; &type: ggml_type): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cast';

function ggml_cont(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cont';

function ggml_cont_1d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cont_1d';

function ggml_cont_2d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64; ne1: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cont_2d';

function ggml_cont_3d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64; ne1: Int64; ne2: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cont_3d';

function ggml_cont_4d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64; ne1: Int64; ne2: Int64; ne3: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cont_4d';

function ggml_reshape(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_reshape';

function ggml_reshape_1d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_reshape_1d';

function ggml_reshape_2d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64; ne1: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_reshape_2d';

function ggml_reshape_3d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64; ne1: Int64; ne2: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_reshape_3d';

function ggml_reshape_4d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64; ne1: Int64; ne2: Int64; ne3: Int64): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_reshape_4d';

function ggml_view_1d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_view_1d';

function ggml_view_2d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64; ne1: Int64; nb1: NativeUInt; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_view_2d';

function ggml_view_3d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64; ne1: Int64; ne2: Int64; nb1: NativeUInt; nb2: NativeUInt; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_view_3d';

function ggml_view_4d(ctx: Pggml_context; a: Pggml_tensor; ne0: Int64; ne1: Int64; ne2: Int64; ne3: Int64; nb1: NativeUInt; nb2: NativeUInt; nb3: NativeUInt; offset: NativeUInt): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_view_4d';

function ggml_permute(ctx: Pggml_context; a: Pggml_tensor; axis0: Integer; axis1: Integer; axis2: Integer; axis3: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_permute';

function ggml_transpose(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_transpose';

function ggml_get_rows(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_rows';

function ggml_get_rows_back(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_rows_back';

function ggml_diag(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_diag';

function ggml_diag_mask_inf(ctx: Pggml_context; a: Pggml_tensor; n_past: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_diag_mask_inf';

function ggml_diag_mask_inf_inplace(ctx: Pggml_context; a: Pggml_tensor; n_past: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_diag_mask_inf_inplace';

function ggml_diag_mask_zero(ctx: Pggml_context; a: Pggml_tensor; n_past: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_diag_mask_zero';

function ggml_diag_mask_zero_inplace(ctx: Pggml_context; a: Pggml_tensor; n_past: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_diag_mask_zero_inplace';

function ggml_soft_max(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_soft_max';

function ggml_soft_max_inplace(ctx: Pggml_context; a: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_soft_max_inplace';

function ggml_soft_max_ext(ctx: Pggml_context; a: Pggml_tensor; mask: Pggml_tensor; scale: Single; max_bias: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_soft_max_ext';

function ggml_soft_max_back(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_soft_max_back';

function ggml_soft_max_back_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_soft_max_back_inplace';

function ggml_rope(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope';

function ggml_rope_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_inplace';

function ggml_rope_ext(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx: Integer; n_orig_ctx: Integer; freq_base: Single; freq_scale: Single; ext_factor: Single; attn_factor: Single; beta_fast: Single; beta_slow: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_ext';

function ggml_rope_ext_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx: Integer; n_orig_ctx: Integer; freq_base: Single; freq_scale: Single; ext_factor: Single; attn_factor: Single; beta_fast: Single; beta_slow: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_ext_inplace';

function ggml_rope_custom(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx: Integer; n_orig_ctx: Integer; freq_base: Single; freq_scale: Single; ext_factor: Single; attn_factor: Single; beta_fast: Single; beta_slow: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_custom';

function ggml_rope_custom_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx: Integer; n_orig_ctx: Integer; freq_base: Single; freq_scale: Single; ext_factor: Single; attn_factor: Single; beta_fast: Single; beta_slow: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_custom_inplace';

procedure ggml_rope_yarn_corr_dims(n_dims: Integer; n_orig_ctx: Integer; freq_base: Single; beta_fast: Single; beta_slow: Single; dims: PSingle); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_yarn_corr_dims';

function ggml_rope_back(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx: Integer; n_orig_ctx: Integer; freq_base: Single; freq_scale: Single; ext_factor: Single; attn_factor: Single; beta_fast: Single; beta_slow: Single; xpos_base: Single; xpos_down: Boolean): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_back';

function ggml_clamp(ctx: Pggml_context; a: Pggml_tensor; min: Single; max: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_clamp';

function ggml_im2col(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; s0: Integer; s1: Integer; p0: Integer; p1: Integer; d0: Integer; d1: Integer; is_2D: Boolean; dst_type: ggml_type): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_im2col';

function ggml_conv_depthwise_2d(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; s0: Integer; s1: Integer; p0: Integer; p1: Integer; d0: Integer; d1: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_conv_depthwise_2d';

function ggml_conv_1d(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; s0: Integer; p0: Integer; d0: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_conv_1d';

function ggml_conv_1d_ph(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; s: Integer; d: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_conv_1d_ph';

function ggml_conv_transpose_1d(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; s0: Integer; p0: Integer; d0: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_conv_transpose_1d';

function ggml_conv_2d(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; s0: Integer; s1: Integer; p0: Integer; p1: Integer; d0: Integer; d1: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_conv_2d';

function ggml_conv_2d_sk_p0(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_conv_2d_sk_p0';

function ggml_conv_2d_s1_ph(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_conv_2d_s1_ph';

function ggml_conv_transpose_2d_p0(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; stride: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_conv_transpose_2d_p0';

function ggml_pool_1d(ctx: Pggml_context; a: Pggml_tensor; op: ggml_op_pool; k0: Integer; s0: Integer; p0: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_pool_1d';

function ggml_pool_2d(ctx: Pggml_context; a: Pggml_tensor; op: ggml_op_pool; k0: Integer; k1: Integer; s0: Integer; s1: Integer; p0: Single; p1: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_pool_2d';

function ggml_upscale(ctx: Pggml_context; a: Pggml_tensor; scale_factor: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_upscale';

function ggml_upscale_ext(ctx: Pggml_context; a: Pggml_tensor; ne0: Integer; ne1: Integer; ne2: Integer; ne3: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_upscale_ext';

function ggml_pad(ctx: Pggml_context; a: Pggml_tensor; p0: Integer; p1: Integer; p2: Integer; p3: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_pad';

function ggml_timestep_embedding(ctx: Pggml_context; timesteps: Pggml_tensor; dim: Integer; max_period: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_timestep_embedding';

function ggml_argsort(ctx: Pggml_context; a: Pggml_tensor; order: ggml_sort_order): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_argsort';

function ggml_arange(ctx: Pggml_context; start: Single; stop: Single; step: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_arange';

function ggml_top_k(ctx: Pggml_context; a: Pggml_tensor; k: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_top_k';

function ggml_flash_attn_ext(ctx: Pggml_context; q: Pggml_tensor; k: Pggml_tensor; v: Pggml_tensor; mask: Pggml_tensor; scale: Single; max_bias: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_flash_attn_ext';

procedure ggml_flash_attn_ext_set_prec(a: Pggml_tensor; prec: ggml_prec); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_flash_attn_ext_set_prec';

function ggml_flash_attn_back(ctx: Pggml_context; q: Pggml_tensor; k: Pggml_tensor; v: Pggml_tensor; d: Pggml_tensor; masked: Boolean): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_flash_attn_back';

function ggml_ssm_conv(ctx: Pggml_context; s: Pggml_tensor; x: Pggml_tensor; c: Pggml_tensor; sq: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_ssm_conv';

function ggml_ssm_scan(ctx: Pggml_context; s: Pggml_tensor; x: Pggml_tensor; dt: Pggml_tensor; A: Pggml_tensor; B: Pggml_tensor; C: Pggml_tensor; sq: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_ssm_scan';

function ggml_win_part(ctx: Pggml_context; a: Pggml_tensor; w: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_win_part';

function ggml_win_unpart(ctx: Pggml_context; a: Pggml_tensor; w0: Integer; h0: Integer; w: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_win_unpart';

function ggml_unary(ctx: Pggml_context; a: Pggml_tensor; op: ggml_unary_op): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_unary';

function ggml_unary_inplace(ctx: Pggml_context; a: Pggml_tensor; op: ggml_unary_op): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_unary_inplace';

function ggml_get_rel_pos(ctx: Pggml_context; a: Pggml_tensor; qh: Integer; kh: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_get_rel_pos';

function ggml_add_rel_pos(ctx: Pggml_context; a: Pggml_tensor; pw: Pggml_tensor; ph: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_add_rel_pos';

function ggml_add_rel_pos_inplace(ctx: Pggml_context; a: Pggml_tensor; pw: Pggml_tensor; ph: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_add_rel_pos_inplace';

function ggml_map_unary_f32(ctx: Pggml_context; a: Pggml_tensor; fun: ggml_unary_op_f32_t): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_unary_f32';

function ggml_map_unary_inplace_f32(ctx: Pggml_context; a: Pggml_tensor; fun: ggml_unary_op_f32_t): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_unary_inplace_f32';

function ggml_map_binary_f32(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; fun: ggml_binary_op_f32_t): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_binary_f32';

function ggml_map_binary_inplace_f32(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; fun: ggml_binary_op_f32_t): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_binary_inplace_f32';

function ggml_map_custom1_f32(ctx: Pggml_context; a: Pggml_tensor; fun: ggml_custom1_op_f32_t): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom1_f32';

function ggml_map_custom1_inplace_f32(ctx: Pggml_context; a: Pggml_tensor; fun: ggml_custom1_op_f32_t): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom1_inplace_f32';

function ggml_map_custom2_f32(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; fun: ggml_custom2_op_f32_t): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom2_f32';

function ggml_map_custom2_inplace_f32(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; fun: ggml_custom2_op_f32_t): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom2_inplace_f32';

function ggml_map_custom3_f32(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor; fun: ggml_custom3_op_f32_t): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom3_f32';

function ggml_map_custom3_inplace_f32(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor; fun: ggml_custom3_op_f32_t): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom3_inplace_f32';

function ggml_map_custom1(ctx: Pggml_context; a: Pggml_tensor; fun: ggml_custom1_op_t; n_tasks: Integer; userdata: Pointer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom1';

function ggml_map_custom1_inplace(ctx: Pggml_context; a: Pggml_tensor; fun: ggml_custom1_op_t; n_tasks: Integer; userdata: Pointer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom1_inplace';

function ggml_map_custom2(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; fun: ggml_custom2_op_t; n_tasks: Integer; userdata: Pointer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom2';

function ggml_map_custom2_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; fun: ggml_custom2_op_t; n_tasks: Integer; userdata: Pointer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom2_inplace';

function ggml_map_custom3(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor; fun: ggml_custom3_op_t; n_tasks: Integer; userdata: Pointer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom3';

function ggml_map_custom3_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor; fun: ggml_custom3_op_t; n_tasks: Integer; userdata: Pointer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_map_custom3_inplace';

function ggml_cross_entropy_loss(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cross_entropy_loss';

function ggml_cross_entropy_loss_back(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cross_entropy_loss_back';

procedure ggml_set_param(ctx: Pggml_context; tensor: Pggml_tensor); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_param';

procedure ggml_build_forward_expand(cgraph: Pggml_cgraph; tensor: Pggml_tensor); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_build_forward_expand';

procedure ggml_build_backward_expand(ctx: Pggml_context; gf: Pggml_cgraph; gb: Pggml_cgraph; keep: Boolean); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_build_backward_expand';

function ggml_new_graph(ctx: Pggml_context): Pggml_cgraph; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_new_graph';

function ggml_new_graph_custom(ctx: Pggml_context; size: NativeUInt; grads: Boolean): Pggml_cgraph; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_new_graph_custom';

function ggml_graph_dup(ctx: Pggml_context; cgraph: Pggml_cgraph): Pggml_cgraph; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_dup';

function ggml_graph_view(cgraph: Pggml_cgraph; i0: Integer; i1: Integer): ggml_cgraph; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_view';

procedure ggml_graph_cpy(src: Pggml_cgraph; dst: Pggml_cgraph); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_cpy';

procedure ggml_graph_reset(cgraph: Pggml_cgraph); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_reset';

procedure ggml_graph_clear(cgraph: Pggml_cgraph); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_clear';

function ggml_graph_overhead(): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_overhead';

function ggml_graph_overhead_custom(size: NativeUInt; grads: Boolean): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_overhead_custom';

function ggml_graph_plan(const cgraph: Pggml_cgraph; n_threads: Integer): ggml_cplan; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_plan';

function ggml_graph_compute(cgraph: Pggml_cgraph; cplan: Pggml_cplan): ggml_status; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_compute';

function ggml_graph_compute_with_ctx(ctx: Pggml_context; cgraph: Pggml_cgraph; n_threads: Integer): ggml_status; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_compute_with_ctx';

function ggml_graph_get_tensor(cgraph: Pggml_cgraph; const name: PUTF8Char): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_get_tensor';

procedure ggml_graph_export(const cgraph: Pggml_cgraph; const fname: PUTF8Char); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_export';

function ggml_graph_import(const fname: PUTF8Char; ctx_data: PPggml_context; ctx_eval: PPggml_context): Pggml_cgraph; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_import';

procedure ggml_graph_print(const cgraph: Pggml_cgraph); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_print';

procedure ggml_graph_dump_dot(const gb: Pggml_cgraph; const gf: Pggml_cgraph; const filename: PUTF8Char); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_graph_dump_dot';

procedure ggml_build_backward_gradient_checkpointing(ctx: Pggml_context; gf: Pggml_cgraph; gb: Pggml_cgraph; gb_tmp: Pggml_cgraph; checkpoints: PPggml_tensor; n_checkpoints: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_build_backward_gradient_checkpointing';

function ggml_opt_default_params(&type: ggml_opt_type): ggml_opt_params; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_opt_default_params';

function ggml_opt(ctx: Pggml_context; params: ggml_opt_params; f: Pggml_tensor): ggml_opt_result; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_opt';

procedure ggml_opt_init(ctx: Pggml_context; opt: Pggml_opt_context; params: ggml_opt_params; nx: Int64); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_opt_init';

function ggml_opt_resume(ctx: Pggml_context; opt: Pggml_opt_context; f: Pggml_tensor): ggml_opt_result; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_opt_resume';

function ggml_opt_resume_g(ctx: Pggml_context; opt: Pggml_opt_context; f: Pggml_tensor; gf: Pggml_cgraph; gb: Pggml_cgraph; callback: ggml_opt_callback; callback_data: Pointer): ggml_opt_result; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_opt_resume_g';

procedure ggml_set_input(tensor: Pggml_tensor); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_input';

procedure ggml_set_output(tensor: Pggml_tensor); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_set_output';

procedure ggml_quantize_init(&type: ggml_type); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_quantize_init';

procedure ggml_quantize_free(); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_quantize_free';

function ggml_quantize_requires_imatrix(&type: ggml_type): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_quantize_requires_imatrix';

function ggml_quantize_chunk(&type: ggml_type; const src: PSingle; dst: Pointer; start: Int64; nrows: Int64; n_per_row: Int64; const imatrix: PSingle): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_quantize_chunk';

function gguf_init_empty(): Pgguf_context; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_init_empty';

function gguf_init_from_file(const fname: PUTF8Char; params: gguf_init_params): Pgguf_context; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_init_from_file';

procedure gguf_free(ctx: Pgguf_context); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_free';

function gguf_type_name(&type: gguf_type): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_type_name';

function gguf_get_version(const ctx: Pgguf_context): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_version';

function gguf_get_alignment(const ctx: Pgguf_context): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_alignment';

function gguf_get_data_offset(const ctx: Pgguf_context): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_data_offset';

function gguf_get_data(const ctx: Pgguf_context): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_data';

function gguf_get_n_kv(const ctx: Pgguf_context): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_n_kv';

function gguf_find_key(const ctx: Pgguf_context; const key: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_find_key';

function gguf_get_key(const ctx: Pgguf_context; key_id: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_key';

function gguf_get_kv_type(const ctx: Pgguf_context; key_id: Integer): gguf_type; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_kv_type';

function gguf_get_arr_type(const ctx: Pgguf_context; key_id: Integer): gguf_type; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_arr_type';

function gguf_get_val_u8(const ctx: Pgguf_context; key_id: Integer): UInt8; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_u8';

function gguf_get_val_i8(const ctx: Pgguf_context; key_id: Integer): Int8; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_i8';

function gguf_get_val_u16(const ctx: Pgguf_context; key_id: Integer): UInt16; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_u16';

function gguf_get_val_i16(const ctx: Pgguf_context; key_id: Integer): Int16; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_i16';

function gguf_get_val_u32(const ctx: Pgguf_context; key_id: Integer): UInt32; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_u32';

function gguf_get_val_i32(const ctx: Pgguf_context; key_id: Integer): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_i32';

function gguf_get_val_f32(const ctx: Pgguf_context; key_id: Integer): Single; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_f32';

function gguf_get_val_u64(const ctx: Pgguf_context; key_id: Integer): UInt64; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_u64';

function gguf_get_val_i64(const ctx: Pgguf_context; key_id: Integer): Int64; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_i64';

function gguf_get_val_f64(const ctx: Pgguf_context; key_id: Integer): Double; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_f64';

function gguf_get_val_bool(const ctx: Pgguf_context; key_id: Integer): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_bool';

function gguf_get_val_str(const ctx: Pgguf_context; key_id: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_str';

function gguf_get_val_data(const ctx: Pgguf_context; key_id: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_val_data';

function gguf_get_arr_n(const ctx: Pgguf_context; key_id: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_arr_n';

function gguf_get_arr_data(const ctx: Pgguf_context; key_id: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_arr_data';

function gguf_get_arr_str(const ctx: Pgguf_context; key_id: Integer; i: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_arr_str';

function gguf_get_n_tensors(const ctx: Pgguf_context): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_n_tensors';

function gguf_find_tensor(const ctx: Pgguf_context; const name: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_find_tensor';

function gguf_get_tensor_offset(const ctx: Pgguf_context; i: Integer): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_tensor_offset';

function gguf_get_tensor_name(const ctx: Pgguf_context; i: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_tensor_name';

function gguf_get_tensor_type(const ctx: Pgguf_context; i: Integer): ggml_type; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_tensor_type';

procedure gguf_remove_key(ctx: Pgguf_context; const key: PUTF8Char); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_remove_key';

procedure gguf_set_val_u8(ctx: Pgguf_context; const key: PUTF8Char; val: UInt8); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_u8';

procedure gguf_set_val_i8(ctx: Pgguf_context; const key: PUTF8Char; val: Int8); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_i8';

procedure gguf_set_val_u16(ctx: Pgguf_context; const key: PUTF8Char; val: UInt16); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_u16';

procedure gguf_set_val_i16(ctx: Pgguf_context; const key: PUTF8Char; val: Int16); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_i16';

procedure gguf_set_val_u32(ctx: Pgguf_context; const key: PUTF8Char; val: UInt32); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_u32';

procedure gguf_set_val_i32(ctx: Pgguf_context; const key: PUTF8Char; val: Int32); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_i32';

procedure gguf_set_val_f32(ctx: Pgguf_context; const key: PUTF8Char; val: Single); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_f32';

procedure gguf_set_val_u64(ctx: Pgguf_context; const key: PUTF8Char; val: UInt64); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_u64';

procedure gguf_set_val_i64(ctx: Pgguf_context; const key: PUTF8Char; val: Int64); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_i64';

procedure gguf_set_val_f64(ctx: Pgguf_context; const key: PUTF8Char; val: Double); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_f64';

procedure gguf_set_val_bool(ctx: Pgguf_context; const key: PUTF8Char; val: Boolean); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_bool';

procedure gguf_set_val_str(ctx: Pgguf_context; const key: PUTF8Char; const val: PUTF8Char); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_val_str';

procedure gguf_set_arr_data(ctx: Pgguf_context; const key: PUTF8Char; &type: gguf_type; const data: Pointer; n: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_arr_data';

procedure gguf_set_arr_str(ctx: Pgguf_context; const key: PUTF8Char; data: PPUTF8Char; n: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_arr_str';

procedure gguf_set_kv(ctx: Pgguf_context; src: Pgguf_context); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_kv';

procedure gguf_add_tensor(ctx: Pgguf_context; const tensor: Pggml_tensor); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_add_tensor';

procedure gguf_set_tensor_type(ctx: Pgguf_context; const name: PUTF8Char; &type: ggml_type); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_tensor_type';

procedure gguf_set_tensor_data(ctx: Pgguf_context; const name: PUTF8Char; const data: Pointer; size: NativeUInt); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_set_tensor_data';

procedure gguf_write_to_file(const ctx: Pgguf_context; const fname: PUTF8Char; only_meta: Boolean); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_write_to_file';

function gguf_get_meta_size(const ctx: Pgguf_context): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_meta_size';

procedure gguf_get_meta_data(const ctx: Pgguf_context; data: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'gguf_get_meta_data';

function ggml_cpu_has_avx(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_avx';

function ggml_cpu_has_avx_vnni(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_avx_vnni';

function ggml_cpu_has_avx2(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_avx2';

function ggml_cpu_has_avx512(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_avx512';

function ggml_cpu_has_avx512_vbmi(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_avx512_vbmi';

function ggml_cpu_has_avx512_vnni(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_avx512_vnni';

function ggml_cpu_has_avx512_bf16(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_avx512_bf16';

function ggml_cpu_has_fma(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_fma';

function ggml_cpu_has_neon(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_neon';

function ggml_cpu_has_arm_fma(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_arm_fma';

function ggml_cpu_has_metal(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_metal';

function ggml_cpu_has_f16c(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_f16c';

function ggml_cpu_has_fp16_va(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_fp16_va';

function ggml_cpu_has_wasm_simd(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_wasm_simd';

function ggml_cpu_has_blas(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_blas';

function ggml_cpu_has_cuda(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_cuda';

function ggml_cpu_has_clblast(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_clblast';

function ggml_cpu_has_vulkan(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_vulkan';

function ggml_cpu_has_kompute(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_kompute';

function ggml_cpu_has_gpublas(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_gpublas';

function ggml_cpu_has_sse3(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_sse3';

function ggml_cpu_has_ssse3(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_ssse3';

function ggml_cpu_has_sycl(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_sycl';

function ggml_cpu_has_vsx(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_vsx';

function ggml_cpu_has_matmul_int8(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_matmul_int8';

function ggml_internal_get_type_traits(&type: ggml_type): ggml_type_traits_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_internal_get_type_traits';

function ggml_tallocr_new(buffer: ggml_backend_buffer_t): ggml_tallocr; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_tallocr_new';

procedure ggml_tallocr_alloc(talloc: Pggml_tallocr; tensor: Pggml_tensor); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_tallocr_alloc';

function ggml_gallocr_new(buft: ggml_backend_buffer_type_t): ggml_gallocr_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gallocr_new';

function ggml_gallocr_new_n(bufts: Pggml_backend_buffer_type_t; n_bufs: Integer): ggml_gallocr_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gallocr_new_n';

procedure ggml_gallocr_free(galloc: ggml_gallocr_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gallocr_free';

function ggml_gallocr_reserve(galloc: ggml_gallocr_t; graph: Pggml_cgraph): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gallocr_reserve';

function ggml_gallocr_reserve_n(galloc: ggml_gallocr_t; graph: Pggml_cgraph; const node_buffer_ids: PInteger; const leaf_buffer_ids: PInteger): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gallocr_reserve_n';

function ggml_gallocr_alloc_graph(galloc: ggml_gallocr_t; graph: Pggml_cgraph): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gallocr_alloc_graph';

function ggml_gallocr_get_buffer_size(galloc: ggml_gallocr_t; buffer_id: Integer): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_gallocr_get_buffer_size';

function ggml_backend_alloc_ctx_tensors_from_buft(ctx: Pggml_context; buft: ggml_backend_buffer_type_t): Pggml_backend_buffer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_alloc_ctx_tensors_from_buft';

function ggml_backend_alloc_ctx_tensors(ctx: Pggml_context; backend: ggml_backend_t): Pggml_backend_buffer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_alloc_ctx_tensors';

function ggml_backend_buft_name(buft: ggml_backend_buffer_type_t): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buft_name';

function ggml_backend_buft_alloc_buffer(buft: ggml_backend_buffer_type_t; size: NativeUInt): ggml_backend_buffer_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buft_alloc_buffer';

function ggml_backend_buft_get_alignment(buft: ggml_backend_buffer_type_t): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buft_get_alignment';

function ggml_backend_buft_get_max_size(buft: ggml_backend_buffer_type_t): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buft_get_max_size';

function ggml_backend_buft_get_alloc_size(buft: ggml_backend_buffer_type_t; tensor: Pggml_tensor): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buft_get_alloc_size';

function ggml_backend_buft_supports_backend(buft: ggml_backend_buffer_type_t; backend: ggml_backend_t): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buft_supports_backend';

function ggml_backend_buft_is_host(buft: ggml_backend_buffer_type_t): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buft_is_host';

function ggml_backend_buffer_name(buffer: ggml_backend_buffer_t): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_name';

procedure ggml_backend_buffer_free(buffer: ggml_backend_buffer_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_free';

function ggml_backend_buffer_get_base(buffer: ggml_backend_buffer_t): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_get_base';

function ggml_backend_buffer_get_size(buffer: ggml_backend_buffer_t): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_get_size';

procedure ggml_backend_buffer_init_tensor(buffer: ggml_backend_buffer_t; tensor: Pggml_tensor); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_init_tensor';

function ggml_backend_buffer_get_alignment(buffer: ggml_backend_buffer_t): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_get_alignment';

function ggml_backend_buffer_get_max_size(buffer: ggml_backend_buffer_t): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_get_max_size';

function ggml_backend_buffer_get_alloc_size(buffer: ggml_backend_buffer_t; tensor: Pggml_tensor): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_get_alloc_size';

procedure ggml_backend_buffer_clear(buffer: ggml_backend_buffer_t; value: UInt8); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_clear';

function ggml_backend_buffer_is_host(buffer: ggml_backend_buffer_t): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_is_host';

procedure ggml_backend_buffer_set_usage(buffer: ggml_backend_buffer_t; usage: ggml_backend_buffer_usage); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_set_usage';

function ggml_backend_buffer_get_type(buffer: ggml_backend_buffer_t): ggml_backend_buffer_type_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_get_type';

procedure ggml_backend_buffer_reset(buffer: ggml_backend_buffer_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_buffer_reset';

function ggml_backend_guid(backend: ggml_backend_t): ggml_guid_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_guid';

function ggml_backend_name(backend: ggml_backend_t): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_name';

procedure ggml_backend_free(backend: ggml_backend_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_free';

function ggml_backend_get_default_buffer_type(backend: ggml_backend_t): ggml_backend_buffer_type_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_get_default_buffer_type';

function ggml_backend_alloc_buffer(backend: ggml_backend_t; size: NativeUInt): ggml_backend_buffer_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_alloc_buffer';

function ggml_backend_get_alignment(backend: ggml_backend_t): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_get_alignment';

function ggml_backend_get_max_size(backend: ggml_backend_t): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_get_max_size';

procedure ggml_backend_tensor_set_async(backend: ggml_backend_t; tensor: Pggml_tensor; const data: Pointer; offset: NativeUInt; size: NativeUInt); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_tensor_set_async';

procedure ggml_backend_tensor_get_async(backend: ggml_backend_t; const tensor: Pggml_tensor; data: Pointer; offset: NativeUInt; size: NativeUInt); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_tensor_get_async';

procedure ggml_backend_tensor_set(tensor: Pggml_tensor; const data: Pointer; offset: NativeUInt; size: NativeUInt); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_tensor_set';

procedure ggml_backend_tensor_get(const tensor: Pggml_tensor; data: Pointer; offset: NativeUInt; size: NativeUInt); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_tensor_get';

procedure ggml_backend_synchronize(backend: ggml_backend_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_synchronize';

function ggml_backend_graph_plan_create(backend: ggml_backend_t; cgraph: Pggml_cgraph): ggml_backend_graph_plan_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_graph_plan_create';

procedure ggml_backend_graph_plan_free(backend: ggml_backend_t; plan: ggml_backend_graph_plan_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_graph_plan_free';

function ggml_backend_graph_plan_compute(backend: ggml_backend_t; plan: ggml_backend_graph_plan_t): ggml_status; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_graph_plan_compute';

function ggml_backend_graph_compute(backend: ggml_backend_t; cgraph: Pggml_cgraph): ggml_status; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_graph_compute';

function ggml_backend_graph_compute_async(backend: ggml_backend_t; cgraph: Pggml_cgraph): ggml_status; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_graph_compute_async';

function ggml_backend_supports_op(backend: ggml_backend_t; const op: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_supports_op';

function ggml_backend_offload_op(backend: ggml_backend_t; const op: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_offload_op';

procedure ggml_backend_tensor_copy(src: Pggml_tensor; dst: Pggml_tensor); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_tensor_copy';

procedure ggml_backend_tensor_copy_async(backend_src: ggml_backend_t; backend_dst: ggml_backend_t; src: Pggml_tensor; dst: Pggml_tensor); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_tensor_copy_async';

function ggml_backend_event_new(backend: ggml_backend_t): ggml_backend_event_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_event_new';

procedure ggml_backend_event_free(event: ggml_backend_event_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_event_free';

procedure ggml_backend_event_record(event: ggml_backend_event_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_event_record';

procedure ggml_backend_event_synchronize(event: ggml_backend_event_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_event_synchronize';

procedure ggml_backend_event_wait(backend: ggml_backend_t; event: ggml_backend_event_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_event_wait';

function ggml_backend_cpu_init(): ggml_backend_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_cpu_init';

function ggml_backend_is_cpu(backend: ggml_backend_t): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_is_cpu';

procedure ggml_backend_cpu_set_n_threads(backend_cpu: ggml_backend_t; n_threads: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_cpu_set_n_threads';

procedure ggml_backend_cpu_set_abort_callback(backend_cpu: ggml_backend_t; abort_callback: ggml_abort_callback; abort_callback_data: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_cpu_set_abort_callback';

function ggml_backend_cpu_buffer_from_ptr(ptr: Pointer; size: NativeUInt): ggml_backend_buffer_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_cpu_buffer_from_ptr';

function ggml_backend_cpu_buffer_type(): ggml_backend_buffer_type_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_cpu_buffer_type';

function ggml_backend_reg_get_count(): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_reg_get_count';

function ggml_backend_reg_find_by_name(const name: PUTF8Char): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_reg_find_by_name';

function ggml_backend_reg_init_backend_from_str(const backend_str: PUTF8Char): ggml_backend_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_reg_init_backend_from_str';

function ggml_backend_reg_get_name(i: NativeUInt): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_reg_get_name';

function ggml_backend_reg_init_backend(i: NativeUInt; const params: PUTF8Char): ggml_backend_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_reg_init_backend';

function ggml_backend_reg_get_default_buffer_type(i: NativeUInt): ggml_backend_buffer_type_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_reg_get_default_buffer_type';

function ggml_backend_reg_alloc_buffer(i: NativeUInt; size: NativeUInt): ggml_backend_buffer_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_reg_alloc_buffer';

function ggml_backend_sched_new(backends: Pggml_backend_t; bufts: Pggml_backend_buffer_type_t; n_backends: Integer; graph_size: NativeUInt; parallel: Boolean): ggml_backend_sched_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_new';

procedure ggml_backend_sched_free(sched: ggml_backend_sched_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_free';

function ggml_backend_sched_reserve(sched: ggml_backend_sched_t; measure_graph: Pggml_cgraph): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_reserve';

function ggml_backend_sched_get_n_splits(sched: ggml_backend_sched_t): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_get_n_splits';

function ggml_backend_sched_get_n_copies(sched: ggml_backend_sched_t): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_get_n_copies';

function ggml_backend_sched_get_buffer_size(sched: ggml_backend_sched_t; backend: ggml_backend_t): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_get_buffer_size';

procedure ggml_backend_sched_set_tensor_backend(sched: ggml_backend_sched_t; node: Pggml_tensor; backend: ggml_backend_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_set_tensor_backend';

function ggml_backend_sched_get_tensor_backend(sched: ggml_backend_sched_t; node: Pggml_tensor): ggml_backend_t; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_get_tensor_backend';

function ggml_backend_sched_alloc_graph(sched: ggml_backend_sched_t; graph: Pggml_cgraph): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_alloc_graph';

function ggml_backend_sched_graph_compute(sched: ggml_backend_sched_t; graph: Pggml_cgraph): ggml_status; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_graph_compute';

function ggml_backend_sched_graph_compute_async(sched: ggml_backend_sched_t; graph: Pggml_cgraph): ggml_status; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_graph_compute_async';

procedure ggml_backend_sched_synchronize(sched: ggml_backend_sched_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_synchronize';

procedure ggml_backend_sched_reset(sched: ggml_backend_sched_t); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_reset';

procedure ggml_backend_sched_set_eval_callback(sched: ggml_backend_sched_t; callback: ggml_backend_sched_eval_callback; user_data: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_sched_set_eval_callback';

function ggml_backend_graph_copy_rtn(backend: ggml_backend_t; graph: Pggml_cgraph): ggml_backend_graph_copy; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_graph_copy';

procedure ggml_backend_graph_copy_free(copy: ggml_backend_graph_copy); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_graph_copy_free';

function ggml_backend_compare_graph_backend(backend1: ggml_backend_t; backend2: ggml_backend_t; graph: Pggml_cgraph; callback: ggml_backend_eval_callback; user_data: Pointer): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_compare_graph_backend';

procedure ggml_backend_tensor_alloc(buffer: ggml_backend_buffer_t; tensor: Pggml_tensor; addr: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_tensor_alloc';

procedure ggml_backend_view_init(buffer: ggml_backend_buffer_t; tensor: Pggml_tensor); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_view_init';

function llama_model_default_params(): llama_model_params; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_default_params';

function llama_context_default_params(): llama_context_params; cdecl;
  external LMENGINE_DLL name _PU + 'llama_context_default_params';

function llama_model_quantize_default_params(): llama_model_quantize_params; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_quantize_default_params';

procedure llama_backend_init(); cdecl;
  external LMENGINE_DLL name _PU + 'llama_backend_init';

procedure llama_numa_init(numa: ggml_numa_strategy); cdecl;
  external LMENGINE_DLL name _PU + 'llama_numa_init';

procedure llama_backend_free(); cdecl;
  external LMENGINE_DLL name _PU + 'llama_backend_free';

function llama_load_model_from_file(const path_model: PUTF8Char; params: llama_model_params): Pllama_model; cdecl;
  external LMENGINE_DLL name _PU + 'llama_load_model_from_file';

procedure llama_free_model(model: Pllama_model); cdecl;
  external LMENGINE_DLL name _PU + 'llama_free_model';

function llama_new_context_with_model(model: Pllama_model; params: llama_context_params): Pllama_context; cdecl;
  external LMENGINE_DLL name _PU + 'llama_new_context_with_model';

procedure llama_free(ctx: Pllama_context); cdecl;
  external LMENGINE_DLL name _PU + 'llama_free';

function llama_time_us(): Int64; cdecl;
  external LMENGINE_DLL name _PU + 'llama_time_us';

function llama_max_devices(): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_max_devices';

function llama_supports_mmap(): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_supports_mmap';

function llama_supports_mlock(): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_supports_mlock';

function llama_supports_gpu_offload(): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_supports_gpu_offload';

function llama_get_model(const ctx: Pllama_context): Pllama_model; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_model';

function llama_n_ctx(const ctx: Pllama_context): UInt32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_n_ctx';

function llama_n_batch(const ctx: Pllama_context): UInt32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_n_batch';

function llama_n_ubatch(const ctx: Pllama_context): UInt32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_n_ubatch';

function llama_n_seq_max(const ctx: Pllama_context): UInt32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_n_seq_max';

function llama_pooling_type_rtn(const ctx: Pllama_context): llama_pooling_type; cdecl;
  external LMENGINE_DLL name _PU + 'llama_pooling_type';

function llama_vocab_type_rtn(const model: Pllama_model): llama_vocab_type; cdecl;
  external LMENGINE_DLL name _PU + 'llama_vocab_type';

function llama_rope_type_rtn(const model: Pllama_model): llama_rope_type; cdecl;
  external LMENGINE_DLL name _PU + 'llama_rope_type';

function llama_n_vocab(const model: Pllama_model): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_n_vocab';

function llama_n_ctx_train(const model: Pllama_model): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_n_ctx_train';

function llama_n_embd(const model: Pllama_model): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_n_embd';

function llama_n_layer(const model: Pllama_model): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_n_layer';

function llama_rope_freq_scale_train(const model: Pllama_model): Single; cdecl;
  external LMENGINE_DLL name _PU + 'llama_rope_freq_scale_train';

function llama_model_meta_val_str(const model: Pllama_model; const key: PUTF8Char; buf: PUTF8Char; buf_size: NativeUInt): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_meta_val_str';

function llama_model_meta_count(const model: Pllama_model): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_meta_count';

function llama_model_meta_key_by_index(const model: Pllama_model; i: Int32; buf: PUTF8Char; buf_size: NativeUInt): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_meta_key_by_index';

function llama_model_meta_val_str_by_index(const model: Pllama_model; i: Int32; buf: PUTF8Char; buf_size: NativeUInt): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_meta_val_str_by_index';

function llama_model_desc(const model: Pllama_model; buf: PUTF8Char; buf_size: NativeUInt): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_desc';

function llama_model_size(const model: Pllama_model): UInt64; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_size';

function llama_model_n_params(const model: Pllama_model): UInt64; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_n_params';

function llama_get_model_tensor(model: Pllama_model; const name: PUTF8Char): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_model_tensor';

function llama_model_quantize(const fname_inp: PUTF8Char; const fname_out: PUTF8Char; const params: Pllama_model_quantize_params): UInt32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_quantize';

function llama_model_apply_lora_from_file(const model: Pllama_model; const path_lora: PUTF8Char; scale: Single; const path_base_model: PUTF8Char; n_threads: Int32): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_model_apply_lora_from_file';

function llama_control_vector_apply(lctx: Pllama_context; const data: PSingle; len: NativeUInt; n_embd: Int32; il_start: Int32; il_end: Int32): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_control_vector_apply';

function llama_kv_cache_view_init(const ctx: Pllama_context; n_seq_max: Int32): llama_kv_cache_view; cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_view_init';

procedure llama_kv_cache_view_free(view: Pllama_kv_cache_view); cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_view_free';

procedure llama_kv_cache_view_update(const ctx: Pllama_context; view: Pllama_kv_cache_view); cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_view_update';

function llama_get_kv_cache_token_count(const ctx: Pllama_context): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_kv_cache_token_count';

function llama_get_kv_cache_used_cells(const ctx: Pllama_context): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_kv_cache_used_cells';

procedure llama_kv_cache_clear(ctx: Pllama_context); cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_clear';

function llama_kv_cache_seq_rm(ctx: Pllama_context; seq_id: llama_seq_id; p0: llama_pos; p1: llama_pos): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_seq_rm';

procedure llama_kv_cache_seq_cp(ctx: Pllama_context; seq_id_src: llama_seq_id; seq_id_dst: llama_seq_id; p0: llama_pos; p1: llama_pos); cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_seq_cp';

procedure llama_kv_cache_seq_keep(ctx: Pllama_context; seq_id: llama_seq_id); cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_seq_keep';

procedure llama_kv_cache_seq_add(ctx: Pllama_context; seq_id: llama_seq_id; p0: llama_pos; p1: llama_pos; delta: llama_pos); cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_seq_add';

procedure llama_kv_cache_seq_div(ctx: Pllama_context; seq_id: llama_seq_id; p0: llama_pos; p1: llama_pos; d: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_seq_div';

function llama_kv_cache_seq_pos_max(ctx: Pllama_context; seq_id: llama_seq_id): llama_pos; cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_seq_pos_max';

procedure llama_kv_cache_defrag(ctx: Pllama_context); cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_defrag';

procedure llama_kv_cache_update(ctx: Pllama_context); cdecl;
  external LMENGINE_DLL name _PU + 'llama_kv_cache_update';

function llama_state_get_size(const ctx: Pllama_context): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_state_get_size';

function llama_get_state_size(const ctx: Pllama_context): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_state_size';

function llama_state_get_data(ctx: Pllama_context; dst: PUInt8): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_state_get_data';

function llama_copy_state_data(ctx: Pllama_context; dst: PUInt8): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_copy_state_data';

function llama_state_set_data(ctx: Pllama_context; const src: PUInt8): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_state_set_data';

function llama_set_state_data(ctx: Pllama_context; const src: PUInt8): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_set_state_data';

function llama_state_load_file(ctx: Pllama_context; const path_session: PUTF8Char; tokens_out: Pllama_token; n_token_capacity: NativeUInt; n_token_count_out: PNativeUInt): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_state_load_file';

function llama_load_session_file(ctx: Pllama_context; const path_session: PUTF8Char; tokens_out: Pllama_token; n_token_capacity: NativeUInt; n_token_count_out: PNativeUInt): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_load_session_file';

function llama_state_save_file(ctx: Pllama_context; const path_session: PUTF8Char; const tokens: Pllama_token; n_token_count: NativeUInt): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_state_save_file';

function llama_save_session_file(ctx: Pllama_context; const path_session: PUTF8Char; const tokens: Pllama_token; n_token_count: NativeUInt): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_save_session_file';

function llama_state_seq_get_size(ctx: Pllama_context; seq_id: llama_seq_id): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_state_seq_get_size';

function llama_state_seq_get_data(ctx: Pllama_context; dst: PUInt8; seq_id: llama_seq_id): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_state_seq_get_data';

function llama_state_seq_set_data(ctx: Pllama_context; const src: PUInt8; dest_seq_id: llama_seq_id): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_state_seq_set_data';

function llama_state_seq_save_file(ctx: Pllama_context; const filepath: PUTF8Char; seq_id: llama_seq_id; const tokens: Pllama_token; n_token_count: NativeUInt): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_state_seq_save_file';

function llama_state_seq_load_file(ctx: Pllama_context; const filepath: PUTF8Char; dest_seq_id: llama_seq_id; tokens_out: Pllama_token; n_token_capacity: NativeUInt; n_token_count_out: PNativeUInt): NativeUInt; cdecl;
  external LMENGINE_DLL name _PU + 'llama_state_seq_load_file';

function llama_batch_get_one(tokens: Pllama_token; n_tokens: Int32; pos_0: llama_pos; seq_id: llama_seq_id): llama_batch; cdecl;
  external LMENGINE_DLL name _PU + 'llama_batch_get_one';

function llama_batch_init(n_tokens: Int32; embd: Int32; n_seq_max: Int32): llama_batch; cdecl;
  external LMENGINE_DLL name _PU + 'llama_batch_init';

procedure llama_batch_free(batch: llama_batch); cdecl;
  external LMENGINE_DLL name _PU + 'llama_batch_free';

function llama_decode(ctx: Pllama_context; batch: llama_batch): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_decode';

procedure llama_set_n_threads(ctx: Pllama_context; n_threads: UInt32; n_threads_batch: UInt32); cdecl;
  external LMENGINE_DLL name _PU + 'llama_set_n_threads';

function llama_n_threads(ctx: Pllama_context): UInt32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_n_threads';

function llama_n_threads_batch(ctx: Pllama_context): UInt32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_n_threads_batch';

procedure llama_set_causal_attn(ctx: Pllama_context; causal_attn: Boolean); cdecl;
  external LMENGINE_DLL name _PU + 'llama_set_causal_attn';

procedure llama_set_abort_callback(ctx: Pllama_context; abort_callback: ggml_abort_callback; abort_callback_data: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'llama_set_abort_callback';

procedure llama_synchronize(ctx: Pllama_context); cdecl;
  external LMENGINE_DLL name _PU + 'llama_synchronize';

function llama_get_logits(ctx: Pllama_context): PSingle; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_logits';

function llama_get_logits_ith(ctx: Pllama_context; i: Int32): PSingle; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_logits_ith';

function llama_get_embeddings(ctx: Pllama_context): PSingle; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_embeddings';

function llama_get_embeddings_ith(ctx: Pllama_context; i: Int32): PSingle; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_embeddings_ith';

function llama_get_embeddings_seq(ctx: Pllama_context; seq_id: llama_seq_id): PSingle; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_embeddings_seq';

function llama_token_get_text(const model: Pllama_model; token: llama_token): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_get_text';

function llama_token_get_score(const model: Pllama_model; token: llama_token): Single; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_get_score';

function llama_token_get_type(const model: Pllama_model; token: llama_token): llama_token_type; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_get_type';

function llama_token_is_eog(const model: Pllama_model; token: llama_token): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_is_eog';

function llama_token_bos(const model: Pllama_model): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_bos';

function llama_token_eos(const model: Pllama_model): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_eos';

function llama_token_cls(const model: Pllama_model): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_cls';

function llama_token_sep(const model: Pllama_model): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_sep';

function llama_token_nl(const model: Pllama_model): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_nl';

function llama_add_bos_token(const model: Pllama_model): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_add_bos_token';

function llama_add_eos_token(const model: Pllama_model): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_add_eos_token';

function llama_token_prefix(const model: Pllama_model): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_prefix';

function llama_token_middle(const model: Pllama_model): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_middle';

function llama_token_suffix(const model: Pllama_model): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_suffix';

function llama_token_eot(const model: Pllama_model): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_eot';

function llama_tokenize(const model: Pllama_model; const text: PUTF8Char; text_len: Int32; tokens: Pllama_token; n_tokens_max: Int32; add_special: Boolean; parse_special: Boolean): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_tokenize';

function llama_token_to_piece(const model: Pllama_model; token: llama_token; buf: PUTF8Char; length: Int32; special: Boolean): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_to_piece';

function llama_chat_apply_template(const model: Pllama_model; const tmpl: PUTF8Char; const chat: Pllama_chat_message; n_msg: NativeUInt; add_ass: Boolean; buf: PUTF8Char; length: Int32): Int32; cdecl;
  external LMENGINE_DLL name _PU + 'llama_chat_apply_template';

function llama_grammar_init(rules: PPllama_grammar_element; n_rules: NativeUInt; start_rule_index: NativeUInt): Pllama_grammar; cdecl;
  external LMENGINE_DLL name _PU + 'llama_grammar_init';

procedure llama_grammar_free(grammar: Pllama_grammar); cdecl;
  external LMENGINE_DLL name _PU + 'llama_grammar_free';

function llama_grammar_copy(const grammar: Pllama_grammar): Pllama_grammar; cdecl;
  external LMENGINE_DLL name _PU + 'llama_grammar_copy';

procedure llama_set_rng_seed(ctx: Pllama_context; seed: UInt32); cdecl;
  external LMENGINE_DLL name _PU + 'llama_set_rng_seed';

procedure llama_sample_repetition_penalties(ctx: Pllama_context; candidates: Pllama_token_data_array; const last_tokens: Pllama_token; penalty_last_n: NativeUInt; penalty_repeat: Single; penalty_freq: Single; penalty_present: Single); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_repetition_penalties';

procedure llama_sample_apply_guidance(ctx: Pllama_context; logits: PSingle; logits_guidance: PSingle; scale: Single); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_apply_guidance';

procedure llama_sample_softmax(ctx: Pllama_context; candidates: Pllama_token_data_array); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_softmax';

procedure llama_sample_top_k(ctx: Pllama_context; candidates: Pllama_token_data_array; k: Int32; min_keep: NativeUInt); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_top_k';

procedure llama_sample_top_p(ctx: Pllama_context; candidates: Pllama_token_data_array; p: Single; min_keep: NativeUInt); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_top_p';

procedure llama_sample_min_p(ctx: Pllama_context; candidates: Pllama_token_data_array; p: Single; min_keep: NativeUInt); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_min_p';

procedure llama_sample_tail_free(ctx: Pllama_context; candidates: Pllama_token_data_array; z: Single; min_keep: NativeUInt); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_tail_free';

procedure llama_sample_typical(ctx: Pllama_context; candidates: Pllama_token_data_array; p: Single; min_keep: NativeUInt); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_typical';

procedure llama_sample_entropy(ctx: Pllama_context; candidates_p: Pllama_token_data_array; min_temp: Single; max_temp: Single; exponent_val: Single); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_entropy';

procedure llama_sample_temp(ctx: Pllama_context; candidates: Pllama_token_data_array; temp: Single); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_temp';

procedure llama_sample_grammar(ctx: Pllama_context; candidates: Pllama_token_data_array; const grammar: Pllama_grammar); cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_grammar';

function llama_sample_token_mirostat(ctx: Pllama_context; candidates: Pllama_token_data_array; tau: Single; eta: Single; m: Int32; mu: PSingle): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_token_mirostat';

function llama_sample_token_mirostat_v2(ctx: Pllama_context; candidates: Pllama_token_data_array; tau: Single; eta: Single; mu: PSingle): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_token_mirostat_v2';

function llama_sample_token_greedy(ctx: Pllama_context; candidates: Pllama_token_data_array): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_token_greedy';

function llama_sample_token(ctx: Pllama_context; candidates: Pllama_token_data_array): llama_token; cdecl;
  external LMENGINE_DLL name _PU + 'llama_sample_token';

procedure llama_grammar_accept_token(ctx: Pllama_context; grammar: Pllama_grammar; token: llama_token); cdecl;
  external LMENGINE_DLL name _PU + 'llama_grammar_accept_token';

procedure llama_beam_search(ctx: Pllama_context; callback: llama_beam_search_callback_fn_t; callback_data: Pointer; n_beams: NativeUInt; n_past: Int32; n_predict: Int32); cdecl;
  external LMENGINE_DLL name _PU + 'llama_beam_search';

function llama_split_path(split_path: PUTF8Char; maxlen: NativeUInt; const path_prefix: PUTF8Char; split_no: Integer; split_count: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'llama_split_path';

function llama_split_prefix(split_prefix: PUTF8Char; maxlen: NativeUInt; const split_path: PUTF8Char; split_no: Integer; split_count: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'llama_split_prefix';

function llama_get_timings(ctx: Pllama_context): llama_timings; cdecl;
  external LMENGINE_DLL name _PU + 'llama_get_timings';

procedure llama_print_timings(ctx: Pllama_context); cdecl;
  external LMENGINE_DLL name _PU + 'llama_print_timings';

procedure llama_reset_timings(ctx: Pllama_context); cdecl;
  external LMENGINE_DLL name _PU + 'llama_reset_timings';

function llama_print_system_info(): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'llama_print_system_info';

procedure llama_log_set(log_callback: ggml_log_callback; user_data: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'llama_log_set';

procedure llama_dump_timing_info_yaml(stream: PPointer; const ctx: Pllama_context); cdecl;
  external LMENGINE_DLL name _PU + 'llama_dump_timing_info_yaml';

procedure redirect_cerr_to_callback(callback: cerr_callback; user_data: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'redirect_cerr_to_callback';

procedure restore_cerr(); cdecl;
  external LMENGINE_DLL name _PU + 'restore_cerr';

implementation

end.
