/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for Batched Small-Matrix LU Decomposition with Partial Pivoting.
 * Module: batched_lu_cuda
 */

#ifndef BATCHED_LU_CUDA_INTERFACE_H
#define BATCHED_LU_CUDA_INTERFACE_H

#include "types.cu"

typedef int (*batched_lu_cuda_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct batched_lu_cuda_vtable {
    int (*init)(batched_lu_cuda_state_t* state, const batched_lu_cuda_config_t* cfg);
    int (*execute)(batched_lu_cuda_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(batched_lu_cuda_state_t* state);
    int (*destroy)(batched_lu_cuda_state_t* state);
} batched_lu_cuda_vtable_t;

#endif /* BATCHED_LU_CUDA_INTERFACE_H */
