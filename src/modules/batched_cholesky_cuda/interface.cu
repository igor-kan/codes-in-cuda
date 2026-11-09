/**
 * @file interface.cu
 * @brief Abstract contracts and prototypes for Batched Small-Matrix Cholesky Decomposition.
 * Module: batched_cholesky_cuda
 */

#ifndef BATCHED_CHOLESKY_CUDA_INTERFACE_H
#define BATCHED_CHOLESKY_CUDA_INTERFACE_H

#include "types.cu"

typedef int (*batched_cholesky_cuda_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct batched_cholesky_cuda_vtable {
    int (*init)(batched_cholesky_cuda_state_t* state, const batched_cholesky_cuda_config_t* cfg);
    int (*execute)(batched_cholesky_cuda_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*destroy)(batched_cholesky_cuda_state_t* state);
} batched_cholesky_cuda_vtable_t;

#endif /* BATCHED_CHOLESKY_CUDA_INTERFACE_H */
