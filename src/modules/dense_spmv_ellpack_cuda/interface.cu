/**
 * @file interface.cu
 * @brief Abstract function prototypes and contracts for ELLPACK Sparse Matrix-Vector Multiplication GPU Kernel.
 * Module: dense_spmv_ellpack_cuda | Algorithm Family: spmv_csr
 */

#ifndef DENSE_SPMV_ELLPACK_CUDA_INTERFACE_H
#define DENSE_SPMV_ELLPACK_CUDA_INTERFACE_H

#include "types.cu"

typedef int (*dense_spmv_ellpack_cuda_kernel_fn)(const double* in_vec, double* out_vec, size_t n);

typedef struct dense_spmv_ellpack_cuda_vtable {
    int (*init)(dense_spmv_ellpack_cuda_state_t* state, const dense_spmv_ellpack_cuda_config_t* cfg);
    int (*execute)(dense_spmv_ellpack_cuda_state_t* state, const double* in_vec, double* out_vec, size_t n);
    int (*reset)(dense_spmv_ellpack_cuda_state_t* state);
    int (*destroy)(dense_spmv_ellpack_cuda_state_t* state);
} dense_spmv_ellpack_cuda_vtable_t;

#endif /* DENSE_SPMV_ELLPACK_CUDA_INTERFACE_H */
