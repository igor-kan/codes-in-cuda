/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for Vector-Based CSR Sparse Matrix-Vector Kernel.
 * Module: sparse_csr_spmv_vector
 */

#ifndef SPARSE_CSR_SPMV_VECTOR_INTERFACE_H
#define SPARSE_CSR_SPMV_VECTOR_INTERFACE_H

#include "types.cu"

typedef int (*sparse_csr_spmv_vector_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct sparse_csr_spmv_vector_vtable {
    int (*init)(sparse_csr_spmv_vector_state_t* state, const sparse_csr_spmv_vector_config_t* cfg);
    int (*execute)(sparse_csr_spmv_vector_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(sparse_csr_spmv_vector_state_t* state);
    int (*destroy)(sparse_csr_spmv_vector_state_t* state);
} sparse_csr_spmv_vector_vtable_t;

#endif /* SPARSE_CSR_SPMV_VECTOR_INTERFACE_H */
