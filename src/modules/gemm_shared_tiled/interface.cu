/**
 * @file interface.cu
 * @brief Abstract contracts and prototypes for 2D Block-Tiled Matrix GEMM with Double-Buffering.
 * Module: gemm_shared_tiled
 */

#ifndef GEMM_SHARED_TILED_INTERFACE_H
#define GEMM_SHARED_TILED_INTERFACE_H

#include "types.cu"

typedef int (*gemm_shared_tiled_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct gemm_shared_tiled_vtable {
    int (*init)(gemm_shared_tiled_state_t* state, const gemm_shared_tiled_config_t* cfg);
    int (*execute)(gemm_shared_tiled_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*destroy)(gemm_shared_tiled_state_t* state);
} gemm_shared_tiled_vtable_t;

#endif /* GEMM_SHARED_TILED_INTERFACE_H */
