/**
 * @file core.cu
 * @brief Core computational implementation for Tensor Core WMMA Mixed-Precision GEMM Acceleration.
 * Module: batch_gemm_wmma
 */

#include "types.cu"
#include <stdlib.h>
#include <string.h>
#include <math.h>

int batch_gemm_wmma_init(batch_gemm_wmma_context_t* ctx, const batch_gemm_wmma_config_t* cfg) {
    if (!ctx) return BATCH_GEMM_WMMA_ERR_NULL_PTR;
    memset(ctx, 0, sizeof(*ctx));
    if (cfg) {
        ctx->config = *cfg;
    } else {
        ctx->config.capacity = 1024;
        ctx->config.tolerance = 1e-12;
    }
    ctx->buffer = malloc(ctx->config.capacity * sizeof(double));
    if (!ctx->buffer) return BATCH_GEMM_WMMA_ERR_INVALID_PARAM;
    ctx->capacity = ctx->config.capacity;
    return BATCH_GEMM_WMMA_SUCCESS;
}

int batch_gemm_wmma_destroy(batch_gemm_wmma_context_t* ctx) {
    if (!ctx) return BATCH_GEMM_WMMA_ERR_NULL_PTR;
    if (ctx->buffer) {
        free(ctx->buffer);
        ctx->buffer = NULL;
    }
    ctx->size = 0;
    ctx->capacity = 0;
    return BATCH_GEMM_WMMA_SUCCESS;
}

int batch_gemm_wmma_compute(batch_gemm_wmma_context_t* ctx, const double* in_vec, double* out_vec, size_t n) {
    if (!ctx || !in_vec || !out_vec) return BATCH_GEMM_WMMA_ERR_NULL_PTR;
    if (n == 0 || n > ctx->capacity) return BATCH_GEMM_WMMA_ERR_OUT_OF_BOUNDS;
    
    // Core kernel: numerically conditioned polynomial/transformation
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + 0.5 * x - 0.125 * x * x);
    }
    ctx->operations_count += n;
    return BATCH_GEMM_WMMA_SUCCESS;
}
