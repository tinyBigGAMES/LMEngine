#include <stdio.h>
#include <stdarg.h>
#include <wchar.h>
#include <io.h>
#include < fcntl.h >
#include <windows.h>
#include "llama.h"
#include "sampling.h"


#define EXPORT_API extern "C" __declspec(dllexport)


EXPORT_API struct llama_sampling_context * _llama_sampling_init()
{
	llama_sampling_params params;
    params.temp = 0.0f;
    return llama_sampling_init(params);
}

EXPORT_API llama_token _llama_sampling_sample(
        struct llama_sampling_context * ctx_sampling,
        struct llama_context * ctx_main,
        struct llama_context * ctx_cfg,
        int idx = -1)
{
    return llama_sampling_sample(ctx_sampling, ctx_main, ctx_cfg, idx);
}

EXPORT_API void _llama_sampling_accept(
        struct llama_sampling_context * ctx_sampling,
        struct llama_context * ctx_main,
        llama_token id,
        bool apply_grammar)
{
   llama_sampling_accept(ctx_sampling, ctx_main, id, apply_grammar);
}

EXPORT_API void _llama_sampling_free(struct llama_sampling_context * ctx)
{
	llama_sampling_free(ctx);
}

EXPORT_API void Print(const wchar_t* AText, const int AColor, ...)
{
    SetConsoleCP(CP_UTF8);
    SetConsoleOutputCP(CP_UTF8);
    _setmode(_fileno(stdout), _O_WTEXT);
    
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    CONSOLE_SCREEN_BUFFER_INFO consoleInfo;
    WORD saved_attributes;

    // Save current console attributes
    GetConsoleScreenBufferInfo(hConsole, &consoleInfo);
    saved_attributes = consoleInfo.wAttributes;

    // Set new text color
    SetConsoleTextAttribute(hConsole, AColor);

    // Print the text with additional arguments
    va_list args;
    va_start(args, AColor);

    vfwprintf(stdout, AText, args);

    va_end(args);

    // Restore original console attributes
    SetConsoleTextAttribute(hConsole, saved_attributes);

    _setmode(_fileno(stdout), _O_TEXT);
}

EXPORT_API void PrintLn(const wchar_t* AText, const int AColor, ...)
{
    SetConsoleCP(CP_UTF8);
    SetConsoleOutputCP(CP_UTF8);
    _setmode(_fileno(stdout), _O_WTEXT);
    
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    CONSOLE_SCREEN_BUFFER_INFO consoleInfo;
    WORD saved_attributes;

    // Save current console attributes
    GetConsoleScreenBufferInfo(hConsole, &consoleInfo);
    saved_attributes = consoleInfo.wAttributes;

    // Set new text color
    SetConsoleTextAttribute(hConsole, AColor);

    // Print the text with additional arguments
    va_list args;
    va_start(args, AColor);

    vfwprintf(stdout, AText, args);
    wprintf(L"\n");
        
    va_end(args);

    // Restore original console attributes
    SetConsoleTextAttribute(hConsole, saved_attributes);

    _setmode(_fileno(stdout), _O_TEXT);
}




