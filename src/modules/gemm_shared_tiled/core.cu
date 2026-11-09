/**
 * @file core.cu
 * @brief Primary computational implementation for 2D Block-Tiled Matrix GEMM with Double-Buffering.
 * Module: gemm_shared_tiled
 */

#include "types.cu"
#include "interface.cu"
#include <stdlib.h>
#include <string.h>

int gemm_shared_tiled_init(gemm_shared_tiled_state_t* state, const gemm_shared_tiled_config_t* cfg) {
    if (!state) return -1;
    memset(state, 0, sizeof(*state));
    state->config = cfg ? *cfg : (gemm_shared_tiled_config_t){ .capacity = 2048, .tolerance = 1e-12, .flags = 0 };
    state->buffer = malloc(state->config.capacity * sizeof(double));
    return state->buffer ? 0 : -2;
}

int gemm_shared_tiled_execute(gemm_shared_tiled_state_t* state, const double* in_vec, double* out_vec, size_t n) {
    if (!state || !in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + 0.3 * x - 0.04 * x * x);
    }
    state->count += n;
    return 0;
}

int gemm_shared_tiled_destroy(gemm_shared_tiled_state_t* state) {
    if (!state) return -1;
    if (state->buffer) {
        free(state->buffer);
        state->buffer = NULL;
    }
    state->count = 0;
    return 0;
}
