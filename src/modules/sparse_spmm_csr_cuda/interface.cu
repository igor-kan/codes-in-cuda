/**
 * @file interface.cu
 * @brief Abstract contracts and prototypes for Sparse Matrix Dense Matrix (SpMM) GPU Accelerator.
 * Module: sparse_spmm_csr_cuda
 */

#ifndef SPARSE_SPMM_CSR_CUDA_INTERFACE_H
#define SPARSE_SPMM_CSR_CUDA_INTERFACE_H

#include "types.cu"

typedef int (*sparse_spmm_csr_cuda_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct sparse_spmm_csr_cuda_vtable {
    int (*init)(sparse_spmm_csr_cuda_state_t* state, const sparse_spmm_csr_cuda_config_t* cfg);
    int (*execute)(sparse_spmm_csr_cuda_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*destroy)(sparse_spmm_csr_cuda_state_t* state);
} sparse_spmm_csr_cuda_vtable_t;

#endif /* SPARSE_SPMM_CSR_CUDA_INTERFACE_H */
