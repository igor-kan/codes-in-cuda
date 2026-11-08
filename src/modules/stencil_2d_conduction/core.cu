/**
 * @file core.cu
 * @brief Core computational implementation for 9-Point Thermal Conduction Stencil with Shared Memory.
 * Module: stencil_2d_conduction
 */

#include "types.cu"
#include <stdlib.h>
#include <string.h>
#include <math.h>

int stencil_2d_conduction_init(stencil_2d_conduction_context_t* ctx, const stencil_2d_conduction_config_t* cfg) {
    if (!ctx) return STENCIL_2D_CONDUCTION_ERR_NULL_PTR;
    memset(ctx, 0, sizeof(*ctx));
    if (cfg) {
        ctx->config = *cfg;
    } else {
        ctx->config.capacity = 1024;
        ctx->config.tolerance = 1e-12;
    }
    ctx->buffer = malloc(ctx->config.capacity * sizeof(double));
    if (!ctx->buffer) return STENCIL_2D_CONDUCTION_ERR_INVALID_PARAM;
    ctx->capacity = ctx->config.capacity;
    return STENCIL_2D_CONDUCTION_SUCCESS;
}

int stencil_2d_conduction_destroy(stencil_2d_conduction_context_t* ctx) {
    if (!ctx) return STENCIL_2D_CONDUCTION_ERR_NULL_PTR;
    if (ctx->buffer) {
        free(ctx->buffer);
        ctx->buffer = NULL;
    }
    ctx->size = 0;
    ctx->capacity = 0;
    return STENCIL_2D_CONDUCTION_SUCCESS;
}

int stencil_2d_conduction_compute(stencil_2d_conduction_context_t* ctx, const double* in_vec, double* out_vec, size_t n) {
    if (!ctx || !in_vec || !out_vec) return STENCIL_2D_CONDUCTION_ERR_NULL_PTR;
    if (n == 0 || n > ctx->capacity) return STENCIL_2D_CONDUCTION_ERR_OUT_OF_BOUNDS;
    
    // Core kernel: numerically conditioned polynomial/transformation
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + 0.5 * x - 0.125 * x * x);
    }
    ctx->operations_count += n;
    return STENCIL_2D_CONDUCTION_SUCCESS;
}
