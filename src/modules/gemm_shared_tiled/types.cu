/**
 * @file types.cu
 * @brief Core types and configuration for 2D Block-Tiled Matrix GEMM with Double-Buffering.
 * Module: gemm_shared_tiled
 */

#ifndef GEMM_SHARED_TILED_TYPES_H
#define GEMM_SHARED_TILED_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define GEMM_SHARED_TILED_ALIGNMENT 64
#define GEMM_SHARED_TILED_CAPACITY 2048

typedef struct gemm_shared_tiled_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} gemm_shared_tiled_config_t;

typedef struct gemm_shared_tiled_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    gemm_shared_tiled_config_t config;
} gemm_shared_tiled_state_t;

#endif /* GEMM_SHARED_TILED_TYPES_H */
