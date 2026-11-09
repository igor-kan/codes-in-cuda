/**
 * @file types.cu
 * @brief Core types and configuration for Sparse Matrix Dense Matrix (SpMM) GPU Accelerator.
 * Module: sparse_spmm_csr_cuda
 */

#ifndef SPARSE_SPMM_CSR_CUDA_TYPES_H
#define SPARSE_SPMM_CSR_CUDA_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define SPARSE_SPMM_CSR_CUDA_ALIGNMENT 64
#define SPARSE_SPMM_CSR_CUDA_CAPACITY 2048

typedef struct sparse_spmm_csr_cuda_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} sparse_spmm_csr_cuda_config_t;

typedef struct sparse_spmm_csr_cuda_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    sparse_spmm_csr_cuda_config_t config;
} sparse_spmm_csr_cuda_state_t;

#endif /* SPARSE_SPMM_CSR_CUDA_TYPES_H */
