/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

#ifndef SPARSE_SPMV_CSR_CUDA_INTERFACE_H
#define SPARSE_SPMV_CSR_CUDA_INTERFACE_H

#include "types.cu"

typedef int (*sparse_spmv_csr_cuda_transform_fn)(const double* in_data, double* out_data, size_t n);

typedef struct sparse_spmv_csr_cuda_interface {
    int (*init)(sparse_spmv_csr_cuda_state_t* state, const sparse_spmv_csr_cuda_config_t* cfg);
    int (*execute)(sparse_spmv_csr_cuda_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(sparse_spmv_csr_cuda_state_t* state);
    int (*destroy)(sparse_spmv_csr_cuda_state_t* state);
} sparse_spmv_csr_cuda_interface_t;

#endif /* SPARSE_SPMV_CSR_CUDA_INTERFACE_H */
