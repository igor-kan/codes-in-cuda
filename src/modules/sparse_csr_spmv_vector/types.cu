/**
 * @file types.cu
 * @brief Core types and configuration for Vector-Based CSR Sparse Matrix-Vector Kernel.
 * Module: sparse_csr_spmv_vector
 */

#ifndef SPARSE_CSR_SPMV_VECTOR_TYPES_H
#define SPARSE_CSR_SPMV_VECTOR_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define SPARSE_CSR_SPMV_VECTOR_ALIGNMENT 64
#define SPARSE_CSR_SPMV_VECTOR_CAPACITY 4096

typedef struct sparse_csr_spmv_vector_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} sparse_csr_spmv_vector_config_t;

typedef struct sparse_csr_spmv_vector_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    sparse_csr_spmv_vector_config_t config;
} sparse_csr_spmv_vector_state_t;

#endif /* SPARSE_CSR_SPMV_VECTOR_TYPES_H */
