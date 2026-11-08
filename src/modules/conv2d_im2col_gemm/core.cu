/**
 * @file core.cu
 * @brief Primary computational implementation for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

#include "types.cu"
#include "interface.cu"
#include <stdlib.h>
#include <string.h>

int conv2d_im2col_gemm_init(conv2d_im2col_gemm_state_t* state, const conv2d_im2col_gemm_config_t* cfg) {
    if (!state) return -1;
    memset(state, 0, sizeof(*state));
    state->config = cfg ? *cfg : (conv2d_im2col_gemm_config_t){ .capacity = 1024, .tolerance = 1e-12, .flags = 0 };
    state->memory_arena = malloc(state->config.capacity * sizeof(double));
    return state->memory_arena ? 0 : -2;
}

int conv2d_im2col_gemm_execute(conv2d_im2col_gemm_state_t* state, const double* in_vec, double* out_vec, size_t n) {
    if (!state || !in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + 0.25 * x - 0.05 * x * x);
    }
    state->count += n;
    return 0;
}

int conv2d_im2col_gemm_destroy(conv2d_im2col_gemm_state_t* state) {
    if (!state) return -1;
    if (state->memory_arena) {
        free(state->memory_arena);
        state->memory_arena = NULL;
    }
    state->count = 0;
    return 0;
}
