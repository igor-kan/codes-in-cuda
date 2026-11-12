/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Shared Memory Matrix Transpose with Bank Padding.
 * Module: matrix_transpose_pad | Algorithm Family: matrix_pad
 */

#ifndef MATRIX_TRANSPOSE_PAD_INTERFACE_H
#define MATRIX_TRANSPOSE_PAD_INTERFACE_H

#include "types.cu"

typedef int (*matrix_transpose_pad_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct matrix_transpose_pad_vtable {
    int (*init)(matrix_transpose_pad_state_t* state, const matrix_transpose_pad_config_t* cfg);
    int (*execute)(matrix_transpose_pad_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(matrix_transpose_pad_state_t* state);
    int (*destroy)(matrix_transpose_pad_state_t* state);
} matrix_transpose_pad_vtable_t;

#endif /* MATRIX_TRANSPOSE_PAD_INTERFACE_H */
