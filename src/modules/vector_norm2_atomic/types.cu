/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Parallel Two-Pass Euclidean Vector Norm Reduction.
 * Module: vector_norm2_atomic | Algorithm Family: norm_reduce
 */

#ifndef VECTOR_NORM2_ATOMIC_TYPES_H
#define VECTOR_NORM2_ATOMIC_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define VECTOR_NORM2_ATOMIC_ALIGNMENT 64
#define VECTOR_NORM2_ATOMIC_BASE_CAPACITY 1024

typedef struct vector_norm2_atomic_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} vector_norm2_atomic_config_t;

typedef struct vector_norm2_atomic_state {
    void* buffer;
    size_t count;
    uint64_t operations;
    double accumulator;
    vector_norm2_atomic_config_t config;
} vector_norm2_atomic_state_t;

#endif /* VECTOR_NORM2_ATOMIC_TYPES_H */
