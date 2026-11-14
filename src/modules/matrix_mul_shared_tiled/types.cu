/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for 2D Shared-Memory Tiled Matrix Multiplication Kernel.
 * Module: matrix_mul_shared_tiled | Algorithm Family: matrix_pad
 */

#ifndef MATRIX_MUL_SHARED_TILED_TYPES_H
#define MATRIX_MUL_SHARED_TILED_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define MATRIX_MUL_SHARED_TILED_ALIGNMENT 64
#define MATRIX_MUL_SHARED_TILED_CAPACITY 4096

typedef struct matrix_mul_shared_tiled_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} matrix_mul_shared_tiled_config_t;

typedef struct matrix_mul_shared_tiled_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    double accumulator;
    matrix_mul_shared_tiled_config_t config;
} matrix_mul_shared_tiled_state_t;

#endif /* MATRIX_MUL_SHARED_TILED_TYPES_H */
