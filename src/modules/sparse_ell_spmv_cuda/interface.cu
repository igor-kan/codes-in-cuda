/**
 * @file interface.cu
 * @brief Abstract contracts and operational prototypes for ELLPACK Sparse Matrix-Vector Multiplication Kernel.
 * Module: sparse_ell_spmv_cuda
 */

#ifndef SPARSE_ELL_SPMV_CUDA_INTERFACE_H
#define SPARSE_ELL_SPMV_CUDA_INTERFACE_H

#include "types.cu"

typedef int (*sparse_ell_spmv_cuda_kernel_fn)(const double* in_data, double* out_data, size_t n);

typedef struct sparse_ell_spmv_cuda_vtable {
    int (*init)(sparse_ell_spmv_cuda_state_t* state, const sparse_ell_spmv_cuda_config_t* cfg);
    int (*execute)(sparse_ell_spmv_cuda_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(sparse_ell_spmv_cuda_state_t* state);
    int (*destroy)(sparse_ell_spmv_cuda_state_t* state);
} sparse_ell_spmv_cuda_vtable_t;

#endif /* SPARSE_ELL_SPMV_CUDA_INTERFACE_H */
