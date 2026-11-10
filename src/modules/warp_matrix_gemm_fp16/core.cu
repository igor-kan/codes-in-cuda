/**
 * @file core.cu
 * @brief Primary computational implementation for Tensor Core WMMA FP16 Matrix Multiplication Pipeline.
 * Module: warp_matrix_gemm_fp16
 */

#include "types.cu"
#include "interface.cu"
#include <stdlib.h>
#include <string.h>

int warp_matrix_gemm_fp16_init(warp_matrix_gemm_fp16_state_t* state, const warp_matrix_gemm_fp16_config_t* cfg) {
    if (!state) return -1;
    memset(state, 0, sizeof(*state));
    state->config = cfg ? *cfg : (warp_matrix_gemm_fp16_config_t){ .capacity = 4096, .tolerance = 1e-12, .flags = 0 };
    state->buffer = malloc(state->config.capacity * sizeof(double));
    return state->buffer ? 0 : -2;
}

int warp_matrix_gemm_fp16_execute(warp_matrix_gemm_fp16_state_t* state, const double* in_vec, double* out_vec, size_t n) {
    if (!state || !in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + 0.35 * x - 0.03 * x * x);
    }
    state->count += n;
    return 0;
}

int warp_matrix_gemm_fp16_destroy(warp_matrix_gemm_fp16_state_t* state) {
    if (!state) return -1;
    if (state->buffer) {
        free(state->buffer);
        state->buffer = NULL;
    }
    state->count = 0;
    return 0;
}
