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
  SQLITE_VERSION = '3.46.0';
  SQLITE_VERSION_NUMBER = 3046000;
  SQLITE_SOURCE_ID = '2024-05-23 13:25:27 96c92aba00c8375bc32fafcdf12429c58bd8aabfcadab6683e35bbb9cdebf19e';
  SQLITE_OK = 0;
  SQLITE_ERROR = 1;
  SQLITE_INTERNAL = 2;
  SQLITE_PERM = 3;
  SQLITE_ABORT = 4;
  SQLITE_BUSY = 5;
  SQLITE_LOCKED = 6;
  SQLITE_NOMEM = 7;
  SQLITE_READONLY = 8;
  SQLITE_INTERRUPT = 9;
  SQLITE_IOERR = 10;
  SQLITE_CORRUPT = 11;
  SQLITE_NOTFOUND = 12;
  SQLITE_FULL = 13;
  SQLITE_CANTOPEN = 14;
  SQLITE_PROTOCOL = 15;
  SQLITE_EMPTY = 16;
  SQLITE_SCHEMA = 17;
  SQLITE_TOOBIG = 18;
  SQLITE_CONSTRAINT = 19;
  SQLITE_MISMATCH = 20;
  SQLITE_MISUSE = 21;
  SQLITE_NOLFS = 22;
  SQLITE_AUTH = 23;
  SQLITE_FORMAT = 24;
  SQLITE_RANGE = 25;
  SQLITE_NOTADB = 26;
  SQLITE_NOTICE = 27;
  SQLITE_WARNING = 28;
  SQLITE_ROW = 100;
  SQLITE_DONE = 101;
  SQLITE_ERROR_MISSING_COLLSEQ = (SQLITE_ERROR or (1 shl 8));
  SQLITE_ERROR_RETRY = (SQLITE_ERROR or (2 shl 8));
  SQLITE_ERROR_SNAPSHOT = (SQLITE_ERROR or (3 shl 8));
  SQLITE_IOERR_READ = (SQLITE_IOERR or (1 shl 8));
  SQLITE_IOERR_SHORT_READ = (SQLITE_IOERR or (2 shl 8));
  SQLITE_IOERR_WRITE = (SQLITE_IOERR or (3 shl 8));
  SQLITE_IOERR_FSYNC = (SQLITE_IOERR or (4 shl 8));
  SQLITE_IOERR_DIR_FSYNC = (SQLITE_IOERR or (5 shl 8));
  SQLITE_IOERR_TRUNCATE = (SQLITE_IOERR or (6 shl 8));
  SQLITE_IOERR_FSTAT = (SQLITE_IOERR or (7 shl 8));
  SQLITE_IOERR_UNLOCK = (SQLITE_IOERR or (8 shl 8));
  SQLITE_IOERR_RDLOCK = (SQLITE_IOERR or (9 shl 8));
  SQLITE_IOERR_DELETE = (SQLITE_IOERR or (10 shl 8));
  SQLITE_IOERR_BLOCKED = (SQLITE_IOERR or (11 shl 8));
  SQLITE_IOERR_NOMEM = (SQLITE_IOERR or (12 shl 8));
  SQLITE_IOERR_ACCESS = (SQLITE_IOERR or (13 shl 8));
  SQLITE_IOERR_CHECKRESERVEDLOCK = (SQLITE_IOERR or (14 shl 8));
  SQLITE_IOERR_LOCK = (SQLITE_IOERR or (15 shl 8));
  SQLITE_IOERR_CLOSE = (SQLITE_IOERR or (16 shl 8));
  SQLITE_IOERR_DIR_CLOSE = (SQLITE_IOERR or (17 shl 8));
  SQLITE_IOERR_SHMOPEN = (SQLITE_IOERR or (18 shl 8));
  SQLITE_IOERR_SHMSIZE = (SQLITE_IOERR or (19 shl 8));
  SQLITE_IOERR_SHMLOCK = (SQLITE_IOERR or (20 shl 8));
  SQLITE_IOERR_SHMMAP = (SQLITE_IOERR or (21 shl 8));
  SQLITE_IOERR_SEEK = (SQLITE_IOERR or (22 shl 8));
  SQLITE_IOERR_DELETE_NOENT = (SQLITE_IOERR or (23 shl 8));
  SQLITE_IOERR_MMAP = (SQLITE_IOERR or (24 shl 8));
  SQLITE_IOERR_GETTEMPPATH = (SQLITE_IOERR or (25 shl 8));
  SQLITE_IOERR_CONVPATH = (SQLITE_IOERR or (26 shl 8));
  SQLITE_IOERR_VNODE = (SQLITE_IOERR or (27 shl 8));
  SQLITE_IOERR_AUTH = (SQLITE_IOERR or (28 shl 8));
  SQLITE_IOERR_BEGIN_ATOMIC = (SQLITE_IOERR or (29 shl 8));
  SQLITE_IOERR_COMMIT_ATOMIC = (SQLITE_IOERR or (30 shl 8));
  SQLITE_IOERR_ROLLBACK_ATOMIC = (SQLITE_IOERR or (31 shl 8));
  SQLITE_IOERR_DATA = (SQLITE_IOERR or (32 shl 8));
  SQLITE_IOERR_CORRUPTFS = (SQLITE_IOERR or (33 shl 8));
  SQLITE_IOERR_IN_PAGE = (SQLITE_IOERR or (34 shl 8));
  SQLITE_LOCKED_SHAREDCACHE = (SQLITE_LOCKED or (1 shl 8));
  SQLITE_LOCKED_VTAB = (SQLITE_LOCKED or (2 shl 8));
  SQLITE_BUSY_RECOVERY = (SQLITE_BUSY or (1 shl 8));
  SQLITE_BUSY_SNAPSHOT = (SQLITE_BUSY or (2 shl 8));
  SQLITE_BUSY_TIMEOUT = (SQLITE_BUSY or (3 shl 8));
  SQLITE_CANTOPEN_NOTEMPDIR = (SQLITE_CANTOPEN or (1 shl 8));
  SQLITE_CANTOPEN_ISDIR = (SQLITE_CANTOPEN or (2 shl 8));
  SQLITE_CANTOPEN_FULLPATH = (SQLITE_CANTOPEN or (3 shl 8));
  SQLITE_CANTOPEN_CONVPATH = (SQLITE_CANTOPEN or (4 shl 8));
  SQLITE_CANTOPEN_DIRTYWAL = (SQLITE_CANTOPEN or (5 shl 8));
  SQLITE_CANTOPEN_SYMLINK = (SQLITE_CANTOPEN or (6 shl 8));
  SQLITE_CORRUPT_VTAB = (SQLITE_CORRUPT or (1 shl 8));
  SQLITE_CORRUPT_SEQUENCE = (SQLITE_CORRUPT or (2 shl 8));
  SQLITE_CORRUPT_INDEX = (SQLITE_CORRUPT or (3 shl 8));
  SQLITE_READONLY_RECOVERY = (SQLITE_READONLY or (1 shl 8));
  SQLITE_READONLY_CANTLOCK = (SQLITE_READONLY or (2 shl 8));
  SQLITE_READONLY_ROLLBACK = (SQLITE_READONLY or (3 shl 8));
  SQLITE_READONLY_DBMOVED = (SQLITE_READONLY or (4 shl 8));
  SQLITE_READONLY_CANTINIT = (SQLITE_READONLY or (5 shl 8));
  SQLITE_READONLY_DIRECTORY = (SQLITE_READONLY or (6 shl 8));
  SQLITE_ABORT_ROLLBACK = (SQLITE_ABORT or (2 shl 8));
  SQLITE_CONSTRAINT_CHECK = (SQLITE_CONSTRAINT or (1 shl 8));
  SQLITE_CONSTRAINT_COMMITHOOK = (SQLITE_CONSTRAINT or (2 shl 8));
  SQLITE_CONSTRAINT_FOREIGNKEY = (SQLITE_CONSTRAINT or (3 shl 8));
  SQLITE_CONSTRAINT_FUNCTION = (SQLITE_CONSTRAINT or (4 shl 8));
  SQLITE_CONSTRAINT_NOTNULL = (SQLITE_CONSTRAINT or (5 shl 8));
  SQLITE_CONSTRAINT_PRIMARYKEY = (SQLITE_CONSTRAINT or (6 shl 8));
  SQLITE_CONSTRAINT_TRIGGER = (SQLITE_CONSTRAINT or (7 shl 8));
  SQLITE_CONSTRAINT_UNIQUE = (SQLITE_CONSTRAINT or (8 shl 8));
  SQLITE_CONSTRAINT_VTAB = (SQLITE_CONSTRAINT or (9 shl 8));
  SQLITE_CONSTRAINT_ROWID = (SQLITE_CONSTRAINT or (10 shl 8));
  SQLITE_CONSTRAINT_PINNED = (SQLITE_CONSTRAINT or (11 shl 8));
  SQLITE_CONSTRAINT_DATATYPE = (SQLITE_CONSTRAINT or (12 shl 8));
  SQLITE_NOTICE_RECOVER_WAL = (SQLITE_NOTICE or (1 shl 8));
  SQLITE_NOTICE_RECOVER_ROLLBACK = (SQLITE_NOTICE or (2 shl 8));
  SQLITE_NOTICE_RBU = (SQLITE_NOTICE or (3 shl 8));
  SQLITE_WARNING_AUTOINDEX = (SQLITE_WARNING or (1 shl 8));
  SQLITE_AUTH_USER = (SQLITE_AUTH or (1 shl 8));
  SQLITE_OK_LOAD_PERMANENTLY = (SQLITE_OK or (1 shl 8));
  SQLITE_OK_SYMLINK = (SQLITE_OK or (2 shl 8));
  SQLITE_OPEN_READONLY = $00000001;
  SQLITE_OPEN_READWRITE = $00000002;
  SQLITE_OPEN_CREATE = $00000004;
  SQLITE_OPEN_DELETEONCLOSE = $00000008;
  SQLITE_OPEN_EXCLUSIVE = $00000010;
  SQLITE_OPEN_AUTOPROXY = $00000020;
  SQLITE_OPEN_URI = $00000040;
  SQLITE_OPEN_MEMORY = $00000080;
  SQLITE_OPEN_MAIN_DB = $00000100;
  SQLITE_OPEN_TEMP_DB = $00000200;
  SQLITE_OPEN_TRANSIENT_DB = $00000400;
  SQLITE_OPEN_MAIN_JOURNAL = $00000800;
  SQLITE_OPEN_TEMP_JOURNAL = $00001000;
  SQLITE_OPEN_SUBJOURNAL = $00002000;
  SQLITE_OPEN_SUPER_JOURNAL = $00004000;
  SQLITE_OPEN_NOMUTEX = $00008000;
  SQLITE_OPEN_FULLMUTEX = $00010000;
  SQLITE_OPEN_SHAREDCACHE = $00020000;
  SQLITE_OPEN_PRIVATECACHE = $00040000;
  SQLITE_OPEN_WAL = $00080000;
  SQLITE_OPEN_NOFOLLOW = $01000000;
  SQLITE_OPEN_EXRESCODE = $02000000;
  SQLITE_OPEN_MASTER_JOURNAL = $00004000;
  SQLITE_IOCAP_ATOMIC = $00000001;
  SQLITE_IOCAP_ATOMIC512 = $00000002;
  SQLITE_IOCAP_ATOMIC1K = $00000004;
  SQLITE_IOCAP_ATOMIC2K = $00000008;
  SQLITE_IOCAP_ATOMIC4K = $00000010;
  SQLITE_IOCAP_ATOMIC8K = $00000020;
  SQLITE_IOCAP_ATOMIC16K = $00000040;
  SQLITE_IOCAP_ATOMIC32K = $00000080;
  SQLITE_IOCAP_ATOMIC64K = $00000100;
  SQLITE_IOCAP_SAFE_APPEND = $00000200;
  SQLITE_IOCAP_SEQUENTIAL = $00000400;
  SQLITE_IOCAP_UNDELETABLE_WHEN_OPEN = $00000800;
  SQLITE_IOCAP_POWERSAFE_OVERWRITE = $00001000;
  SQLITE_IOCAP_IMMUTABLE = $00002000;
  SQLITE_IOCAP_BATCH_ATOMIC = $00004000;
  SQLITE_LOCK_NONE = 0;
  SQLITE_LOCK_SHARED = 1;
  SQLITE_LOCK_RESERVED = 2;
  SQLITE_LOCK_PENDING = 3;
  SQLITE_LOCK_EXCLUSIVE = 4;
  SQLITE_SYNC_NORMAL = $00002;
  SQLITE_SYNC_FULL = $00003;
  SQLITE_SYNC_DATAONLY = $00010;
  SQLITE_FCNTL_LOCKSTATE = 1;
  SQLITE_FCNTL_GET_LOCKPROXYFILE = 2;
  SQLITE_FCNTL_SET_LOCKPROXYFILE = 3;
  SQLITE_FCNTL_LAST_ERRNO = 4;
  SQLITE_FCNTL_SIZE_HINT = 5;
  SQLITE_FCNTL_CHUNK_SIZE = 6;
  SQLITE_FCNTL_FILE_POINTER = 7;
  SQLITE_FCNTL_SYNC_OMITTED = 8;
  SQLITE_FCNTL_WIN32_AV_RETRY = 9;
  SQLITE_FCNTL_PERSIST_WAL = 10;
  SQLITE_FCNTL_OVERWRITE = 11;
  SQLITE_FCNTL_VFSNAME = 12;
  SQLITE_FCNTL_POWERSAFE_OVERWRITE = 13;
  SQLITE_FCNTL_PRAGMA = 14;
  SQLITE_FCNTL_BUSYHANDLER = 15;
  SQLITE_FCNTL_TEMPFILENAME = 16;
  SQLITE_FCNTL_MMAP_SIZE = 18;
  SQLITE_FCNTL_TRACE = 19;
  SQLITE_FCNTL_HAS_MOVED = 20;
  SQLITE_FCNTL_SYNC = 21;
  SQLITE_FCNTL_COMMIT_PHASETWO = 22;
  SQLITE_FCNTL_WIN32_SET_HANDLE = 23;
  SQLITE_FCNTL_WAL_BLOCK = 24;
  SQLITE_FCNTL_ZIPVFS = 25;
  SQLITE_FCNTL_RBU = 26;
  SQLITE_FCNTL_VFS_POINTER = 27;
  SQLITE_FCNTL_JOURNAL_POINTER = 28;
  SQLITE_FCNTL_WIN32_GET_HANDLE = 29;
  SQLITE_FCNTL_PDB = 30;
  SQLITE_FCNTL_BEGIN_ATOMIC_WRITE = 31;
  SQLITE_FCNTL_COMMIT_ATOMIC_WRITE = 32;
  SQLITE_FCNTL_ROLLBACK_ATOMIC_WRITE = 33;
  SQLITE_FCNTL_LOCK_TIMEOUT = 34;
  SQLITE_FCNTL_DATA_VERSION = 35;
  SQLITE_FCNTL_SIZE_LIMIT = 36;
  SQLITE_FCNTL_CKPT_DONE = 37;
  SQLITE_FCNTL_RESERVE_BYTES = 38;
  SQLITE_FCNTL_CKPT_START = 39;
  SQLITE_FCNTL_EXTERNAL_READER = 40;
  SQLITE_FCNTL_CKSM_FILE = 41;
  SQLITE_FCNTL_RESET_CACHE = 42;
  SQLITE_GET_LOCKPROXYFILE = SQLITE_FCNTL_GET_LOCKPROXYFILE;
  SQLITE_SET_LOCKPROXYFILE = SQLITE_FCNTL_SET_LOCKPROXYFILE;
  SQLITE_LAST_ERRNO = SQLITE_FCNTL_LAST_ERRNO;
  SQLITE_ACCESS_EXISTS = 0;
  SQLITE_ACCESS_READWRITE = 1;
  SQLITE_ACCESS_READ = 2;
  SQLITE_SHM_UNLOCK = 1;
  SQLITE_SHM_LOCK = 2;
  SQLITE_SHM_SHARED = 4;
  SQLITE_SHM_EXCLUSIVE = 8;
  SQLITE_SHM_NLOCK = 8;
  SQLITE_CONFIG_SINGLETHREAD = 1;
  SQLITE_CONFIG_MULTITHREAD = 2;
  SQLITE_CONFIG_SERIALIZED = 3;
  SQLITE_CONFIG_MALLOC = 4;
  SQLITE_CONFIG_GETMALLOC = 5;
  SQLITE_CONFIG_SCRATCH = 6;
  SQLITE_CONFIG_PAGECACHE = 7;
  SQLITE_CONFIG_HEAP = 8;
  SQLITE_CONFIG_MEMSTATUS = 9;
  SQLITE_CONFIG_MUTEX = 10;
  SQLITE_CONFIG_GETMUTEX = 11;
  SQLITE_CONFIG_LOOKASIDE = 13;
  SQLITE_CONFIG_PCACHE = 14;
  SQLITE_CONFIG_GETPCACHE = 15;
  SQLITE_CONFIG_LOG = 16;
  SQLITE_CONFIG_URI = 17;
  SQLITE_CONFIG_PCACHE2 = 18;
  SQLITE_CONFIG_GETPCACHE2 = 19;
  SQLITE_CONFIG_COVERING_INDEX_SCAN = 20;
  SQLITE_CONFIG_SQLLOG = 21;
  SQLITE_CONFIG_MMAP_SIZE = 22;
  SQLITE_CONFIG_WIN32_HEAPSIZE = 23;
  SQLITE_CONFIG_PCACHE_HDRSZ = 24;
  SQLITE_CONFIG_PMASZ = 25;
  SQLITE_CONFIG_STMTJRNL_SPILL = 26;
  SQLITE_CONFIG_SMALL_MALLOC = 27;
  SQLITE_CONFIG_SORTERREF_SIZE = 28;
  SQLITE_CONFIG_MEMDB_MAXSIZE = 29;
  SQLITE_CONFIG_ROWID_IN_VIEW = 30;
  SQLITE_DBCONFIG_MAINDBNAME = 1000;
  SQLITE_DBCONFIG_LOOKASIDE = 1001;
  SQLITE_DBCONFIG_ENABLE_FKEY = 1002;
  SQLITE_DBCONFIG_ENABLE_TRIGGER = 1003;
  SQLITE_DBCONFIG_ENABLE_FTS3_TOKENIZER = 1004;
  SQLITE_DBCONFIG_ENABLE_LOAD_EXTENSION = 1005;
  SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE = 1006;
  SQLITE_DBCONFIG_ENABLE_QPSG = 1007;
  SQLITE_DBCONFIG_TRIGGER_EQP = 1008;
  SQLITE_DBCONFIG_RESET_DATABASE = 1009;
  SQLITE_DBCONFIG_DEFENSIVE = 1010;
  SQLITE_DBCONFIG_WRITABLE_SCHEMA = 1011;
  SQLITE_DBCONFIG_LEGACY_ALTER_TABLE = 1012;
  SQLITE_DBCONFIG_DQS_DML = 1013;
  SQLITE_DBCONFIG_DQS_DDL = 1014;
  SQLITE_DBCONFIG_ENABLE_VIEW = 1015;
  SQLITE_DBCONFIG_LEGACY_FILE_FORMAT = 1016;
  SQLITE_DBCONFIG_TRUSTED_SCHEMA = 1017;
  SQLITE_DBCONFIG_STMT_SCANSTATUS = 1018;
  SQLITE_DBCONFIG_REVERSE_SCANORDER = 1019;
  SQLITE_DBCONFIG_MAX = 1019;
  SQLITE_DENY = 1;
  SQLITE_IGNORE = 2;
  SQLITE_CREATE_INDEX = 1;
  SQLITE_CREATE_TABLE = 2;
  SQLITE_CREATE_TEMP_INDEX = 3;
  SQLITE_CREATE_TEMP_TABLE = 4;
  SQLITE_CREATE_TEMP_TRIGGER = 5;
  SQLITE_CREATE_TEMP_VIEW = 6;
  SQLITE_CREATE_TRIGGER = 7;
  SQLITE_CREATE_VIEW = 8;
  SQLITE_DELETE = 9;
  SQLITE_DROP_INDEX = 10;
  SQLITE_DROP_TABLE = 11;
  SQLITE_DROP_TEMP_INDEX = 12;
  SQLITE_DROP_TEMP_TABLE = 13;
  SQLITE_DROP_TEMP_TRIGGER = 14;
  SQLITE_DROP_TEMP_VIEW = 15;
  SQLITE_DROP_TRIGGER = 16;
  SQLITE_DROP_VIEW = 17;
  SQLITE_INSERT = 18;
  SQLITE_PRAGMA = 19;
  SQLITE_READ = 20;
  SQLITE_SELECT = 21;
  SQLITE_TRANSACTION = 22;
  SQLITE_UPDATE = 23;
  SQLITE_ATTACH = 24;
  SQLITE_DETACH = 25;
  SQLITE_ALTER_TABLE = 26;
  SQLITE_REINDEX = 27;
  SQLITE_ANALYZE = 28;
  SQLITE_CREATE_VTABLE = 29;
  SQLITE_DROP_VTABLE = 30;
  SQLITE_FUNCTION = 31;
  SQLITE_SAVEPOINT = 32;
  SQLITE_COPY = 0;
  SQLITE_RECURSIVE = 33;
  SQLITE_TRACE_STMT = $01;
  SQLITE_TRACE_PROFILE = $02;
  SQLITE_TRACE_ROW = $04;
  SQLITE_TRACE_CLOSE = $08;
  SQLITE_LIMIT_LENGTH = 0;
  SQLITE_LIMIT_SQL_LENGTH = 1;
  SQLITE_LIMIT_COLUMN = 2;
  SQLITE_LIMIT_EXPR_DEPTH = 3;
  SQLITE_LIMIT_COMPOUND_SELECT = 4;
  SQLITE_LIMIT_VDBE_OP = 5;
  SQLITE_LIMIT_FUNCTION_ARG = 6;
  SQLITE_LIMIT_ATTACHED = 7;
  SQLITE_LIMIT_LIKE_PATTERN_LENGTH = 8;
  SQLITE_LIMIT_VARIABLE_NUMBER = 9;
  SQLITE_LIMIT_TRIGGER_DEPTH = 10;
  SQLITE_LIMIT_WORKER_THREADS = 11;
  SQLITE_PREPARE_PERSISTENT = $01;
  SQLITE_PREPARE_NORMALIZE = $02;
  SQLITE_PREPARE_NO_VTAB = $04;
  SQLITE_INTEGER = 1;
  SQLITE_FLOAT = 2;
  SQLITE_BLOB = 4;
  SQLITE_NULL = 5;
  SQLITE_TEXT = 3;
  SQLITE3_TEXT = 3;
  SQLITE_UTF8 = 1;
  SQLITE_UTF16LE = 2;
  SQLITE_UTF16BE = 3;
  SQLITE_UTF16 = 4;
  SQLITE_ANY = 5;
  SQLITE_UTF16_ALIGNED = 8;
  SQLITE_DETERMINISTIC = $000000800;
  SQLITE_DIRECTONLY = $000080000;
  SQLITE_SUBTYPE = $000100000;
  SQLITE_INNOCUOUS = $000200000;
  SQLITE_RESULT_SUBTYPE = $001000000;
  SQLITE_WIN32_DATA_DIRECTORY_TYPE = 1;
  SQLITE_WIN32_TEMP_DIRECTORY_TYPE = 2;
  SQLITE_TXN_NONE = 0;
  SQLITE_TXN_READ = 1;
  SQLITE_TXN_WRITE = 2;
  SQLITE_INDEX_SCAN_UNIQUE = 1;
  SQLITE_INDEX_CONSTRAINT_EQ = 2;
  SQLITE_INDEX_CONSTRAINT_GT = 4;
  SQLITE_INDEX_CONSTRAINT_LE = 8;
  SQLITE_INDEX_CONSTRAINT_LT = 16;
  SQLITE_INDEX_CONSTRAINT_GE = 32;
  SQLITE_INDEX_CONSTRAINT_MATCH = 64;
  SQLITE_INDEX_CONSTRAINT_LIKE = 65;
  SQLITE_INDEX_CONSTRAINT_GLOB = 66;
  SQLITE_INDEX_CONSTRAINT_REGEXP = 67;
  SQLITE_INDEX_CONSTRAINT_NE = 68;
  SQLITE_INDEX_CONSTRAINT_ISNOT = 69;
  SQLITE_INDEX_CONSTRAINT_ISNOTNULL = 70;
  SQLITE_INDEX_CONSTRAINT_ISNULL = 71;
  SQLITE_INDEX_CONSTRAINT_IS = 72;
  SQLITE_INDEX_CONSTRAINT_LIMIT = 73;
  SQLITE_INDEX_CONSTRAINT_OFFSET = 74;
  SQLITE_INDEX_CONSTRAINT_FUNCTION = 150;
  SQLITE_MUTEX_FAST = 0;
  SQLITE_MUTEX_RECURSIVE = 1;
  SQLITE_MUTEX_STATIC_MAIN = 2;
  SQLITE_MUTEX_STATIC_MEM = 3;
  SQLITE_MUTEX_STATIC_MEM2 = 4;
  SQLITE_MUTEX_STATIC_OPEN = 4;
  SQLITE_MUTEX_STATIC_PRNG = 5;
  SQLITE_MUTEX_STATIC_LRU = 6;
  SQLITE_MUTEX_STATIC_LRU2 = 7;
  SQLITE_MUTEX_STATIC_PMEM = 7;
  SQLITE_MUTEX_STATIC_APP1 = 8;
  SQLITE_MUTEX_STATIC_APP2 = 9;
  SQLITE_MUTEX_STATIC_APP3 = 10;
  SQLITE_MUTEX_STATIC_VFS1 = 11;
  SQLITE_MUTEX_STATIC_VFS2 = 12;
  SQLITE_MUTEX_STATIC_VFS3 = 13;
  SQLITE_MUTEX_STATIC_MASTER = 2;
  SQLITE_TESTCTRL_FIRST = 5;
  SQLITE_TESTCTRL_PRNG_SAVE = 5;
  SQLITE_TESTCTRL_PRNG_RESTORE = 6;
  SQLITE_TESTCTRL_PRNG_RESET = 7;
  SQLITE_TESTCTRL_FK_NO_ACTION = 7;
  SQLITE_TESTCTRL_BITVEC_TEST = 8;
  SQLITE_TESTCTRL_FAULT_INSTALL = 9;
  SQLITE_TESTCTRL_BENIGN_MALLOC_HOOKS = 10;
  SQLITE_TESTCTRL_PENDING_BYTE = 11;
  SQLITE_TESTCTRL_ASSERT = 12;
  SQLITE_TESTCTRL_ALWAYS = 13;
  SQLITE_TESTCTRL_RESERVE = 14;
  SQLITE_TESTCTRL_JSON_SELFCHECK = 14;
  SQLITE_TESTCTRL_OPTIMIZATIONS = 15;
  SQLITE_TESTCTRL_ISKEYWORD = 16;
  SQLITE_TESTCTRL_SCRATCHMALLOC = 17;
  SQLITE_TESTCTRL_INTERNAL_FUNCTIONS = 17;
  SQLITE_TESTCTRL_LOCALTIME_FAULT = 18;
  SQLITE_TESTCTRL_EXPLAIN_STMT = 19;
  SQLITE_TESTCTRL_ONCE_RESET_THRESHOLD = 19;
  SQLITE_TESTCTRL_NEVER_CORRUPT = 20;
  SQLITE_TESTCTRL_VDBE_COVERAGE = 21;
  SQLITE_TESTCTRL_BYTEORDER = 22;
  SQLITE_TESTCTRL_ISINIT = 23;
  SQLITE_TESTCTRL_SORTER_MMAP = 24;
  SQLITE_TESTCTRL_IMPOSTER = 25;
  SQLITE_TESTCTRL_PARSER_COVERAGE = 26;
  SQLITE_TESTCTRL_RESULT_INTREAL = 27;
  SQLITE_TESTCTRL_PRNG_SEED = 28;
  SQLITE_TESTCTRL_EXTRA_SCHEMA_CHECKS = 29;
  SQLITE_TESTCTRL_SEEK_COUNT = 30;
  SQLITE_TESTCTRL_TRACEFLAGS = 31;
  SQLITE_TESTCTRL_TUNE = 32;
  SQLITE_TESTCTRL_LOGEST = 33;
  SQLITE_TESTCTRL_USELONGDOUBLE = 34;
  SQLITE_TESTCTRL_LAST = 34;
  SQLITE_STATUS_MEMORY_USED = 0;
  SQLITE_STATUS_PAGECACHE_USED = 1;
  SQLITE_STATUS_PAGECACHE_OVERFLOW = 2;
  SQLITE_STATUS_SCRATCH_USED = 3;
  SQLITE_STATUS_SCRATCH_OVERFLOW = 4;
  SQLITE_STATUS_MALLOC_SIZE = 5;
  SQLITE_STATUS_PARSER_STACK = 6;
  SQLITE_STATUS_PAGECACHE_SIZE = 7;
  SQLITE_STATUS_SCRATCH_SIZE = 8;
  SQLITE_STATUS_MALLOC_COUNT = 9;
  SQLITE_DBSTATUS_LOOKASIDE_USED = 0;
  SQLITE_DBSTATUS_CACHE_USED = 1;
  SQLITE_DBSTATUS_SCHEMA_USED = 2;
  SQLITE_DBSTATUS_STMT_USED = 3;
  SQLITE_DBSTATUS_LOOKASIDE_HIT = 4;
  SQLITE_DBSTATUS_LOOKASIDE_MISS_SIZE = 5;
  SQLITE_DBSTATUS_LOOKASIDE_MISS_FULL = 6;
  SQLITE_DBSTATUS_CACHE_HIT = 7;
  SQLITE_DBSTATUS_CACHE_MISS = 8;
  SQLITE_DBSTATUS_CACHE_WRITE = 9;
  SQLITE_DBSTATUS_DEFERRED_FKS = 10;
  SQLITE_DBSTATUS_CACHE_USED_SHARED = 11;
  SQLITE_DBSTATUS_CACHE_SPILL = 12;
  SQLITE_DBSTATUS_MAX = 12;
  SQLITE_STMTSTATUS_FULLSCAN_STEP = 1;
  SQLITE_STMTSTATUS_SORT = 2;
  SQLITE_STMTSTATUS_AUTOINDEX = 3;
  SQLITE_STMTSTATUS_VM_STEP = 4;
  SQLITE_STMTSTATUS_REPREPARE = 5;
  SQLITE_STMTSTATUS_RUN = 6;
  SQLITE_STMTSTATUS_FILTER_MISS = 7;
  SQLITE_STMTSTATUS_FILTER_HIT = 8;
  SQLITE_STMTSTATUS_MEMUSED = 99;
  SQLITE_CHECKPOINT_PASSIVE = 0;
  SQLITE_CHECKPOINT_FULL = 1;
  SQLITE_CHECKPOINT_RESTART = 2;
  SQLITE_CHECKPOINT_TRUNCATE = 3;
  SQLITE_VTAB_CONSTRAINT_SUPPORT = 1;
  SQLITE_VTAB_INNOCUOUS = 2;
  SQLITE_VTAB_DIRECTONLY = 3;
  SQLITE_VTAB_USES_ALL_SCHEMAS = 4;
  SQLITE_ROLLBACK = 1;
  SQLITE_FAIL = 3;
  SQLITE_REPLACE = 5;
  SQLITE_SCANSTAT_NLOOP = 0;
  SQLITE_SCANSTAT_NVISIT = 1;
  SQLITE_SCANSTAT_EST = 2;
  SQLITE_SCANSTAT_NAME = 3;
  SQLITE_SCANSTAT_EXPLAIN = 4;
  SQLITE_SCANSTAT_SELECTID = 5;
  SQLITE_SCANSTAT_PARENTID = 6;
  SQLITE_SCANSTAT_NCYCLE = 7;
  SQLITE_SCANSTAT_COMPLEX = $0001;
  SQLITE_SERIALIZE_NOCOPY = $001;
  SQLITE_DESERIALIZE_FREEONCLOSE = 1;
  SQLITE_DESERIALIZE_RESIZEABLE = 2;
  SQLITE_DESERIALIZE_READONLY = 4;
  NOT_WITHIN = 0;
  PARTLY_WITHIN = 1;
  FULLY_WITHIN = 2;
  FTS5_TOKENIZE_QUERY = $0001;
  FTS5_TOKENIZE_PREFIX = $0002;
  FTS5_TOKENIZE_DOCUMENT = $0004;
  FTS5_TOKENIZE_AUX = $0008;
  FTS5_TOKEN_COLOCATED = $0001;
  SQLITE_VEC_VERSION = 'v${VERSION}';
  SQLITE_VEC_DATE = '${DATE}';
  SQLITE_VEC_SOURCE = '${SOURCE}';
  SQLITE_LEMBED_VERSION = 'v${VERSION}';
  SQLITE_LEMBED_DATE = '${DATE}';
  SQLITE_LEMBED_SOURCE = '${SOURCE}';

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
  LLAMA_VOCAB_PRE_TYPE_SMAUG = 14;
  LLAMA_VOCAB_PRE_TYPE_PORO = 15;

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
  llama_token_attr = Integer;
  Pllama_token_attr = ^llama_token_attr;

const
  LLAMA_TOKEN_ATTR_UNDEFINED = 0;
  LLAMA_TOKEN_ATTR_UNKNOWN = 1;
  LLAMA_TOKEN_ATTR_UNUSED = 2;
  LLAMA_TOKEN_ATTR_NORMAL = 4;
  LLAMA_TOKEN_ATTR_CONTROL = 8;
  LLAMA_TOKEN_ATTR_USER_DEFINED = 16;
  LLAMA_TOKEN_ATTR_BYTE = 32;
  LLAMA_TOKEN_ATTR_NORMALIZED = 64;
  LLAMA_TOKEN_ATTR_LSTRIP = 128;
  LLAMA_TOKEN_ATTR_RSTRIP = 256;
  LLAMA_TOKEN_ATTR_SINGLE_WORD = 512;

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
  LLAMA_GRETYPE_CHAR_ANY = 7;

type
  // Forward declarations
  PPUTF8Char = ^PUTF8Char;
  PPPUTF8Char = ^PPUTF8Char;
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
  Psqlite3_file = ^sqlite3_file;
  Psqlite3_io_methods = ^sqlite3_io_methods;
  Psqlite3_vfs = ^sqlite3_vfs;
  Psqlite3_mem_methods = ^sqlite3_mem_methods;
  Psqlite3_module = ^sqlite3_module;
  Psqlite3_index_constraint = ^sqlite3_index_constraint;
  Psqlite3_index_orderby = ^sqlite3_index_orderby;
  Psqlite3_index_constraint_usage = ^sqlite3_index_constraint_usage;
  Psqlite3_index_info = ^sqlite3_index_info;
  Psqlite3_vtab = ^sqlite3_vtab;
  PPsqlite3_vtab = ^Psqlite3_vtab;
  Psqlite3_vtab_cursor = ^sqlite3_vtab_cursor;
  PPsqlite3_vtab_cursor = ^Psqlite3_vtab_cursor;
  Psqlite3_mutex_methods = ^sqlite3_mutex_methods;
  Psqlite3_pcache_page = ^sqlite3_pcache_page;
  Psqlite3_pcache_methods2 = ^sqlite3_pcache_methods2;
  Psqlite3_pcache_methods = ^sqlite3_pcache_methods;
  Psqlite3_snapshot = ^sqlite3_snapshot;
  PPsqlite3_snapshot = ^Psqlite3_snapshot;
  Psqlite3_rtree_geometry = ^sqlite3_rtree_geometry;
  Psqlite3_rtree_query_info = ^sqlite3_rtree_query_info;
  PFts5PhraseIter = ^Fts5PhraseIter;
  PFts5ExtensionApi = ^Fts5ExtensionApi;
  Pfts5_tokenizer = ^fts5_tokenizer;
  Pfts5_api = ^fts5_api;
  Psqlite3_api_routines = ^sqlite3_api_routines;

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

  cerr_callback = procedure(const text: PUTF8Char; user_data: Pointer); cdecl;
  Psqlite3 = Pointer;
  PPsqlite3 = ^Psqlite3;
  sqlite_int64 = Int64;
  sqlite_uint64 = UInt64;
  sqlite3_int64 = sqlite_int64;
  Psqlite3_int64 = ^sqlite3_int64;
  sqlite3_uint64 = sqlite_uint64;

  sqlite3_callback = function(p1: Pointer; p2: Integer; p3: PPUTF8Char; p4: PPUTF8Char): Integer; cdecl;

  sqlite3_file = record
    pMethods: Psqlite3_io_methods;
  end;

  sqlite3_io_methods = record
    iVersion: Integer;
    xClose: function(p1: Psqlite3_file): Integer; cdecl;
    xRead: function(p1: Psqlite3_file; p2: Pointer; iAmt: Integer; iOfst: sqlite3_int64): Integer; cdecl;
    xWrite: function(p1: Psqlite3_file; const p2: Pointer; iAmt: Integer; iOfst: sqlite3_int64): Integer; cdecl;
    xTruncate: function(p1: Psqlite3_file; size: sqlite3_int64): Integer; cdecl;
    xSync: function(p1: Psqlite3_file; flags: Integer): Integer; cdecl;
    xFileSize: function(p1: Psqlite3_file; pSize: Psqlite3_int64): Integer; cdecl;
    xLock: function(p1: Psqlite3_file; p2: Integer): Integer; cdecl;
    xUnlock: function(p1: Psqlite3_file; p2: Integer): Integer; cdecl;
    xCheckReservedLock: function(p1: Psqlite3_file; pResOut: PInteger): Integer; cdecl;
    xFileControl: function(p1: Psqlite3_file; op: Integer; pArg: Pointer): Integer; cdecl;
    xSectorSize: function(p1: Psqlite3_file): Integer; cdecl;
    xDeviceCharacteristics: function(p1: Psqlite3_file): Integer; cdecl;
    xShmMap: function(p1: Psqlite3_file; iPg: Integer; pgsz: Integer; p4: Integer; p5: PPointer): Integer; cdecl;
    xShmLock: function(p1: Psqlite3_file; offset: Integer; n: Integer; flags: Integer): Integer; cdecl;
    xShmBarrier: procedure(p1: Psqlite3_file); cdecl;
    xShmUnmap: function(p1: Psqlite3_file; deleteFlag: Integer): Integer; cdecl;
    xFetch: function(p1: Psqlite3_file; iOfst: sqlite3_int64; iAmt: Integer; pp: PPointer): Integer; cdecl;
    xUnfetch: function(p1: Psqlite3_file; iOfst: sqlite3_int64; p: Pointer): Integer; cdecl;
  end;

  Psqlite3_mutex = Pointer;
  PPsqlite3_mutex = ^Psqlite3_mutex;
  sqlite3_filename = PUTF8Char;

  sqlite3_syscall_ptr = procedure(); cdecl;

  Pvoid = Pointer;
  sqlite3_vfs = record
    iVersion: Integer;
    szOsFile: Integer;
    mxPathname: Integer;
    pNext: Psqlite3_vfs;
    zName: PUTF8Char;
    pAppData: Pointer;
    xOpen: function(p1: Psqlite3_vfs; zName: sqlite3_filename; p3: Psqlite3_file; flags: Integer; pOutFlags: PInteger): Integer; cdecl;
    xDelete: function(p1: Psqlite3_vfs; const zName: PUTF8Char; syncDir: Integer): Integer; cdecl;
    xAccess: function(p1: Psqlite3_vfs; const zName: PUTF8Char; flags: Integer; pResOut: PInteger): Integer; cdecl;
    xFullPathname: function(p1: Psqlite3_vfs; const zName: PUTF8Char; nOut: Integer; zOut: PUTF8Char): Integer; cdecl;
    xDlOpen: function(p1: Psqlite3_vfs; const zFilename: PUTF8Char): Pointer; cdecl;
    xDlError: procedure(p1: Psqlite3_vfs; nByte: Integer; zErrMsg: PUTF8Char); cdecl;
    xDlSym: function(p1: Psqlite3_vfs; p2: Pointer; const zSymbol: PUTF8Char): Pvoid; cdecl;
    xDlClose: procedure(p1: Psqlite3_vfs; p2: Pointer); cdecl;
    xRandomness: function(p1: Psqlite3_vfs; nByte: Integer; zOut: PUTF8Char): Integer; cdecl;
    xSleep: function(p1: Psqlite3_vfs; microseconds: Integer): Integer; cdecl;
    xCurrentTime: function(p1: Psqlite3_vfs; p2: PDouble): Integer; cdecl;
    xGetLastError: function(p1: Psqlite3_vfs; p2: Integer; p3: PUTF8Char): Integer; cdecl;
    xCurrentTimeInt64: function(p1: Psqlite3_vfs; p2: Psqlite3_int64): Integer; cdecl;
    xSetSystemCall: function(p1: Psqlite3_vfs; const zName: PUTF8Char; p3: sqlite3_syscall_ptr): Integer; cdecl;
    xGetSystemCall: function(p1: Psqlite3_vfs; const zName: PUTF8Char): sqlite3_syscall_ptr; cdecl;
    xNextSystemCall: function(p1: Psqlite3_vfs; const zName: PUTF8Char): PUTF8Char; cdecl;
  end;

  sqlite3_mem_methods = record
    xMalloc: function(p1: Integer): Pointer; cdecl;
    xFree: procedure(p1: Pointer); cdecl;
    xRealloc: function(p1: Pointer; p2: Integer): Pointer; cdecl;
    xSize: function(p1: Pointer): Integer; cdecl;
    xRoundup: function(p1: Integer): Integer; cdecl;
    xInit: function(p1: Pointer): Integer; cdecl;
    xShutdown: procedure(p1: Pointer); cdecl;
    pAppData: Pointer;
  end;

  Psqlite3_stmt = Pointer;
  PPsqlite3_stmt = ^Psqlite3_stmt;
  Psqlite3_value = Pointer;
  PPsqlite3_value = ^Psqlite3_value;
  Psqlite3_context = Pointer;
  PPsqlite3_context = ^Psqlite3_context;

  sqlite3_destructor_type = procedure(p1: Pointer); cdecl;

  PPvoid = ^Pvoid;
  TpxFunc = procedure(pCtx: Psqlite3_context; n: Integer; apVal: PPsqlite3_value);
  sqlite3_module = record
    iVersion: Integer;
    xCreate: function(p1: Psqlite3; pAux: Pointer; argc: Integer; const argv: PPUTF8Char; ppVTab: PPsqlite3_vtab; p6: PPUTF8Char): Integer; cdecl;
    xConnect: function(p1: Psqlite3; pAux: Pointer; argc: Integer; const argv: PPUTF8Char; ppVTab: PPsqlite3_vtab; p6: PPUTF8Char): Integer; cdecl;
    xBestIndex: function(pVTab: Psqlite3_vtab; p2: Psqlite3_index_info): Integer; cdecl;
    xDisconnect: function(pVTab: Psqlite3_vtab): Integer; cdecl;
    xDestroy: function(pVTab: Psqlite3_vtab): Integer; cdecl;
    xOpen: function(pVTab: Psqlite3_vtab; ppCursor: PPsqlite3_vtab_cursor): Integer; cdecl;
    xClose: function(p1: Psqlite3_vtab_cursor): Integer; cdecl;
    xFilter: function(p1: Psqlite3_vtab_cursor; idxNum: Integer; const idxStr: PUTF8Char; argc: Integer; argv: PPsqlite3_value): Integer; cdecl;
    xNext: function(p1: Psqlite3_vtab_cursor): Integer; cdecl;
    xEof: function(p1: Psqlite3_vtab_cursor): Integer; cdecl;
    xColumn: function(p1: Psqlite3_vtab_cursor; p2: Psqlite3_context; p3: Integer): Integer; cdecl;
    xRowid: function(p1: Psqlite3_vtab_cursor; pRowid: Psqlite3_int64): Integer; cdecl;
    xUpdate: function(p1: Psqlite3_vtab; p2: Integer; p3: PPsqlite3_value; p4: Psqlite3_int64): Integer; cdecl;
    xBegin: function(pVTab: Psqlite3_vtab): Integer; cdecl;
    xSync: function(pVTab: Psqlite3_vtab): Integer; cdecl;
    xCommit: function(pVTab: Psqlite3_vtab): Integer; cdecl;
    xRollback: function(pVTab: Psqlite3_vtab): Integer; cdecl;
    xFindFunction: function(pVtab: Psqlite3_vtab; nArg: Integer; zName: PAnsiChar; var pxFunc: TpxFunc; var ppArg: Pointer): Integer; cdecl;
    xRename: function(pVtab: Psqlite3_vtab; const zNew: PUTF8Char): Integer; cdecl;
    xSavepoint: function(pVTab: Psqlite3_vtab; p2: Integer): Integer; cdecl;
    xRelease: function(pVTab: Psqlite3_vtab; p2: Integer): Integer; cdecl;
    xRollbackTo: function(pVTab: Psqlite3_vtab; p2: Integer): Integer; cdecl;
    xShadowName: function(const p1: PUTF8Char): Integer; cdecl;
    xIntegrity: function(pVTab: Psqlite3_vtab; const zSchema: PUTF8Char; const zTabName: PUTF8Char; mFlags: Integer; pzErr: PPUTF8Char): Integer; cdecl;
  end;

  sqlite3_index_constraint = record
    iColumn: Integer;
    op: Byte;
    usable: Byte;
    iTermOffset: Integer;
  end;

  sqlite3_index_orderby = record
    iColumn: Integer;
    desc: Byte;
  end;

  sqlite3_index_constraint_usage = record
    argvIndex: Integer;
    omit: Byte;
  end;

  sqlite3_index_info = record
    nConstraint: Integer;
    aConstraint: Psqlite3_index_constraint;
    nOrderBy: Integer;
    aOrderBy: Psqlite3_index_orderby;
    aConstraintUsage: Psqlite3_index_constraint_usage;
    idxNum: Integer;
    idxStr: PUTF8Char;
    needToFreeIdxStr: Integer;
    orderByConsumed: Integer;
    estimatedCost: Double;
    estimatedRows: sqlite3_int64;
    idxFlags: Integer;
    colUsed: sqlite3_uint64;
  end;

  sqlite3_vtab = record
    pModule: Psqlite3_module;
    nRef: Integer;
    zErrMsg: PUTF8Char;
  end;

  sqlite3_vtab_cursor = record
    pVtab: Psqlite3_vtab;
  end;

  Psqlite3_blob = Pointer;
  PPsqlite3_blob = ^Psqlite3_blob;

  sqlite3_mutex_methods = record
    xMutexInit: function(): Integer; cdecl;
    xMutexEnd: function(): Integer; cdecl;
    xMutexAlloc: function(p1: Integer): Psqlite3_mutex; cdecl;
    xMutexFree: procedure(p1: Psqlite3_mutex); cdecl;
    xMutexEnter: procedure(p1: Psqlite3_mutex); cdecl;
    xMutexTry: function(p1: Psqlite3_mutex): Integer; cdecl;
    xMutexLeave: procedure(p1: Psqlite3_mutex); cdecl;
    xMutexHeld: function(p1: Psqlite3_mutex): Integer; cdecl;
    xMutexNotheld: function(p1: Psqlite3_mutex): Integer; cdecl;
  end;

  Psqlite3_str = Pointer;
  PPsqlite3_str = ^Psqlite3_str;
  Psqlite3_pcache = Pointer;
  PPsqlite3_pcache = ^Psqlite3_pcache;

  sqlite3_pcache_page = record
    pBuf: Pointer;
    pExtra: Pointer;
  end;

  sqlite3_pcache_methods2 = record
    iVersion: Integer;
    pArg: Pointer;
    xInit: function(p1: Pointer): Integer; cdecl;
    xShutdown: procedure(p1: Pointer); cdecl;
    xCreate: function(szPage: Integer; szExtra: Integer; bPurgeable: Integer): Psqlite3_pcache; cdecl;
    xCachesize: procedure(p1: Psqlite3_pcache; nCachesize: Integer); cdecl;
    xPagecount: function(p1: Psqlite3_pcache): Integer; cdecl;
    xFetch: function(p1: Psqlite3_pcache; key: Cardinal; createFlag: Integer): Psqlite3_pcache_page; cdecl;
    xUnpin: procedure(p1: Psqlite3_pcache; p2: Psqlite3_pcache_page; discard: Integer); cdecl;
    xRekey: procedure(p1: Psqlite3_pcache; p2: Psqlite3_pcache_page; oldKey: Cardinal; newKey: Cardinal); cdecl;
    xTruncate: procedure(p1: Psqlite3_pcache; iLimit: Cardinal); cdecl;
    xDestroy: procedure(p1: Psqlite3_pcache); cdecl;
    xShrink: procedure(p1: Psqlite3_pcache); cdecl;
  end;

  sqlite3_pcache_methods = record
    pArg: Pointer;
    xInit: function(p1: Pointer): Integer; cdecl;
    xShutdown: procedure(p1: Pointer); cdecl;
    xCreate: function(szPage: Integer; bPurgeable: Integer): Psqlite3_pcache; cdecl;
    xCachesize: procedure(p1: Psqlite3_pcache; nCachesize: Integer); cdecl;
    xPagecount: function(p1: Psqlite3_pcache): Integer; cdecl;
    xFetch: function(p1: Psqlite3_pcache; key: Cardinal; createFlag: Integer): Pointer; cdecl;
    xUnpin: procedure(p1: Psqlite3_pcache; p2: Pointer; discard: Integer); cdecl;
    xRekey: procedure(p1: Psqlite3_pcache; p2: Pointer; oldKey: Cardinal; newKey: Cardinal); cdecl;
    xTruncate: procedure(p1: Psqlite3_pcache; iLimit: Cardinal); cdecl;
    xDestroy: procedure(p1: Psqlite3_pcache); cdecl;
  end;

  Psqlite3_backup = Pointer;
  PPsqlite3_backup = ^Psqlite3_backup;

  sqlite3_snapshot = record
    hidden: array [0..47] of Byte;
  end;

  sqlite3_rtree_dbl = Double;
  Psqlite3_rtree_dbl = ^sqlite3_rtree_dbl;

  sqlite3_rtree_geometry = record
    pContext: Pointer;
    nParam: Integer;
    aParam: Psqlite3_rtree_dbl;
    pUser: Pointer;
    xDelUser: procedure(p1: Pointer); cdecl;
  end;

  sqlite3_rtree_query_info = record
    pContext: Pointer;
    nParam: Integer;
    aParam: Psqlite3_rtree_dbl;
    pUser: Pointer;
    xDelUser: procedure(p1: Pointer); cdecl;
    aCoord: Psqlite3_rtree_dbl;
    anQueue: PCardinal;
    nCoord: Integer;
    iLevel: Integer;
    mxLevel: Integer;
    iRowid: sqlite3_int64;
    rParentScore: sqlite3_rtree_dbl;
    eParentWithin: Integer;
    eWithin: Integer;
    rScore: sqlite3_rtree_dbl;
    apSqlParam: PPsqlite3_value;
  end;

  PFts5Context = Pointer;
  PPFts5Context = ^PFts5Context;

  fts5_extension_function = procedure(const pApi: PFts5ExtensionApi; pFts: PFts5Context; pCtx: Psqlite3_context; nVal: Integer; apVal: PPsqlite3_value); cdecl;

  Fts5PhraseIter = record
    a: PByte;
    b: PByte;
  end;

  Fts5ExtensionApi = record
    iVersion: Integer;
    xUserData: function(p1: PFts5Context): Pointer; cdecl;
    xColumnCount: function(p1: PFts5Context): Integer; cdecl;
    xRowCount: function(p1: PFts5Context; pnRow: Psqlite3_int64): Integer; cdecl;
    xColumnTotalSize: function(p1: PFts5Context; iCol: Integer; pnToken: Psqlite3_int64): Integer; cdecl;
    xTokenize: function(p1: PFts5Context; const pText: PUTF8Char; nText: Integer; pCtx: Pointer; xToken: Pointer): Integer; cdecl;
    xPhraseCount: function(p1: PFts5Context): Integer; cdecl;
    xPhraseSize: function(p1: PFts5Context; iPhrase: Integer): Integer; cdecl;
    xInstCount: function(p1: PFts5Context; pnInst: PInteger): Integer; cdecl;
    xInst: function(p1: PFts5Context; iIdx: Integer; piPhrase: PInteger; piCol: PInteger; piOff: PInteger): Integer; cdecl;
    xRowid: function(p1: PFts5Context): sqlite3_int64; cdecl;
    xColumnText: function(p1: PFts5Context; iCol: Integer; pz: PPUTF8Char; pn: PInteger): Integer; cdecl;
    xColumnSize: function(p1: PFts5Context; iCol: Integer; pnToken: PInteger): Integer; cdecl;
    xQueryPhrase: function(p1: PFts5Context; iPhrase: Integer; pUserData: Pointer; p4: Pointer): Integer; cdecl;
    xSetAuxdata: function(p1: PFts5Context; pAux: Pointer; xDelete: Pointer): Integer; cdecl;
    xGetAuxdata: function(p1: PFts5Context; bClear: Integer): Pointer; cdecl;
    xPhraseFirst: function(p1: PFts5Context; iPhrase: Integer; p3: PFts5PhraseIter; p4: PInteger; p5: PInteger): Integer; cdecl;
    xPhraseNext: procedure(p1: PFts5Context; p2: PFts5PhraseIter; piCol: PInteger; piOff: PInteger); cdecl;
    xPhraseFirstColumn: function(p1: PFts5Context; iPhrase: Integer; p3: PFts5PhraseIter; p4: PInteger): Integer; cdecl;
    xPhraseNextColumn: procedure(p1: PFts5Context; p2: PFts5PhraseIter; piCol: PInteger); cdecl;
    xQueryToken: function(p1: PFts5Context; iPhrase: Integer; iToken: Integer; ppToken: PPUTF8Char; pnToken: PInteger): Integer; cdecl;
    xInstToken: function(p1: PFts5Context; iIdx: Integer; iToken: Integer; p4: PPUTF8Char; p5: PInteger): Integer; cdecl;
  end;

  PFts5Tokenizer = Pointer;
  PPFts5Tokenizer = ^PFts5Tokenizer;

  fts5_tokenizer = record
    xCreate: function(p1: Pointer; azArg: PPUTF8Char; nArg: Integer; ppOut: PPFts5Tokenizer): Integer; cdecl;
    xDelete: procedure(p1: PFts5Tokenizer); cdecl;
    xTokenize: function(p1: PFts5Tokenizer; pCtx: Pointer; flags: Integer; const pText: PUTF8Char; nText: Integer; xToken: Pointer): Integer; cdecl;
  end;

  fts5_api = record
    iVersion: Integer;
    xCreateTokenizer: function(pApi: Pfts5_api; const zName: PUTF8Char; pUserData: Pointer; pTokenizer: Pfts5_tokenizer; xDestroy: Pointer): Integer; cdecl;
    xFindTokenizer: function(pApi: Pfts5_api; const zName: PUTF8Char; ppUserData: PPointer; pTokenizer: Pfts5_tokenizer): Integer; cdecl;
    xCreateFunction: function(pApi: Pfts5_api; const zName: PUTF8Char; pUserData: Pointer; xFunction: fts5_extension_function; xDestroy: Pointer): Integer; cdecl;
  end;

  sqlite3_api_routines = record
    aggregate_context: function(p1: Psqlite3_context; nBytes: Integer): Pointer; cdecl;
    aggregate_count: function(p1: Psqlite3_context): Integer; cdecl;
    bind_blob: function(p1: Psqlite3_stmt; p2: Integer; const p3: Pointer; n: Integer; p5: Pointer): Integer; cdecl;
    bind_double: function(p1: Psqlite3_stmt; p2: Integer; p3: Double): Integer; cdecl;
    bind_int: function(p1: Psqlite3_stmt; p2: Integer; p3: Integer): Integer; cdecl;
    bind_int64: function(p1: Psqlite3_stmt; p2: Integer; p3: sqlite_int64): Integer; cdecl;
    bind_null: function(p1: Psqlite3_stmt; p2: Integer): Integer; cdecl;
    bind_parameter_count: function(p1: Psqlite3_stmt): Integer; cdecl;
    bind_parameter_index: function(p1: Psqlite3_stmt; const zName: PUTF8Char): Integer; cdecl;
    bind_parameter_name: function(p1: Psqlite3_stmt; p2: Integer): PUTF8Char; cdecl;
    bind_text: function(p1: Psqlite3_stmt; p2: Integer; const p3: PUTF8Char; n: Integer; p5: Pointer): Integer; cdecl;
    bind_text16: function(p1: Psqlite3_stmt; p2: Integer; const p3: Pointer; p4: Integer; p5: Pointer): Integer; cdecl;
    bind_value: function(p1: Psqlite3_stmt; p2: Integer; const p3: Psqlite3_value): Integer; cdecl;
    busy_handler: function(p1: Psqlite3; p2: Pointer; p3: Pointer): Integer; cdecl;
    busy_timeout: function(p1: Psqlite3; ms: Integer): Integer; cdecl;
    changes: function(p1: Psqlite3): Integer; cdecl;
    close: function(p1: Psqlite3): Integer; cdecl;
    collation_needed: function(p1: Psqlite3; p2: Pointer; p3: Pointer): Integer; cdecl;
    collation_needed16: function(p1: Psqlite3; p2: Pointer; p3: Pointer): Integer; cdecl;
    column_blob: function(p1: Psqlite3_stmt; iCol: Integer): Pointer; cdecl;
    column_bytes: function(p1: Psqlite3_stmt; iCol: Integer): Integer; cdecl;
    column_bytes16: function(p1: Psqlite3_stmt; iCol: Integer): Integer; cdecl;
    column_count: function(pStmt: Psqlite3_stmt): Integer; cdecl;
    column_database_name: function(p1: Psqlite3_stmt; p2: Integer): PUTF8Char; cdecl;
    column_database_name16: function(p1: Psqlite3_stmt; p2: Integer): Pointer; cdecl;
    column_decltype: function(p1: Psqlite3_stmt; i: Integer): PUTF8Char; cdecl;
    column_decltype16: function(p1: Psqlite3_stmt; p2: Integer): Pointer; cdecl;
    column_double: function(p1: Psqlite3_stmt; iCol: Integer): Double; cdecl;
    column_int: function(p1: Psqlite3_stmt; iCol: Integer): Integer; cdecl;
    column_int64: function(p1: Psqlite3_stmt; iCol: Integer): sqlite_int64; cdecl;
    column_name: function(p1: Psqlite3_stmt; p2: Integer): PUTF8Char; cdecl;
    column_name16: function(p1: Psqlite3_stmt; p2: Integer): Pointer; cdecl;
    column_origin_name: function(p1: Psqlite3_stmt; p2: Integer): PUTF8Char; cdecl;
    column_origin_name16: function(p1: Psqlite3_stmt; p2: Integer): Pointer; cdecl;
    column_table_name: function(p1: Psqlite3_stmt; p2: Integer): PUTF8Char; cdecl;
    column_table_name16: function(p1: Psqlite3_stmt; p2: Integer): Pointer; cdecl;
    column_text: function(p1: Psqlite3_stmt; iCol: Integer): PByte; cdecl;
    column_text16: function(p1: Psqlite3_stmt; iCol: Integer): Pointer; cdecl;
    column_type: function(p1: Psqlite3_stmt; iCol: Integer): Integer; cdecl;
    column_value: function(p1: Psqlite3_stmt; iCol: Integer): Psqlite3_value; cdecl;
    commit_hook: function(p1: Psqlite3; p2: Pointer; p3: Pointer): Pointer; cdecl;
    complete: function(const sql: PUTF8Char): Integer; cdecl;
    complete16: function(const sql: Pointer): Integer; cdecl;
    create_collation: function(p1: Psqlite3; const p2: PUTF8Char; p3: Integer; p4: Pointer; p5: Pointer): Integer; cdecl;
    create_collation16: function(p1: Psqlite3; const p2: Pointer; p3: Integer; p4: Pointer; p5: Pointer): Integer; cdecl;
    create_function: function(p1: Psqlite3; const p2: PUTF8Char; p3: Integer; p4: Integer; p5: Pointer; xFunc: Pointer; xStep: Pointer; xFinal: Pointer): Integer; cdecl;
    create_function16: function(p1: Psqlite3; const p2: Pointer; p3: Integer; p4: Integer; p5: Pointer; xFunc: Pointer; xStep: Pointer; xFinal: Pointer): Integer; cdecl;
    create_module: function(p1: Psqlite3; const p2: PUTF8Char; const p3: Psqlite3_module; p4: Pointer): Integer; cdecl;
    data_count: function(pStmt: Psqlite3_stmt): Integer; cdecl;
    db_handle: function(p1: Psqlite3_stmt): Psqlite3; cdecl;
    declare_vtab: function(p1: Psqlite3; const p2: PUTF8Char): Integer; cdecl;
    enable_shared_cache: function(p1: Integer): Integer; cdecl;
    errcode: function(db: Psqlite3): Integer; cdecl;
    errmsg: function(p1: Psqlite3): PUTF8Char; cdecl;
    errmsg16: function(p1: Psqlite3): Pointer; cdecl;
    exec: function(p1: Psqlite3; const p2: PUTF8Char; p3: sqlite3_callback; p4: Pointer; p5: PPUTF8Char): Integer; cdecl;
    expired: function(p1: Psqlite3_stmt): Integer; cdecl;
    finalize: function(pStmt: Psqlite3_stmt): Integer; cdecl;
    free: procedure(p1: Pointer); cdecl;
    free_table: procedure(result: PPUTF8Char); cdecl;
    get_autocommit: function(p1: Psqlite3): Integer; cdecl;
    get_auxdata: function(p1: Psqlite3_context; p2: Integer): Pointer; cdecl;
    get_table: function(p1: Psqlite3; const p2: PUTF8Char; p3: PPPUTF8Char; p4: PInteger; p5: PInteger; p6: PPUTF8Char): Integer; cdecl;
    global_recover: function(): Integer; cdecl;
    interruptx: procedure(p1: Psqlite3); cdecl;
    last_insert_rowid: function(p1: Psqlite3): sqlite_int64; cdecl;
    libversion: function(): PUTF8Char; cdecl;
    libversion_number: function(): Integer; cdecl;
    malloc: function(p1: Integer): Pointer; cdecl;
    mprintf: function(const p1: PUTF8Char): PUTF8Char varargs; cdecl;
    open: function(const p1: PUTF8Char; p2: PPsqlite3): Integer; cdecl;
    open16: function(const p1: Pointer; p2: PPsqlite3): Integer; cdecl;
    prepare: function(p1: Psqlite3; const p2: PUTF8Char; p3: Integer; p4: PPsqlite3_stmt; p5: PPUTF8Char): Integer; cdecl;
    prepare16: function(p1: Psqlite3; const p2: Pointer; p3: Integer; p4: PPsqlite3_stmt; p5: PPointer): Integer; cdecl;
    profile: function(p1: Psqlite3; p2: Pointer; p3: Pointer): Pointer; cdecl;
    progress_handler: procedure(p1: Psqlite3; p2: Integer; p3: Pointer; p4: Pointer); cdecl;
    realloc: function(p1: Pointer; p2: Integer): Pointer; cdecl;
    reset: function(pStmt: Psqlite3_stmt): Integer; cdecl;
    result_blob: procedure(p1: Psqlite3_context; const p2: Pointer; p3: Integer; p4: Pointer); cdecl;
    result_double: procedure(p1: Psqlite3_context; p2: Double); cdecl;
    result_error: procedure(p1: Psqlite3_context; const p2: PUTF8Char; p3: Integer); cdecl;
    result_error16: procedure(p1: Psqlite3_context; const p2: Pointer; p3: Integer); cdecl;
    result_int: procedure(p1: Psqlite3_context; p2: Integer); cdecl;
    result_int64: procedure(p1: Psqlite3_context; p2: sqlite_int64); cdecl;
    result_null: procedure(p1: Psqlite3_context); cdecl;
    result_text: procedure(p1: Psqlite3_context; const p2: PUTF8Char; p3: Integer; p4: Pointer); cdecl;
    result_text16: procedure(p1: Psqlite3_context; const p2: Pointer; p3: Integer; p4: Pointer); cdecl;
    result_text16be: procedure(p1: Psqlite3_context; const p2: Pointer; p3: Integer; p4: Pointer); cdecl;
    result_text16le: procedure(p1: Psqlite3_context; const p2: Pointer; p3: Integer; p4: Pointer); cdecl;
    result_value: procedure(p1: Psqlite3_context; p2: Psqlite3_value); cdecl;
    rollback_hook: function(p1: Psqlite3; p2: Pointer; p3: Pointer): Pointer; cdecl;
    set_authorizer: function(p1: Psqlite3; p2: Pointer; p3: Pointer): Integer; cdecl;
    set_auxdata: procedure(p1: Psqlite3_context; p2: Integer; p3: Pointer; p4: Pointer); cdecl;
    xsnprintf: function(p1: Integer; p2: PUTF8Char; const p3: PUTF8Char): PUTF8Char varargs; cdecl;
    step: function(p1: Psqlite3_stmt): Integer; cdecl;
    table_column_metadata: function(p1: Psqlite3; const p2: PUTF8Char; const p3: PUTF8Char; const p4: PUTF8Char; p5: PPUTF8Char; p6: PPUTF8Char; p7: PInteger; p8: PInteger; p9: PInteger): Integer; cdecl;
    thread_cleanup: procedure(); cdecl;
    total_changes: function(p1: Psqlite3): Integer; cdecl;
    trace: function(p1: Psqlite3; xTrace: Pointer; p3: Pointer): Pointer; cdecl;
    transfer_bindings: function(p1: Psqlite3_stmt; p2: Psqlite3_stmt): Integer; cdecl;
    update_hook: function(p1: Psqlite3; p2: Pointer; p3: Pointer): Pointer; cdecl;
    user_data: function(p1: Psqlite3_context): Pointer; cdecl;
    value_blob: function(p1: Psqlite3_value): Pointer; cdecl;
    value_bytes: function(p1: Psqlite3_value): Integer; cdecl;
    value_bytes16: function(p1: Psqlite3_value): Integer; cdecl;
    value_double: function(p1: Psqlite3_value): Double; cdecl;
    value_int: function(p1: Psqlite3_value): Integer; cdecl;
    value_int64: function(p1: Psqlite3_value): sqlite_int64; cdecl;
    value_numeric_type: function(p1: Psqlite3_value): Integer; cdecl;
    value_text: function(p1: Psqlite3_value): PByte; cdecl;
    value_text16: function(p1: Psqlite3_value): Pointer; cdecl;
    value_text16be: function(p1: Psqlite3_value): Pointer; cdecl;
    value_text16le: function(p1: Psqlite3_value): Pointer; cdecl;
    value_type: function(p1: Psqlite3_value): Integer; cdecl;
    vmprintf: function(const p1: PUTF8Char; p2: Pointer): PUTF8Char; cdecl;
    overload_function: function(p1: Psqlite3; const zFuncName: PUTF8Char; nArg: Integer): Integer; cdecl;
    prepare_v2: function(p1: Psqlite3; const p2: PUTF8Char; p3: Integer; p4: PPsqlite3_stmt; p5: PPUTF8Char): Integer; cdecl;
    prepare16_v2: function(p1: Psqlite3; const p2: Pointer; p3: Integer; p4: PPsqlite3_stmt; p5: PPointer): Integer; cdecl;
    clear_bindings: function(p1: Psqlite3_stmt): Integer; cdecl;
    create_module_v2: function(p1: Psqlite3; const p2: PUTF8Char; const p3: Psqlite3_module; p4: Pointer; xDestroy: Pointer): Integer; cdecl;
    bind_zeroblob: function(p1: Psqlite3_stmt; p2: Integer; p3: Integer): Integer; cdecl;
    blob_bytes: function(p1: Psqlite3_blob): Integer; cdecl;
    blob_close: function(p1: Psqlite3_blob): Integer; cdecl;
    blob_open: function(p1: Psqlite3; const p2: PUTF8Char; const p3: PUTF8Char; const p4: PUTF8Char; p5: sqlite3_int64; p6: Integer; p7: PPsqlite3_blob): Integer; cdecl;
    blob_read: function(p1: Psqlite3_blob; p2: Pointer; p3: Integer; p4: Integer): Integer; cdecl;
    blob_write: function(p1: Psqlite3_blob; const p2: Pointer; p3: Integer; p4: Integer): Integer; cdecl;
    create_collation_v2: function(p1: Psqlite3; const p2: PUTF8Char; p3: Integer; p4: Pointer; p5: Pointer; p6: Pointer): Integer; cdecl;
    file_control: function(p1: Psqlite3; const p2: PUTF8Char; p3: Integer; p4: Pointer): Integer; cdecl;
    memory_highwater: function(p1: Integer): sqlite3_int64; cdecl;
    memory_used: function(): sqlite3_int64; cdecl;
    mutex_alloc: function(p1: Integer): Psqlite3_mutex; cdecl;
    mutex_enter: procedure(p1: Psqlite3_mutex); cdecl;
    mutex_free: procedure(p1: Psqlite3_mutex); cdecl;
    mutex_leave: procedure(p1: Psqlite3_mutex); cdecl;
    mutex_try: function(p1: Psqlite3_mutex): Integer; cdecl;
    open_v2: function(const p1: PUTF8Char; p2: PPsqlite3; p3: Integer; const p4: PUTF8Char): Integer; cdecl;
    release_memory: function(p1: Integer): Integer; cdecl;
    result_error_nomem: procedure(p1: Psqlite3_context); cdecl;
    result_error_toobig: procedure(p1: Psqlite3_context); cdecl;
    sleep: function(p1: Integer): Integer; cdecl;
    soft_heap_limit: procedure(p1: Integer); cdecl;
    vfs_find: function(const p1: PUTF8Char): Psqlite3_vfs; cdecl;
    vfs_register: function(p1: Psqlite3_vfs; p2: Integer): Integer; cdecl;
    vfs_unregister: function(p1: Psqlite3_vfs): Integer; cdecl;
    xthreadsafe: function(): Integer; cdecl;
    result_zeroblob: procedure(p1: Psqlite3_context; p2: Integer); cdecl;
    result_error_code: procedure(p1: Psqlite3_context; p2: Integer); cdecl;
    test_control: function(p1: Integer): Integer varargs; cdecl;
    randomness: procedure(p1: Integer; p2: Pointer); cdecl;
    context_db_handle: function(p1: Psqlite3_context): Psqlite3; cdecl;
    extended_result_codes: function(p1: Psqlite3; p2: Integer): Integer; cdecl;
    limit: function(p1: Psqlite3; p2: Integer; p3: Integer): Integer; cdecl;
    next_stmt: function(p1: Psqlite3; p2: Psqlite3_stmt): Psqlite3_stmt; cdecl;
    sql: function(p1: Psqlite3_stmt): PUTF8Char; cdecl;
    status: function(p1: Integer; p2: PInteger; p3: PInteger; p4: Integer): Integer; cdecl;
    backup_finish: function(p1: Psqlite3_backup): Integer; cdecl;
    backup_init: function(p1: Psqlite3; const p2: PUTF8Char; p3: Psqlite3; const p4: PUTF8Char): Psqlite3_backup; cdecl;
    backup_pagecount: function(p1: Psqlite3_backup): Integer; cdecl;
    backup_remaining: function(p1: Psqlite3_backup): Integer; cdecl;
    backup_step: function(p1: Psqlite3_backup; p2: Integer): Integer; cdecl;
    compileoption_get: function(p1: Integer): PUTF8Char; cdecl;
    compileoption_used: function(const p1: PUTF8Char): Integer; cdecl;
    create_function_v2: function(p1: Psqlite3; const p2: PUTF8Char; p3: Integer; p4: Integer; p5: Pointer; xFunc: Pointer; xStep: Pointer; xFinal: Pointer; xDestroy: Pointer): Integer; cdecl;
    db_config: function(p1: Psqlite3; p2: Integer): Integer varargs; cdecl;
    db_mutex: function(p1: Psqlite3): Psqlite3_mutex; cdecl;
    db_status: function(p1: Psqlite3; p2: Integer; p3: PInteger; p4: PInteger; p5: Integer): Integer; cdecl;
    extended_errcode: function(p1: Psqlite3): Integer; cdecl;
    log: procedure(p1: Integer; const p2: PUTF8Char) varargs; cdecl;
    soft_heap_limit64: function(p1: sqlite3_int64): sqlite3_int64; cdecl;
    sourceid: function(): PUTF8Char; cdecl;
    stmt_status: function(p1: Psqlite3_stmt; p2: Integer; p3: Integer): Integer; cdecl;
    strnicmp: function(const p1: PUTF8Char; const p2: PUTF8Char; p3: Integer): Integer; cdecl;
    unlock_notify: function(p1: Psqlite3; p2: Pointer; p3: Pointer): Integer; cdecl;
    wal_autocheckpoint: function(p1: Psqlite3; p2: Integer): Integer; cdecl;
    wal_checkpoint: function(p1: Psqlite3; const p2: PUTF8Char): Integer; cdecl;
    wal_hook: function(p1: Psqlite3; p2: Pointer; p3: Pointer): Pointer; cdecl;
    blob_reopen: function(p1: Psqlite3_blob; p2: sqlite3_int64): Integer; cdecl;
    vtab_config: function(p1: Psqlite3; op: Integer): Integer varargs; cdecl;
    vtab_on_conflict: function(p1: Psqlite3): Integer; cdecl;
    close_v2: function(p1: Psqlite3): Integer; cdecl;
    db_filename: function(p1: Psqlite3; const p2: PUTF8Char): PUTF8Char; cdecl;
    db_readonly: function(p1: Psqlite3; const p2: PUTF8Char): Integer; cdecl;
    db_release_memory: function(p1: Psqlite3): Integer; cdecl;
    errstr: function(p1: Integer): PUTF8Char; cdecl;
    stmt_busy: function(p1: Psqlite3_stmt): Integer; cdecl;
    stmt_readonly: function(p1: Psqlite3_stmt): Integer; cdecl;
    stricmp: function(const p1: PUTF8Char; const p2: PUTF8Char): Integer; cdecl;
    uri_boolean: function(const p1: PUTF8Char; const p2: PUTF8Char; p3: Integer): Integer; cdecl;
    uri_int64: function(const p1: PUTF8Char; const p2: PUTF8Char; p3: sqlite3_int64): sqlite3_int64; cdecl;
    uri_parameter: function(const p1: PUTF8Char; const p2: PUTF8Char): PUTF8Char; cdecl;
    xvsnprintf: function(p1: Integer; p2: PUTF8Char; const p3: PUTF8Char; p4: Pointer): PUTF8Char; cdecl;
    wal_checkpoint_v2: function(p1: Psqlite3; const p2: PUTF8Char; p3: Integer; p4: PInteger; p5: PInteger): Integer; cdecl;
    auto_extension: function(p1: Pointer): Integer; cdecl;
    bind_blob64: function(p1: Psqlite3_stmt; p2: Integer; const p3: Pointer; p4: sqlite3_uint64; p5: Pointer): Integer; cdecl;
    bind_text64: function(p1: Psqlite3_stmt; p2: Integer; const p3: PUTF8Char; p4: sqlite3_uint64; p5: Pointer; p6: Byte): Integer; cdecl;
    cancel_auto_extension: function(p1: Pointer): Integer; cdecl;
    load_extension: function(p1: Psqlite3; const p2: PUTF8Char; const p3: PUTF8Char; p4: PPUTF8Char): Integer; cdecl;
    malloc64: function(p1: sqlite3_uint64): Pointer; cdecl;
    msize: function(p1: Pointer): sqlite3_uint64; cdecl;
    realloc64: function(p1: Pointer; p2: sqlite3_uint64): Pointer; cdecl;
    reset_auto_extension: procedure(); cdecl;
    result_blob64: procedure(p1: Psqlite3_context; const p2: Pointer; p3: sqlite3_uint64; p4: Pointer); cdecl;
    result_text64: procedure(p1: Psqlite3_context; const p2: PUTF8Char; p3: sqlite3_uint64; p4: Pointer; p5: Byte); cdecl;
    strglob: function(const p1: PUTF8Char; const p2: PUTF8Char): Integer; cdecl;
    value_dup: function(const p1: Psqlite3_value): Psqlite3_value; cdecl;
    value_free: procedure(p1: Psqlite3_value); cdecl;
    result_zeroblob64: function(p1: Psqlite3_context; p2: sqlite3_uint64): Integer; cdecl;
    bind_zeroblob64: function(p1: Psqlite3_stmt; p2: Integer; p3: sqlite3_uint64): Integer; cdecl;
    value_subtype: function(p1: Psqlite3_value): Cardinal; cdecl;
    result_subtype: procedure(p1: Psqlite3_context; p2: Cardinal); cdecl;
    status64: function(p1: Integer; p2: Psqlite3_int64; p3: Psqlite3_int64; p4: Integer): Integer; cdecl;
    strlike: function(const p1: PUTF8Char; const p2: PUTF8Char; p3: Cardinal): Integer; cdecl;
    db_cacheflush: function(p1: Psqlite3): Integer; cdecl;
    system_errno: function(p1: Psqlite3): Integer; cdecl;
    trace_v2: function(p1: Psqlite3; p2: Cardinal; p3: Pointer; p4: Pointer): Integer; cdecl;
    expanded_sql: function(p1: Psqlite3_stmt): PUTF8Char; cdecl;
    set_last_insert_rowid: procedure(p1: Psqlite3; p2: sqlite3_int64); cdecl;
    prepare_v3: function(p1: Psqlite3; const p2: PUTF8Char; p3: Integer; p4: Cardinal; p5: PPsqlite3_stmt; p6: PPUTF8Char): Integer; cdecl;
    prepare16_v3: function(p1: Psqlite3; const p2: Pointer; p3: Integer; p4: Cardinal; p5: PPsqlite3_stmt; p6: PPointer): Integer; cdecl;
    bind_pointer: function(p1: Psqlite3_stmt; p2: Integer; p3: Pointer; const p4: PUTF8Char; p5: Pointer): Integer; cdecl;
    result_pointer: procedure(p1: Psqlite3_context; p2: Pointer; const p3: PUTF8Char; p4: Pointer); cdecl;
    value_pointer: function(p1: Psqlite3_value; const p2: PUTF8Char): Pointer; cdecl;
    vtab_nochange: function(p1: Psqlite3_context): Integer; cdecl;
    value_nochange: function(p1: Psqlite3_value): Integer; cdecl;
    vtab_collation: function(p1: Psqlite3_index_info; p2: Integer): PUTF8Char; cdecl;
    keyword_count: function(): Integer; cdecl;
    keyword_name: function(p1: Integer; p2: PPUTF8Char; p3: PInteger): Integer; cdecl;
    keyword_check: function(const p1: PUTF8Char; p2: Integer): Integer; cdecl;
    str_new: function(p1: Psqlite3): Psqlite3_str; cdecl;
    str_finish: function(p1: Psqlite3_str): PUTF8Char; cdecl;
    str_appendf: procedure(p1: Psqlite3_str; const zFormat: PUTF8Char) varargs; cdecl;
    str_vappendf: procedure(p1: Psqlite3_str; const zFormat: PUTF8Char; p3: Pointer); cdecl;
    str_append: procedure(p1: Psqlite3_str; const zIn: PUTF8Char; N: Integer); cdecl;
    str_appendall: procedure(p1: Psqlite3_str; const zIn: PUTF8Char); cdecl;
    str_appendchar: procedure(p1: Psqlite3_str; N: Integer; C: UTF8Char); cdecl;
    str_reset: procedure(p1: Psqlite3_str); cdecl;
    str_errcode: function(p1: Psqlite3_str): Integer; cdecl;
    str_length: function(p1: Psqlite3_str): Integer; cdecl;
    str_value: function(p1: Psqlite3_str): PUTF8Char; cdecl;
    create_window_function: function(p1: Psqlite3; const p2: PUTF8Char; p3: Integer; p4: Integer; p5: Pointer; xStep: Pointer; xFinal: Pointer; xValue: Pointer; xInv: Pointer; xDestroy: Pointer): Integer; cdecl;
    normalized_sql: function(p1: Psqlite3_stmt): PUTF8Char; cdecl;
    stmt_isexplain: function(p1: Psqlite3_stmt): Integer; cdecl;
    value_frombind: function(p1: Psqlite3_value): Integer; cdecl;
    drop_modules: function(p1: Psqlite3; p2: PPUTF8Char): Integer; cdecl;
    hard_heap_limit64: function(p1: sqlite3_int64): sqlite3_int64; cdecl;
    uri_key: function(const p1: PUTF8Char; p2: Integer): PUTF8Char; cdecl;
    filename_database: function(const p1: PUTF8Char): PUTF8Char; cdecl;
    filename_journal: function(const p1: PUTF8Char): PUTF8Char; cdecl;
    filename_wal: function(const p1: PUTF8Char): PUTF8Char; cdecl;
    create_filename: function(const p1: PUTF8Char; const p2: PUTF8Char; const p3: PUTF8Char; p4: Integer; p5: PPUTF8Char): PUTF8Char; cdecl;
    free_filename: procedure(const p1: PUTF8Char); cdecl;
    database_file_object: function(const p1: PUTF8Char): Psqlite3_file; cdecl;
    txn_state: function(p1: Psqlite3; const p2: PUTF8Char): Integer; cdecl;
    changes64: function(p1: Psqlite3): sqlite3_int64; cdecl;
    total_changes64: function(p1: Psqlite3): sqlite3_int64; cdecl;
    autovacuum_pages: function(p1: Psqlite3; p2: Pointer; p3: Pointer; p4: Pointer): Integer; cdecl;
    error_offset: function(p1: Psqlite3): Integer; cdecl;
    vtab_rhs_value: function(p1: Psqlite3_index_info; p2: Integer; p3: PPsqlite3_value): Integer; cdecl;
    vtab_distinct: function(p1: Psqlite3_index_info): Integer; cdecl;
    vtab_in: function(p1: Psqlite3_index_info; p2: Integer; p3: Integer): Integer; cdecl;
    vtab_in_first: function(p1: Psqlite3_value; p2: PPsqlite3_value): Integer; cdecl;
    vtab_in_next: function(p1: Psqlite3_value; p2: PPsqlite3_value): Integer; cdecl;
    deserialize: function(p1: Psqlite3; const p2: PUTF8Char; p3: PByte; p4: sqlite3_int64; p5: sqlite3_int64; p6: Cardinal): Integer; cdecl;
    serialize: function(p1: Psqlite3; const p2: PUTF8Char; p3: Psqlite3_int64; p4: Cardinal): PByte; cdecl;
    db_name: function(p1: Psqlite3; p2: Integer): PUTF8Char; cdecl;
    value_encoding: function(p1: Psqlite3_value): Integer; cdecl;
    is_interrupted: function(p1: Psqlite3): Integer; cdecl;
    stmt_explain: function(p1: Psqlite3_stmt; p2: Integer): Integer; cdecl;
    get_clientdata: function(p1: Psqlite3; const p2: PUTF8Char): Pointer; cdecl;
    set_clientdata: function(p1: Psqlite3; const p2: PUTF8Char; p3: Pointer; p4: Pointer): Integer; cdecl;
  end;

  sqlite3_loadext_entry = function(db: Psqlite3; pzErrMsg: PPUTF8Char; const pThunk: Psqlite3_api_routines): Integer; cdecl;

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

function ggml_is_contiguous(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_contiguous';

function ggml_is_contiguous_0(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_contiguous_0';

function ggml_is_contiguous_1(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_contiguous_1';

function ggml_is_contiguous_2(const tensor: Pggml_tensor): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_is_contiguous_2';

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

function ggml_concat(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; dim: Integer): Pggml_tensor; cdecl;
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

function ggml_rope(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; n_dims: Integer; mode: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope';

function ggml_rope_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; n_dims: Integer; mode: Integer): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_inplace';

function ggml_rope_ext(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx_orig: Integer; freq_base: Single; freq_scale: Single; ext_factor: Single; attn_factor: Single; beta_fast: Single; beta_slow: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_ext';

function ggml_rope_ext_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx_orig: Integer; freq_base: Single; freq_scale: Single; ext_factor: Single; attn_factor: Single; beta_fast: Single; beta_slow: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_ext_inplace';

function ggml_rope_custom(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx_orig: Integer; freq_base: Single; freq_scale: Single; ext_factor: Single; attn_factor: Single; beta_fast: Single; beta_slow: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_custom';

function ggml_rope_custom_inplace(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx_orig: Integer; freq_base: Single; freq_scale: Single; ext_factor: Single; attn_factor: Single; beta_fast: Single; beta_slow: Single): Pggml_tensor; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_custom_inplace';

procedure ggml_rope_yarn_corr_dims(n_dims: Integer; n_ctx_orig: Integer; freq_base: Single; beta_fast: Single; beta_slow: Single; dims: PSingle); cdecl;
  external LMENGINE_DLL name _PU + 'ggml_rope_yarn_corr_dims';

function ggml_rope_back(ctx: Pggml_context; a: Pggml_tensor; b: Pggml_tensor; c: Pggml_tensor; n_dims: Integer; mode: Integer; n_ctx_orig: Integer; freq_base: Single; freq_scale: Single; ext_factor: Single; attn_factor: Single; beta_fast: Single; beta_slow: Single): Pggml_tensor; cdecl;
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

function ggml_cpu_has_sve(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_sve';

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

function ggml_cpu_has_rpc(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_cpu_has_rpc';

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

function ggml_backend_supports_buft(backend: ggml_backend_t; buft: ggml_backend_buffer_type_t): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'ggml_backend_supports_buft';

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

procedure ggml_backend_view_init(tensor: Pggml_tensor); cdecl;
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

function llama_token_get_attr(const model: Pllama_model; token: llama_token): llama_token_attr; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_get_attr';

function llama_token_is_eog(const model: Pllama_model; token: llama_token): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_is_eog';

function llama_token_is_control(const model: Pllama_model; token: llama_token): Boolean; cdecl;
  external LMENGINE_DLL name _PU + 'llama_token_is_control';

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

function sqlite3_libversion(): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_libversion';

function sqlite3_sourceid(): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_sourceid';

function sqlite3_libversion_number(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_libversion_number';

function sqlite3_compileoption_used(const zOptName: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_compileoption_used';

function sqlite3_compileoption_get(N: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_compileoption_get';

function sqlite3_threadsafe(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_threadsafe';

function sqlite3_close(p1: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_close';

function sqlite3_close_v2(p1: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_close_v2';

type
  sqlite3_exec_callback = function(p1: Pointer; p2: Integer; p3: PPUTF8Char; p4: PPUTF8Char): Integer; cdecl;

function sqlite3_exec(p1: Psqlite3; const sql: PUTF8Char; callback: sqlite3_exec_callback; p4: Pointer; errmsg: PPUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_exec';

function sqlite3_initialize(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_initialize';

function sqlite3_shutdown(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_shutdown';

function sqlite3_os_init(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_os_init';

function sqlite3_os_end(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_os_end';

function sqlite3_config(p1: Integer): Integer varargs; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_config';

function sqlite3_db_config(p1: Psqlite3; op: Integer): Integer varargs; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_db_config';

function sqlite3_extended_result_codes(p1: Psqlite3; onoff: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_extended_result_codes';

function sqlite3_last_insert_rowid(p1: Psqlite3): sqlite3_int64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_last_insert_rowid';

procedure sqlite3_set_last_insert_rowid(p1: Psqlite3; p2: sqlite3_int64); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_set_last_insert_rowid';

function sqlite3_changes(p1: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_changes';

function sqlite3_changes64(p1: Psqlite3): sqlite3_int64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_changes64';

function sqlite3_total_changes(p1: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_total_changes';

function sqlite3_total_changes64(p1: Psqlite3): sqlite3_int64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_total_changes64';

procedure sqlite3_interrupt(p1: Psqlite3); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_interrupt';

function sqlite3_is_interrupted(p1: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_is_interrupted';

function sqlite3_complete(const sql: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_complete';

function sqlite3_complete16(const sql: Pointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_complete16';

type
  sqlite3_busy_handler_ = function(p1: Pointer; p2: Integer): Integer; cdecl;

function sqlite3_busy_handler(p1: Psqlite3; p2: sqlite3_busy_handler_; p3: Pointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_busy_handler';

function sqlite3_busy_timeout(p1: Psqlite3; ms: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_busy_timeout';

function sqlite3_get_table(db: Psqlite3; const zSql: PUTF8Char; pazResult: PPPUTF8Char; pnRow: PInteger; pnColumn: PInteger; pzErrmsg: PPUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_get_table';

procedure sqlite3_free_table(result: PPUTF8Char); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_free_table';

function sqlite3_mprintf(const p1: PUTF8Char): PUTF8Char varargs; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_mprintf';

function sqlite3_vmprintf(const p1: PUTF8Char; p2: Pointer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vmprintf';

function sqlite3_snprintf(p1: Integer; p2: PUTF8Char; const p3: PUTF8Char): PUTF8Char varargs; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_snprintf';

function sqlite3_vsnprintf(p1: Integer; p2: PUTF8Char; const p3: PUTF8Char; p4: Pointer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vsnprintf';

function sqlite3_malloc(p1: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_malloc';

function sqlite3_malloc64(p1: sqlite3_uint64): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_malloc64';

function sqlite3_realloc(p1: Pointer; p2: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_realloc';

function sqlite3_realloc64(p1: Pointer; p2: sqlite3_uint64): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_realloc64';

procedure sqlite3_free(p1: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_free';

function sqlite3_msize(p1: Pointer): sqlite3_uint64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_msize';

function sqlite3_memory_used(): sqlite3_int64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_memory_used';

function sqlite3_memory_highwater(resetFlag: Integer): sqlite3_int64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_memory_highwater';

procedure sqlite3_randomness(N: Integer; P: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_randomness';

type
  sqlite3_set_authorizer_xAuth = function(p1: Pointer; p2: Integer; const p3: PUTF8Char; const p4: PUTF8Char; const p5: PUTF8Char; const p6: PUTF8Char): Integer; cdecl;

function sqlite3_set_authorizer(p1: Psqlite3; xAuth: sqlite3_set_authorizer_xAuth; pUserData: Pointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_set_authorizer';

type
  sqlite3_trace_xTrace = procedure(p1: Pointer; const p2: PUTF8Char); cdecl;

function sqlite3_trace(p1: Psqlite3; xTrace: sqlite3_trace_xTrace; p3: Pointer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_trace';

type
  sqlite3_profile_xProfile = procedure(p1: Pointer; const p2: PUTF8Char; p3: sqlite3_uint64); cdecl;

function sqlite3_profile(p1: Psqlite3; xProfile: sqlite3_profile_xProfile; p3: Pointer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_profile';

type
  sqlite3_trace_v2_xCallback = function(p1: Cardinal; p2: Pointer; p3: Pointer; p4: Pointer): Integer; cdecl;

function sqlite3_trace_v2(p1: Psqlite3; uMask: Cardinal; xCallback: sqlite3_trace_v2_xCallback; pCtx: Pointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_trace_v2';

type
  sqlite3_progress_handler_ = function(p1: Pointer): Integer; cdecl;

procedure sqlite3_progress_handler(p1: Psqlite3; p2: Integer; p3: sqlite3_progress_handler_; p4: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_progress_handler';

function sqlite3_open(const filename: PUTF8Char; ppDb: PPsqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_open';

function sqlite3_open16(const filename: Pointer; ppDb: PPsqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_open16';

function sqlite3_open_v2(const filename: PUTF8Char; ppDb: PPsqlite3; flags: Integer; const zVfs: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_open_v2';

function sqlite3_uri_parameter(z: sqlite3_filename; const zParam: PUTF8Char): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_uri_parameter';

function sqlite3_uri_boolean(z: sqlite3_filename; const zParam: PUTF8Char; bDefault: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_uri_boolean';

function sqlite3_uri_int64(p1: sqlite3_filename; const p2: PUTF8Char; p3: sqlite3_int64): sqlite3_int64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_uri_int64';

function sqlite3_uri_key(z: sqlite3_filename; N: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_uri_key';

function sqlite3_filename_database(p1: sqlite3_filename): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_filename_database';

function sqlite3_filename_journal(p1: sqlite3_filename): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_filename_journal';

function sqlite3_filename_wal(p1: sqlite3_filename): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_filename_wal';

function sqlite3_database_file_object(const p1: PUTF8Char): Psqlite3_file; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_database_file_object';

function sqlite3_create_filename(const zDatabase: PUTF8Char; const zJournal: PUTF8Char; const zWal: PUTF8Char; nParam: Integer; azParam: PPUTF8Char): sqlite3_filename; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_create_filename';

procedure sqlite3_free_filename(p1: sqlite3_filename); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_free_filename';

function sqlite3_errcode(db: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_errcode';

function sqlite3_extended_errcode(db: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_extended_errcode';

function sqlite3_errmsg(p1: Psqlite3): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_errmsg';

function sqlite3_errmsg16(p1: Psqlite3): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_errmsg16';

function sqlite3_errstr(p1: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_errstr';

function sqlite3_error_offset(db: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_error_offset';

function sqlite3_limit(p1: Psqlite3; id: Integer; newVal: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_limit';

function sqlite3_prepare(db: Psqlite3; const zSql: PUTF8Char; nByte: Integer; ppStmt: PPsqlite3_stmt; pzTail: PPUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_prepare';

function sqlite3_prepare_v2(db: Psqlite3; const zSql: PUTF8Char; nByte: Integer; ppStmt: PPsqlite3_stmt; pzTail: PPUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_prepare_v2';

function sqlite3_prepare_v3(db: Psqlite3; const zSql: PUTF8Char; nByte: Integer; prepFlags: Cardinal; ppStmt: PPsqlite3_stmt; pzTail: PPUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_prepare_v3';

function sqlite3_prepare16(db: Psqlite3; const zSql: Pointer; nByte: Integer; ppStmt: PPsqlite3_stmt; pzTail: PPointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_prepare16';

function sqlite3_prepare16_v2(db: Psqlite3; const zSql: Pointer; nByte: Integer; ppStmt: PPsqlite3_stmt; pzTail: PPointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_prepare16_v2';

function sqlite3_prepare16_v3(db: Psqlite3; const zSql: Pointer; nByte: Integer; prepFlags: Cardinal; ppStmt: PPsqlite3_stmt; pzTail: PPointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_prepare16_v3';

function sqlite3_sql(pStmt: Psqlite3_stmt): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_sql';

function sqlite3_expanded_sql(pStmt: Psqlite3_stmt): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_expanded_sql';

function sqlite3_stmt_readonly(pStmt: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_stmt_readonly';

function sqlite3_stmt_isexplain(pStmt: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_stmt_isexplain';

function sqlite3_stmt_explain(pStmt: Psqlite3_stmt; eMode: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_stmt_explain';

function sqlite3_stmt_busy(p1: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_stmt_busy';

type
  sqlite3_bind_blob_ = procedure(p1: Pointer); cdecl;

function sqlite3_bind_blob(p1: Psqlite3_stmt; p2: Integer; const p3: Pointer; n: Integer; p5: sqlite3_bind_blob_): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_blob';

type
  sqlite3_bind_blob64_ = procedure(p1: Pointer); cdecl;

function sqlite3_bind_blob64(p1: Psqlite3_stmt; p2: Integer; const p3: Pointer; p4: sqlite3_uint64; p5: sqlite3_bind_blob64_): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_blob64';

function sqlite3_bind_double(p1: Psqlite3_stmt; p2: Integer; p3: Double): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_double';

function sqlite3_bind_int(p1: Psqlite3_stmt; p2: Integer; p3: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_int';

function sqlite3_bind_int64(p1: Psqlite3_stmt; p2: Integer; p3: sqlite3_int64): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_int64';

function sqlite3_bind_null(p1: Psqlite3_stmt; p2: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_null';

type
  sqlite3_bind_text_ = procedure(p1: Pointer); cdecl;

function sqlite3_bind_text(p1: Psqlite3_stmt; p2: Integer; const p3: PUTF8Char; p4: Integer; p5: sqlite3_bind_text_): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_text';

type
  sqlite3_bind_text16_ = procedure(p1: Pointer); cdecl;

function sqlite3_bind_text16(p1: Psqlite3_stmt; p2: Integer; const p3: Pointer; p4: Integer; p5: sqlite3_bind_text16_): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_text16';

type
  sqlite3_bind_text64_ = procedure(p1: Pointer); cdecl;

function sqlite3_bind_text64(p1: Psqlite3_stmt; p2: Integer; const p3: PUTF8Char; p4: sqlite3_uint64; p5: sqlite3_bind_text64_; encoding: Byte): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_text64';

function sqlite3_bind_value(p1: Psqlite3_stmt; p2: Integer; const p3: Psqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_value';

type
  sqlite3_bind_pointer_ = procedure(p1: Pointer); cdecl;

function sqlite3_bind_pointer(p1: Psqlite3_stmt; p2: Integer; p3: Pointer; const p4: PUTF8Char; p5: sqlite3_bind_pointer_): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_pointer';

function sqlite3_bind_zeroblob(p1: Psqlite3_stmt; p2: Integer; n: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_zeroblob';

function sqlite3_bind_zeroblob64(p1: Psqlite3_stmt; p2: Integer; p3: sqlite3_uint64): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_zeroblob64';

function sqlite3_bind_parameter_count(p1: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_parameter_count';

function sqlite3_bind_parameter_name(p1: Psqlite3_stmt; p2: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_parameter_name';

function sqlite3_bind_parameter_index(p1: Psqlite3_stmt; const zName: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_bind_parameter_index';

function sqlite3_clear_bindings(p1: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_clear_bindings';

function sqlite3_column_count(pStmt: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_count';

function sqlite3_column_name(p1: Psqlite3_stmt; N: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_name';

function sqlite3_column_name16(p1: Psqlite3_stmt; N: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_name16';

function sqlite3_column_database_name(p1: Psqlite3_stmt; p2: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_database_name';

function sqlite3_column_database_name16(p1: Psqlite3_stmt; p2: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_database_name16';

function sqlite3_column_table_name(p1: Psqlite3_stmt; p2: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_table_name';

function sqlite3_column_table_name16(p1: Psqlite3_stmt; p2: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_table_name16';

function sqlite3_column_origin_name(p1: Psqlite3_stmt; p2: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_origin_name';

function sqlite3_column_origin_name16(p1: Psqlite3_stmt; p2: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_origin_name16';

function sqlite3_column_decltype(p1: Psqlite3_stmt; p2: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_decltype';

function sqlite3_column_decltype16(p1: Psqlite3_stmt; p2: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_decltype16';

function sqlite3_step(p1: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_step';

function sqlite3_data_count(pStmt: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_data_count';

function sqlite3_column_blob(p1: Psqlite3_stmt; iCol: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_blob';

function sqlite3_column_double(p1: Psqlite3_stmt; iCol: Integer): Double; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_double';

function sqlite3_column_int(p1: Psqlite3_stmt; iCol: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_int';

function sqlite3_column_int64(p1: Psqlite3_stmt; iCol: Integer): sqlite3_int64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_int64';

function sqlite3_column_text(p1: Psqlite3_stmt; iCol: Integer): PByte; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_text';

function sqlite3_column_text16(p1: Psqlite3_stmt; iCol: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_text16';

function sqlite3_column_value(p1: Psqlite3_stmt; iCol: Integer): Psqlite3_value; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_value';

function sqlite3_column_bytes(p1: Psqlite3_stmt; iCol: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_bytes';

function sqlite3_column_bytes16(p1: Psqlite3_stmt; iCol: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_bytes16';

function sqlite3_column_type(p1: Psqlite3_stmt; iCol: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_column_type';

function sqlite3_finalize(pStmt: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_finalize';

function sqlite3_reset(pStmt: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_reset';

type
  sqlite3_create_function_xFunc = procedure(p1: Psqlite3_context; p2: Integer; p3: PPsqlite3_value); cdecl;

type
  sqlite3_create_function_xStep = procedure(p1: Psqlite3_context; p2: Integer; p3: PPsqlite3_value); cdecl;

type
  sqlite3_create_function_xFinal = procedure(p1: Psqlite3_context); cdecl;

function sqlite3_create_function(db: Psqlite3; const zFunctionName: PUTF8Char; nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: sqlite3_create_function_xFunc; xStep: sqlite3_create_function_xStep; xFinal: sqlite3_create_function_xFinal): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_create_function';

type
  sqlite3_create_function16_xFunc = procedure(p1: Psqlite3_context; p2: Integer; p3: PPsqlite3_value); cdecl;

type
  sqlite3_create_function16_xStep = procedure(p1: Psqlite3_context; p2: Integer; p3: PPsqlite3_value); cdecl;

type
  sqlite3_create_function16_xFinal = procedure(p1: Psqlite3_context); cdecl;

function sqlite3_create_function16(db: Psqlite3; const zFunctionName: Pointer; nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: sqlite3_create_function16_xFunc; xStep: sqlite3_create_function16_xStep; xFinal: sqlite3_create_function16_xFinal): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_create_function16';

type
  sqlite3_create_function_v2_xFunc = procedure(p1: Psqlite3_context; p2: Integer; p3: PPsqlite3_value); cdecl;

type
  sqlite3_create_function_v2_xStep = procedure(p1: Psqlite3_context; p2: Integer; p3: PPsqlite3_value); cdecl;

type
  sqlite3_create_function_v2_xFinal = procedure(p1: Psqlite3_context); cdecl;

type
  sqlite3_create_function_v2_xDestroy = procedure(p1: Pointer); cdecl;

function sqlite3_create_function_v2(db: Psqlite3; const zFunctionName: PUTF8Char; nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: sqlite3_create_function_v2_xFunc; xStep: sqlite3_create_function_v2_xStep; xFinal: sqlite3_create_function_v2_xFinal; xDestroy: sqlite3_create_function_v2_xDestroy): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_create_function_v2';

type
  sqlite3_create_window_function_xStep = procedure(p1: Psqlite3_context; p2: Integer; p3: PPsqlite3_value); cdecl;

type
  sqlite3_create_window_function_xFinal = procedure(p1: Psqlite3_context); cdecl;

type
  sqlite3_create_window_function_xValue = procedure(p1: Psqlite3_context); cdecl;

type
  sqlite3_create_window_function_xInverse = procedure(p1: Psqlite3_context; p2: Integer; p3: PPsqlite3_value); cdecl;

type
  sqlite3_create_window_function_xDestroy = procedure(p1: Pointer); cdecl;

function sqlite3_create_window_function(db: Psqlite3; const zFunctionName: PUTF8Char; nArg: Integer; eTextRep: Integer; pApp: Pointer; xStep: sqlite3_create_window_function_xStep; xFinal: sqlite3_create_window_function_xFinal; xValue: sqlite3_create_window_function_xValue; xInverse: sqlite3_create_window_function_xInverse; xDestroy: sqlite3_create_window_function_xDestroy): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_create_window_function';

function sqlite3_aggregate_count(p1: Psqlite3_context): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_aggregate_count';

function sqlite3_expired(p1: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_expired';

function sqlite3_transfer_bindings(p1: Psqlite3_stmt; p2: Psqlite3_stmt): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_transfer_bindings';

function sqlite3_global_recover(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_global_recover';

procedure sqlite3_thread_cleanup(); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_thread_cleanup';

type
  sqlite3_memory_alarm_ = procedure(p1: Pointer; p2: sqlite3_int64; p3: Integer); cdecl;

function sqlite3_memory_alarm(p1: sqlite3_memory_alarm_; p2: Pointer; p3: sqlite3_int64): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_memory_alarm';

function sqlite3_value_blob(p1: Psqlite3_value): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_blob';

function sqlite3_value_double(p1: Psqlite3_value): Double; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_double';

function sqlite3_value_int(p1: Psqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_int';

function sqlite3_value_int64(p1: Psqlite3_value): sqlite3_int64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_int64';

function sqlite3_value_pointer(p1: Psqlite3_value; const p2: PUTF8Char): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_pointer';

function sqlite3_value_text(p1: Psqlite3_value): PByte; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_text';

function sqlite3_value_text16(p1: Psqlite3_value): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_text16';

function sqlite3_value_text16le(p1: Psqlite3_value): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_text16le';

function sqlite3_value_text16be(p1: Psqlite3_value): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_text16be';

function sqlite3_value_bytes(p1: Psqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_bytes';

function sqlite3_value_bytes16(p1: Psqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_bytes16';

function sqlite3_value_type(p1: Psqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_type';

function sqlite3_value_numeric_type(p1: Psqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_numeric_type';

function sqlite3_value_nochange(p1: Psqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_nochange';

function sqlite3_value_frombind(p1: Psqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_frombind';

function sqlite3_value_encoding(p1: Psqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_encoding';

function sqlite3_value_subtype(p1: Psqlite3_value): Cardinal; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_subtype';

function sqlite3_value_dup(const p1: Psqlite3_value): Psqlite3_value; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_dup';

procedure sqlite3_value_free(p1: Psqlite3_value); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_value_free';

function sqlite3_aggregate_context(p1: Psqlite3_context; nBytes: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_aggregate_context';

function sqlite3_user_data(p1: Psqlite3_context): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_user_data';

function sqlite3_context_db_handle(p1: Psqlite3_context): Psqlite3; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_context_db_handle';

function sqlite3_get_auxdata(p1: Psqlite3_context; N: Integer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_get_auxdata';

type
  sqlite3_set_auxdata_ = procedure(p1: Pointer); cdecl;

procedure sqlite3_set_auxdata(p1: Psqlite3_context; N: Integer; p3: Pointer; p4: sqlite3_set_auxdata_); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_set_auxdata';

function sqlite3_get_clientdata(p1: Psqlite3; const p2: PUTF8Char): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_get_clientdata';

type
  sqlite3_set_clientdata_ = procedure(p1: Pointer); cdecl;

function sqlite3_set_clientdata(p1: Psqlite3; const p2: PUTF8Char; p3: Pointer; p4: sqlite3_set_clientdata_): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_set_clientdata';

type
  sqlite3_result_blob_ = procedure(p1: Pointer); cdecl;

procedure sqlite3_result_blob(p1: Psqlite3_context; const p2: Pointer; p3: Integer; p4: sqlite3_result_blob_); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_blob';

type
  sqlite3_result_blob64_ = procedure(p1: Pointer); cdecl;

procedure sqlite3_result_blob64(p1: Psqlite3_context; const p2: Pointer; p3: sqlite3_uint64; p4: sqlite3_result_blob64_); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_blob64';

procedure sqlite3_result_double(p1: Psqlite3_context; p2: Double); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_double';

procedure sqlite3_result_error(p1: Psqlite3_context; const p2: PUTF8Char; p3: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_error';

procedure sqlite3_result_error16(p1: Psqlite3_context; const p2: Pointer; p3: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_error16';

procedure sqlite3_result_error_toobig(p1: Psqlite3_context); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_error_toobig';

procedure sqlite3_result_error_nomem(p1: Psqlite3_context); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_error_nomem';

procedure sqlite3_result_error_code(p1: Psqlite3_context; p2: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_error_code';

procedure sqlite3_result_int(p1: Psqlite3_context; p2: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_int';

procedure sqlite3_result_int64(p1: Psqlite3_context; p2: sqlite3_int64); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_int64';

procedure sqlite3_result_null(p1: Psqlite3_context); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_null';

type
  sqlite3_result_text_ = procedure(p1: Pointer); cdecl;

procedure sqlite3_result_text(p1: Psqlite3_context; const p2: PUTF8Char; p3: Integer; p4: sqlite3_result_text_); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_text';

type
  sqlite3_result_text64_ = procedure(p1: Pointer); cdecl;

procedure sqlite3_result_text64(p1: Psqlite3_context; const p2: PUTF8Char; p3: sqlite3_uint64; p4: sqlite3_result_text64_; encoding: Byte); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_text64';

type
  sqlite3_result_text16_ = procedure(p1: Pointer); cdecl;

procedure sqlite3_result_text16(p1: Psqlite3_context; const p2: Pointer; p3: Integer; p4: sqlite3_result_text16_); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_text16';

type
  sqlite3_result_text16le_ = procedure(p1: Pointer); cdecl;

procedure sqlite3_result_text16le(p1: Psqlite3_context; const p2: Pointer; p3: Integer; p4: sqlite3_result_text16le_); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_text16le';

type
  sqlite3_result_text16be_ = procedure(p1: Pointer); cdecl;

procedure sqlite3_result_text16be(p1: Psqlite3_context; const p2: Pointer; p3: Integer; p4: sqlite3_result_text16be_); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_text16be';

procedure sqlite3_result_value(p1: Psqlite3_context; p2: Psqlite3_value); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_value';

type
  sqlite3_result_pointer_ = procedure(p1: Pointer); cdecl;

procedure sqlite3_result_pointer(p1: Psqlite3_context; p2: Pointer; const p3: PUTF8Char; p4: sqlite3_result_pointer_); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_pointer';

procedure sqlite3_result_zeroblob(p1: Psqlite3_context; n: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_zeroblob';

function sqlite3_result_zeroblob64(p1: Psqlite3_context; n: sqlite3_uint64): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_zeroblob64';

procedure sqlite3_result_subtype(p1: Psqlite3_context; p2: Cardinal); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_result_subtype';

type
  sqlite3_create_collation_xCompare = function(p1: Pointer; p2: Integer; const p3: Pointer; p4: Integer; const p5: Pointer): Integer; cdecl;

function sqlite3_create_collation(p1: Psqlite3; const zName: PUTF8Char; eTextRep: Integer; pArg: Pointer; xCompare: sqlite3_create_collation_xCompare): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_create_collation';

type
  sqlite3_create_collation_v2_xCompare = function(p1: Pointer; p2: Integer; const p3: Pointer; p4: Integer; const p5: Pointer): Integer; cdecl;

type
  sqlite3_create_collation_v2_xDestroy = procedure(p1: Pointer); cdecl;

function sqlite3_create_collation_v2(p1: Psqlite3; const zName: PUTF8Char; eTextRep: Integer; pArg: Pointer; xCompare: sqlite3_create_collation_v2_xCompare; xDestroy: sqlite3_create_collation_v2_xDestroy): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_create_collation_v2';

type
  sqlite3_create_collation16_xCompare = function(p1: Pointer; p2: Integer; const p3: Pointer; p4: Integer; const p5: Pointer): Integer; cdecl;

function sqlite3_create_collation16(p1: Psqlite3; const zName: Pointer; eTextRep: Integer; pArg: Pointer; xCompare: sqlite3_create_collation16_xCompare): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_create_collation16';

type
  sqlite3_collation_needed_ = procedure(p1: Pointer; p2: Psqlite3; eTextRep: Integer; const p4: PUTF8Char); cdecl;

function sqlite3_collation_needed(p1: Psqlite3; p2: Pointer; p3: sqlite3_collation_needed_): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_collation_needed';

type
  sqlite3_collation_needed16_ = procedure(p1: Pointer; p2: Psqlite3; eTextRep: Integer; const p4: Pointer); cdecl;

function sqlite3_collation_needed16(p1: Psqlite3; p2: Pointer; p3: sqlite3_collation_needed16_): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_collation_needed16';

function sqlite3_sleep(p1: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_sleep';

function sqlite3_win32_set_directory(&type: Cardinal; zValue: Pointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_win32_set_directory';

function sqlite3_win32_set_directory8(&type: Cardinal; const zValue: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_win32_set_directory8';

function sqlite3_win32_set_directory16(&type: Cardinal; const zValue: Pointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_win32_set_directory16';

function sqlite3_get_autocommit(p1: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_get_autocommit';

function sqlite3_db_handle(p1: Psqlite3_stmt): Psqlite3; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_db_handle';

function sqlite3_db_name(db: Psqlite3; N: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_db_name';

function sqlite3_db_filename(db: Psqlite3; const zDbName: PUTF8Char): sqlite3_filename; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_db_filename';

function sqlite3_db_readonly(db: Psqlite3; const zDbName: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_db_readonly';

function sqlite3_txn_state(p1: Psqlite3; const zSchema: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_txn_state';

function sqlite3_next_stmt(pDb: Psqlite3; pStmt: Psqlite3_stmt): Psqlite3_stmt; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_next_stmt';

type
  sqlite3_commit_hook_ = function(p1: Pointer): Integer; cdecl;

function sqlite3_commit_hook(p1: Psqlite3; p2: sqlite3_commit_hook_; p3: Pointer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_commit_hook';

type
  sqlite3_rollback_hook_ = procedure(p1: Pointer); cdecl;

function sqlite3_rollback_hook(p1: Psqlite3; p2: sqlite3_rollback_hook_; p3: Pointer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_rollback_hook';

type
  sqlite3_autovacuum_pages_1 = function(p1: Pointer; const p2: PUTF8Char; p3: Cardinal; p4: Cardinal; p5: Cardinal): Cardinal; cdecl;

type
  sqlite3_autovacuum_pages_2 = procedure(p1: Pointer); cdecl;

function sqlite3_autovacuum_pages(db: Psqlite3; p2: sqlite3_autovacuum_pages_1; p3: Pointer; p4: sqlite3_autovacuum_pages_2): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_autovacuum_pages';

type
  sqlite3_update_hook_ = procedure(p1: Pointer; p2: Integer; const p3: PUTF8Char; const p4: PUTF8Char; p5: sqlite3_int64); cdecl;

function sqlite3_update_hook(p1: Psqlite3; p2: sqlite3_update_hook_; p3: Pointer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_update_hook';

function sqlite3_enable_shared_cache(p1: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_enable_shared_cache';

function sqlite3_release_memory(p1: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_release_memory';

function sqlite3_db_release_memory(p1: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_db_release_memory';

function sqlite3_soft_heap_limit64(N: sqlite3_int64): sqlite3_int64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_soft_heap_limit64';

function sqlite3_hard_heap_limit64(N: sqlite3_int64): sqlite3_int64; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_hard_heap_limit64';

procedure sqlite3_soft_heap_limit(N: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_soft_heap_limit';

function sqlite3_table_column_metadata(db: Psqlite3; const zDbName: PUTF8Char; const zTableName: PUTF8Char; const zColumnName: PUTF8Char; pzDataType: PPUTF8Char; pzCollSeq: PPUTF8Char; pNotNull: PInteger; pPrimaryKey: PInteger; pAutoinc: PInteger): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_table_column_metadata';

type
  sqlite3_auto_extension_xEntryPoint = procedure(); cdecl;

function sqlite3_auto_extension(xEntryPoint: sqlite3_auto_extension_xEntryPoint): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_auto_extension';

type
  sqlite3_cancel_auto_extension_xEntryPoint = procedure(); cdecl;

function sqlite3_cancel_auto_extension(xEntryPoint: sqlite3_cancel_auto_extension_xEntryPoint): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_cancel_auto_extension';

procedure sqlite3_reset_auto_extension(); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_reset_auto_extension';

function sqlite3_create_module(db: Psqlite3; const zName: PUTF8Char; const p: Psqlite3_module; pClientData: Pointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_create_module';

type
  sqlite3_create_module_v2_xDestroy = procedure(p1: Pointer); cdecl;

function sqlite3_create_module_v2(db: Psqlite3; const zName: PUTF8Char; const p: Psqlite3_module; pClientData: Pointer; xDestroy: sqlite3_create_module_v2_xDestroy): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_create_module_v2';

function sqlite3_drop_modules(db: Psqlite3; azKeep: PPUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_drop_modules';

function sqlite3_declare_vtab(p1: Psqlite3; const zSQL: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_declare_vtab';

function sqlite3_overload_function(p1: Psqlite3; const zFuncName: PUTF8Char; nArg: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_overload_function';

function sqlite3_blob_open(p1: Psqlite3; const zDb: PUTF8Char; const zTable: PUTF8Char; const zColumn: PUTF8Char; iRow: sqlite3_int64; flags: Integer; ppBlob: PPsqlite3_blob): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_blob_open';

function sqlite3_blob_reopen(p1: Psqlite3_blob; p2: sqlite3_int64): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_blob_reopen';

function sqlite3_blob_close(p1: Psqlite3_blob): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_blob_close';

function sqlite3_blob_bytes(p1: Psqlite3_blob): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_blob_bytes';

function sqlite3_blob_read(p1: Psqlite3_blob; Z: Pointer; N: Integer; iOffset: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_blob_read';

function sqlite3_blob_write(p1: Psqlite3_blob; const z: Pointer; n: Integer; iOffset: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_blob_write';

function sqlite3_vfs_find(const zVfsName: PUTF8Char): Psqlite3_vfs; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vfs_find';

function sqlite3_vfs_register(p1: Psqlite3_vfs; makeDflt: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vfs_register';

function sqlite3_vfs_unregister(p1: Psqlite3_vfs): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vfs_unregister';

function sqlite3_mutex_alloc(p1: Integer): Psqlite3_mutex; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_mutex_alloc';

procedure sqlite3_mutex_free(p1: Psqlite3_mutex); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_mutex_free';

procedure sqlite3_mutex_enter(p1: Psqlite3_mutex); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_mutex_enter';

function sqlite3_mutex_try(p1: Psqlite3_mutex): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_mutex_try';

procedure sqlite3_mutex_leave(p1: Psqlite3_mutex); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_mutex_leave';

function sqlite3_db_mutex(p1: Psqlite3): Psqlite3_mutex; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_db_mutex';

function sqlite3_file_control(p1: Psqlite3; const zDbName: PUTF8Char; op: Integer; p4: Pointer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_file_control';

function sqlite3_test_control(op: Integer): Integer varargs; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_test_control';

function sqlite3_keyword_count(): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_keyword_count';

function sqlite3_keyword_name(p1: Integer; p2: PPUTF8Char; p3: PInteger): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_keyword_name';

function sqlite3_keyword_check(const p1: PUTF8Char; p2: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_keyword_check';

function sqlite3_str_new(p1: Psqlite3): Psqlite3_str; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_new';

function sqlite3_str_finish(p1: Psqlite3_str): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_finish';

procedure sqlite3_str_appendf(p1: Psqlite3_str; const zFormat: PUTF8Char) varargs; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_appendf';

procedure sqlite3_str_vappendf(p1: Psqlite3_str; const zFormat: PUTF8Char; p3: Pointer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_vappendf';

procedure sqlite3_str_append(p1: Psqlite3_str; const zIn: PUTF8Char; N: Integer); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_append';

procedure sqlite3_str_appendall(p1: Psqlite3_str; const zIn: PUTF8Char); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_appendall';

procedure sqlite3_str_appendchar(p1: Psqlite3_str; N: Integer; C: UTF8Char); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_appendchar';

procedure sqlite3_str_reset(p1: Psqlite3_str); cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_reset';

function sqlite3_str_errcode(p1: Psqlite3_str): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_errcode';

function sqlite3_str_length(p1: Psqlite3_str): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_length';

function sqlite3_str_value(p1: Psqlite3_str): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_str_value';

function sqlite3_status(op: Integer; pCurrent: PInteger; pHighwater: PInteger; resetFlag: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_status';

function sqlite3_status64(op: Integer; pCurrent: Psqlite3_int64; pHighwater: Psqlite3_int64; resetFlag: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_status64';

function sqlite3_db_status(p1: Psqlite3; op: Integer; pCur: PInteger; pHiwtr: PInteger; resetFlg: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_db_status';

function sqlite3_stmt_status(p1: Psqlite3_stmt; op: Integer; resetFlg: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_stmt_status';

function sqlite3_backup_init(pDest: Psqlite3; const zDestName: PUTF8Char; pSource: Psqlite3; const zSourceName: PUTF8Char): Psqlite3_backup; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_backup_init';

function sqlite3_backup_step(p: Psqlite3_backup; nPage: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_backup_step';

function sqlite3_backup_finish(p: Psqlite3_backup): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_backup_finish';

function sqlite3_backup_remaining(p: Psqlite3_backup): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_backup_remaining';

function sqlite3_backup_pagecount(p: Psqlite3_backup): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_backup_pagecount';

function sqlite3_stricmp(const p1: PUTF8Char; const p2: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_stricmp';

function sqlite3_strnicmp(const p1: PUTF8Char; const p2: PUTF8Char; p3: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_strnicmp';

function sqlite3_strglob(const zGlob: PUTF8Char; const zStr: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_strglob';

function sqlite3_strlike(const zGlob: PUTF8Char; const zStr: PUTF8Char; cEsc: Cardinal): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_strlike';

procedure sqlite3_log(iErrCode: Integer; const zFormat: PUTF8Char) varargs; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_log';

type
  sqlite3_wal_hook_ = function(p1: Pointer; p2: Psqlite3; const p3: PUTF8Char; p4: Integer): Integer; cdecl;

function sqlite3_wal_hook(p1: Psqlite3; p2: sqlite3_wal_hook_; p3: Pointer): Pointer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_wal_hook';

function sqlite3_wal_autocheckpoint(db: Psqlite3; N: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_wal_autocheckpoint';

function sqlite3_wal_checkpoint(db: Psqlite3; const zDb: PUTF8Char): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_wal_checkpoint';

function sqlite3_wal_checkpoint_v2(db: Psqlite3; const zDb: PUTF8Char; eMode: Integer; pnLog: PInteger; pnCkpt: PInteger): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_wal_checkpoint_v2';

function sqlite3_vtab_config(p1: Psqlite3; op: Integer): Integer varargs; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vtab_config';

function sqlite3_vtab_on_conflict(p1: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vtab_on_conflict';

function sqlite3_vtab_nochange(p1: Psqlite3_context): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vtab_nochange';

function sqlite3_vtab_collation(p1: Psqlite3_index_info; p2: Integer): PUTF8Char; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vtab_collation';

function sqlite3_vtab_distinct(p1: Psqlite3_index_info): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vtab_distinct';

function sqlite3_vtab_in(p1: Psqlite3_index_info; iCons: Integer; bHandle: Integer): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vtab_in';

function sqlite3_vtab_in_first(pVal: Psqlite3_value; ppOut: PPsqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vtab_in_first';

function sqlite3_vtab_in_next(pVal: Psqlite3_value; ppOut: PPsqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vtab_in_next';

function sqlite3_vtab_rhs_value(p1: Psqlite3_index_info; p2: Integer; ppVal: PPsqlite3_value): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vtab_rhs_value';

function sqlite3_db_cacheflush(p1: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_db_cacheflush';

function sqlite3_system_errno(p1: Psqlite3): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_system_errno';

function sqlite3_serialize(db: Psqlite3; const zSchema: PUTF8Char; piSize: Psqlite3_int64; mFlags: Cardinal): PByte; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_serialize';

function sqlite3_deserialize(db: Psqlite3; const zSchema: PUTF8Char; pData: PByte; szDb: sqlite3_int64; szBuf: sqlite3_int64; mFlags: Cardinal): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_deserialize';

function sqlite3_vec_init(db: Psqlite3; pzErrMsg: PPUTF8Char; const pApi: Psqlite3_api_routines): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vec_init';

function sqlite3_vec_fs_read_init(db: Psqlite3; pzErrMsg: PPUTF8Char; const pApi: Psqlite3_api_routines): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_vec_fs_read_init';

function sqlite3_lembed_init(db: Psqlite3; pzErrMsg: PPUTF8Char; const pApi: Psqlite3_api_routines): Integer; cdecl;
  external LMENGINE_DLL name _PU + 'sqlite3_lembed_init';

implementation

end.
