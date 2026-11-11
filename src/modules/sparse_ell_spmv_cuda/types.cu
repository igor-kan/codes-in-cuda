/**
 * @file types.cu
 * @brief Core types and configuration for ELLPACK Sparse Matrix-Vector Multiplication Kernel.
 * Module: sparse_ell_spmv_cuda
 */

#ifndef SPARSE_ELL_SPMV_CUDA_TYPES_H
#define SPARSE_ELL_SPMV_CUDA_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define SPARSE_ELL_SPMV_CUDA_ALIGNMENT 64
#define SPARSE_ELL_SPMV_CUDA_DEFAULT_SZ 8192

typedef struct sparse_ell_spmv_cuda_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} sparse_ell_spmv_cuda_config_t;

typedef struct sparse_ell_spmv_cuda_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    sparse_ell_spmv_cuda_config_t config;
} sparse_ell_spmv_cuda_state_t;

#endif /* SPARSE_ELL_SPMV_CUDA_TYPES_H */
