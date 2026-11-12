/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Shared Memory Matrix Transpose with Bank Padding.
 * Module: matrix_transpose_pad | Algorithm Family: matrix_pad
 */

#ifndef MATRIX_TRANSPOSE_PAD_TYPES_H
#define MATRIX_TRANSPOSE_PAD_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define MATRIX_TRANSPOSE_PAD_ALIGNMENT 64
#define MATRIX_TRANSPOSE_PAD_BASE_CAPACITY 1024

typedef struct matrix_transpose_pad_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} matrix_transpose_pad_config_t;

typedef struct matrix_transpose_pad_state {
    void* buffer;
    size_t count;
    uint64_t operations;
    double accumulator;
    matrix_transpose_pad_config_t config;
} matrix_transpose_pad_state_t;

#endif /* MATRIX_TRANSPOSE_PAD_TYPES_H */
