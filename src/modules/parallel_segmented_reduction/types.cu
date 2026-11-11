/**
 * @file types.cu
 * @brief Core types and configuration for GPU Segmented Parallel Reduction with Key Arrays.
 * Module: parallel_segmented_reduction
 */

#ifndef PARALLEL_SEGMENTED_REDUCTION_TYPES_H
#define PARALLEL_SEGMENTED_REDUCTION_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define PARALLEL_SEGMENTED_REDUCTION_ALIGNMENT 64
#define PARALLEL_SEGMENTED_REDUCTION_DEFAULT_SZ 8192

typedef struct parallel_segmented_reduction_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} parallel_segmented_reduction_config_t;

typedef struct parallel_segmented_reduction_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    parallel_segmented_reduction_config_t config;
} parallel_segmented_reduction_state_t;

#endif /* PARALLEL_SEGMENTED_REDUCTION_TYPES_H */
