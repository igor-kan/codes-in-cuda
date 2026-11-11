/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for Grid Cooperative 2D Matrix Transpose with Bank Padding.
 * Module: cooperative_matrix_transpose
 */

#ifndef COOPERATIVE_MATRIX_TRANSPOSE_INTERFACE_H
#define COOPERATIVE_MATRIX_TRANSPOSE_INTERFACE_H

#include "types.cu"

typedef int (*cooperative_matrix_transpose_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct cooperative_matrix_transpose_vtable {
    int (*init)(cooperative_matrix_transpose_state_t* state, const cooperative_matrix_transpose_config_t* cfg);
    int (*execute)(cooperative_matrix_transpose_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(cooperative_matrix_transpose_state_t* state);
    int (*destroy)(cooperative_matrix_transpose_state_t* state);
} cooperative_matrix_transpose_vtable_t;

#endif /* COOPERATIVE_MATRIX_TRANSPOSE_INTERFACE_H */
