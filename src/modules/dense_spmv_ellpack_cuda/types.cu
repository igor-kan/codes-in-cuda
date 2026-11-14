/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for ELLPACK Sparse Matrix-Vector Multiplication GPU Kernel.
 * Module: dense_spmv_ellpack_cuda | Algorithm Family: spmv_csr
 */

#ifndef DENSE_SPMV_ELLPACK_CUDA_TYPES_H
#define DENSE_SPMV_ELLPACK_CUDA_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define DENSE_SPMV_ELLPACK_CUDA_ALIGNMENT 64
#define DENSE_SPMV_ELLPACK_CUDA_CAPACITY 4096

typedef struct dense_spmv_ellpack_cuda_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} dense_spmv_ellpack_cuda_config_t;

typedef struct dense_spmv_ellpack_cuda_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    double accumulator;
    dense_spmv_ellpack_cuda_config_t config;
} dense_spmv_ellpack_cuda_state_t;

#endif /* DENSE_SPMV_ELLPACK_CUDA_TYPES_H */
