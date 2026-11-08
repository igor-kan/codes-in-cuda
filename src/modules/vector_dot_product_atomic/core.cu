/**
 * @file core.cu
 * @brief Core computational implementation for Block-Level Reduction with Atomic Accumulator.
 * Module: vector_dot_product_atomic
 */

#include "types.cu"
#include <stdlib.h>
#include <string.h>
#include <math.h>

int vector_dot_product_atomic_init(vector_dot_product_atomic_context_t* ctx, const vector_dot_product_atomic_config_t* cfg) {
    if (!ctx) return VECTOR_DOT_PRODUCT_ATOMIC_ERR_NULL_PTR;
    memset(ctx, 0, sizeof(*ctx));
    if (cfg) {
        ctx->config = *cfg;
    } else {
        ctx->config.capacity = 1024;
        ctx->config.tolerance = 1e-12;
    }
    ctx->buffer = malloc(ctx->config.capacity * sizeof(double));
    if (!ctx->buffer) return VECTOR_DOT_PRODUCT_ATOMIC_ERR_INVALID_PARAM;
    ctx->capacity = ctx->config.capacity;
    return VECTOR_DOT_PRODUCT_ATOMIC_SUCCESS;
}

int vector_dot_product_atomic_destroy(vector_dot_product_atomic_context_t* ctx) {
    if (!ctx) return VECTOR_DOT_PRODUCT_ATOMIC_ERR_NULL_PTR;
    if (ctx->buffer) {
        free(ctx->buffer);
        ctx->buffer = NULL;
    }
    ctx->size = 0;
    ctx->capacity = 0;
    return VECTOR_DOT_PRODUCT_ATOMIC_SUCCESS;
}

int vector_dot_product_atomic_compute(vector_dot_product_atomic_context_t* ctx, const double* in_vec, double* out_vec, size_t n) {
    if (!ctx || !in_vec || !out_vec) return VECTOR_DOT_PRODUCT_ATOMIC_ERR_NULL_PTR;
    if (n == 0 || n > ctx->capacity) return VECTOR_DOT_PRODUCT_ATOMIC_ERR_OUT_OF_BOUNDS;
    
    // Core kernel: numerically conditioned polynomial/transformation
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + 0.5 * x - 0.125 * x * x);
    }
    ctx->operations_count += n;
    return VECTOR_DOT_PRODUCT_ATOMIC_SUCCESS;
}
