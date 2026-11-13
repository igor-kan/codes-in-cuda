/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for Warp-Synchronous CSR Sparse Matrix-Vector Multiply.
 * Module: matrix_vector_csr_warp | Algorithm Family: spmv_csr
 */

#ifndef MATRIX_VECTOR_CSR_WARP_INTERFACE_H
#define MATRIX_VECTOR_CSR_WARP_INTERFACE_H

#include "types.cu"

typedef int (*matrix_vector_csr_warp_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct matrix_vector_csr_warp_vtable {
    int (*init)(matrix_vector_csr_warp_state_t* state, const matrix_vector_csr_warp_config_t* cfg);
    int (*execute)(matrix_vector_csr_warp_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(matrix_vector_csr_warp_state_t* state);
    int (*destroy)(matrix_vector_csr_warp_state_t* state);
} matrix_vector_csr_warp_vtable_t;

#endif /* MATRIX_VECTOR_CSR_WARP_INTERFACE_H */
