/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Warp-Synchronous CSR Sparse Matrix-Vector Multiply.
 * Module: matrix_vector_csr_warp | Algorithm Family: spmv_csr
 */

#ifndef MATRIX_VECTOR_CSR_WARP_TYPES_H
#define MATRIX_VECTOR_CSR_WARP_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define MATRIX_VECTOR_CSR_WARP_ALIGNMENT 64
#define MATRIX_VECTOR_CSR_WARP_CAPACITY 2048

typedef struct matrix_vector_csr_warp_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} matrix_vector_csr_warp_config_t;

typedef struct matrix_vector_csr_warp_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    double accumulator;
    matrix_vector_csr_warp_config_t config;
} matrix_vector_csr_warp_state_t;

#endif /* MATRIX_VECTOR_CSR_WARP_TYPES_H */
