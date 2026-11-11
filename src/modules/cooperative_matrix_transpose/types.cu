/**
 * @file types.cu
 * @brief Core types and configuration for Grid Cooperative 2D Matrix Transpose with Bank Padding.
 * Module: cooperative_matrix_transpose
 */

#ifndef COOPERATIVE_MATRIX_TRANSPOSE_TYPES_H
#define COOPERATIVE_MATRIX_TRANSPOSE_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define COOPERATIVE_MATRIX_TRANSPOSE_ALIGNMENT 64
#define COOPERATIVE_MATRIX_TRANSPOSE_DEFAULT_SZ 8192

typedef struct cooperative_matrix_transpose_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} cooperative_matrix_transpose_config_t;

typedef struct cooperative_matrix_transpose_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    cooperative_matrix_transpose_config_t config;
} cooperative_matrix_transpose_state_t;

#endif /* COOPERATIVE_MATRIX_TRANSPOSE_TYPES_H */
