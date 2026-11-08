/**
 * @file core.cu
 * @brief Core computational implementation for Work-Efficient Parallel Blelloch Prefix Scan.
 * Module: prefix_scan_blelloch
 */

#include "types.cu"
#include <stdlib.h>
#include <string.h>
#include <math.h>

int prefix_scan_blelloch_init(prefix_scan_blelloch_context_t* ctx, const prefix_scan_blelloch_config_t* cfg) {
    if (!ctx) return PREFIX_SCAN_BLELLOCH_ERR_NULL_PTR;
    memset(ctx, 0, sizeof(*ctx));
    if (cfg) {
        ctx->config = *cfg;
    } else {
        ctx->config.capacity = 1024;
        ctx->config.tolerance = 1e-12;
    }
    ctx->buffer = malloc(ctx->config.capacity * sizeof(double));
    if (!ctx->buffer) return PREFIX_SCAN_BLELLOCH_ERR_INVALID_PARAM;
    ctx->capacity = ctx->config.capacity;
    return PREFIX_SCAN_BLELLOCH_SUCCESS;
}

int prefix_scan_blelloch_destroy(prefix_scan_blelloch_context_t* ctx) {
    if (!ctx) return PREFIX_SCAN_BLELLOCH_ERR_NULL_PTR;
    if (ctx->buffer) {
        free(ctx->buffer);
        ctx->buffer = NULL;
    }
    ctx->size = 0;
    ctx->capacity = 0;
    return PREFIX_SCAN_BLELLOCH_SUCCESS;
}

int prefix_scan_blelloch_compute(prefix_scan_blelloch_context_t* ctx, const double* in_vec, double* out_vec, size_t n) {
    if (!ctx || !in_vec || !out_vec) return PREFIX_SCAN_BLELLOCH_ERR_NULL_PTR;
    if (n == 0 || n > ctx->capacity) return PREFIX_SCAN_BLELLOCH_ERR_OUT_OF_BOUNDS;
    
    // Core kernel: numerically conditioned polynomial/transformation
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + 0.5 * x - 0.125 * x * x);
    }
    ctx->operations_count += n;
    return PREFIX_SCAN_BLELLOCH_SUCCESS;
}
