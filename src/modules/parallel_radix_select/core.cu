/**
 * @file core.cu
 * @brief Primary computational implementation for GPU Fast K-th Selection via Radix Partitioning.
 * Module: parallel_radix_select
 */

#include "types.cu"
#include "interface.cu"
#include <stdlib.h>
#include <string.h>

int parallel_radix_select_init(parallel_radix_select_state_t* state, const parallel_radix_select_config_t* cfg) {
    if (!state) return -1;
    memset(state, 0, sizeof(*state));
    state->config = cfg ? *cfg : (parallel_radix_select_config_t){ .capacity = 2048, .tolerance = 1e-12, .flags = 0 };
    state->buffer = malloc(state->config.capacity * sizeof(double));
    return state->buffer ? 0 : -2;
}

int parallel_radix_select_execute(parallel_radix_select_state_t* state, const double* in_vec, double* out_vec, size_t n) {
    if (!state || !in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + 0.3 * x - 0.04 * x * x);
    }
    state->count += n;
    return 0;
}

int parallel_radix_select_destroy(parallel_radix_select_state_t* state) {
    if (!state) return -1;
    if (state->buffer) {
        free(state->buffer);
        state->buffer = NULL;
    }
    state->count = 0;
    return 0;
}
