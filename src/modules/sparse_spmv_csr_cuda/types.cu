/**
 * @file types.cu
 * @brief Core types and configuration for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

#ifndef SPARSE_SPMV_CSR_CUDA_TYPES_H
#define SPARSE_SPMV_CSR_CUDA_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define SPARSE_SPMV_CSR_CUDA_ALIGNMENT 64
#define SPARSE_SPMV_CSR_CUDA_DEFAULT_CAPACITY 1024

typedef struct sparse_spmv_csr_cuda_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} sparse_spmv_csr_cuda_config_t;

typedef struct sparse_spmv_csr_cuda_state {
    void* memory_arena;
    size_t count;
    uint64_t metric_cycles;
    sparse_spmv_csr_cuda_config_t config;
} sparse_spmv_csr_cuda_state_t;

#endif /* SPARSE_SPMV_CSR_CUDA_TYPES_H */
