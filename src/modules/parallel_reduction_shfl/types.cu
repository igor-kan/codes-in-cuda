/**
 * @file types.cu
 * @brief Core types and configuration for Warp-Synchronous Parallel Reduction via Shuffles.
 * Module: parallel_reduction_shfl
 */

#ifndef PARALLEL_REDUCTION_SHFL_TYPES_H
#define PARALLEL_REDUCTION_SHFL_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define PARALLEL_REDUCTION_SHFL_ALIGNMENT 64
#define PARALLEL_REDUCTION_SHFL_DEFAULT_CAPACITY 1024

typedef struct parallel_reduction_shfl_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} parallel_reduction_shfl_config_t;

typedef struct parallel_reduction_shfl_state {
    void* memory_arena;
    size_t count;
    uint64_t metric_cycles;
    parallel_reduction_shfl_config_t config;
} parallel_reduction_shfl_state_t;

#endif /* PARALLEL_REDUCTION_SHFL_TYPES_H */
