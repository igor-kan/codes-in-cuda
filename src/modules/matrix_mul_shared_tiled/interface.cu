/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for 2D Shared-Memory Tiled Matrix Multiplication Kernel.
 * Module: matrix_mul_shared_tiled | Algorithm Family: matrix_pad
 */

#ifndef MATRIX_MUL_SHARED_TILED_INTERFACE_H
#define MATRIX_MUL_SHARED_TILED_INTERFACE_H

#include "types.cu"

typedef int (*matrix_mul_shared_tiled_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct matrix_mul_shared_tiled_vtable {
    int (*init)(matrix_mul_shared_tiled_state_t* state, const matrix_mul_shared_tiled_config_t* cfg);
    int (*execute)(matrix_mul_shared_tiled_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(matrix_mul_shared_tiled_state_t* state);
    int (*destroy)(matrix_mul_shared_tiled_state_t* state);
} matrix_mul_shared_tiled_vtable_t;

#endif /* MATRIX_MUL_SHARED_TILED_INTERFACE_H */
