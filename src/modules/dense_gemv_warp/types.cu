/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Warp-Per-Row Dense Matrix-Vector Multiplication.
 * Module: dense_gemv_warp | Algorithm Family: gemv_warp
 */

#ifndef DENSE_GEMV_WARP_TYPES_H
#define DENSE_GEMV_WARP_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define DENSE_GEMV_WARP_ALIGNMENT 64
#define DENSE_GEMV_WARP_BASE_CAPACITY 1024

typedef struct dense_gemv_warp_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} dense_gemv_warp_config_t;

typedef struct dense_gemv_warp_state {
    void* buffer;
    size_t count;
    uint64_t operations;
    double accumulator;
    dense_gemv_warp_config_t config;
} dense_gemv_warp_state_t;

#endif /* DENSE_GEMV_WARP_TYPES_H */
