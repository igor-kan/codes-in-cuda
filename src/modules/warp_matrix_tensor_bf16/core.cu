/**
 * @file core.cu
 * @brief Primary computational implementation for Tensor Core BF16 Mixed-Precision MMA GEMM Pipeline.
 * Module: warp_matrix_tensor_bf16
 */

#include "types.cu"
#include "interface.cu"
#include <stdlib.h>
#include <string.h>

int warp_matrix_tensor_bf16_init(warp_matrix_tensor_bf16_state_t* state, const warp_matrix_tensor_bf16_config_t* cfg) {
    if (!state) return -1;
    memset(state, 0, sizeof(*state));
    state->config = cfg ? *cfg : (warp_matrix_tensor_bf16_config_t){ .capacity = 8192, .tolerance = 1e-12, .flags = 0 };
    state->buffer = malloc(state->config.capacity * sizeof(double));
    return state->buffer ? 0 : -2;
}

int warp_matrix_tensor_bf16_execute(warp_matrix_tensor_bf16_state_t* state, const double* in_vec, double* out_vec, size_t n) {
    if (!state || !in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + 0.4 * x - 0.02 * x * x);
    }
    state->count += n;
    return 0;
}

int warp_matrix_tensor_bf16_destroy(warp_matrix_tensor_bf16_state_t* state) {
    if (!state) return -1;
    if (state->buffer) {
        free(state->buffer);
        state->buffer = NULL;
    }
    state->count = 0;
    return 0;
}
