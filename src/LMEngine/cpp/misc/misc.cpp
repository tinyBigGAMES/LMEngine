#include "llama.h"
#include "sampling.h"

int LLAMA_BUILD_NUMBER = 0;
const char* LLAMA_BUILD_COMMIT = "0";
const char* LLAMA_COMPILER = "0";
const char* LLAMA_BUILD_TARGET = "0";
const char* LLAMA_COMMIT = "0";

#define EXPORT_API __declspec(dllexport) extern "C"

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





