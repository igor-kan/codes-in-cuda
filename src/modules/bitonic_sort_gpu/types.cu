/**
 * @file types.cu
 * @brief Core types and configuration for Shared-Memory GPU Bitonic Sorting Network.
 * Module: bitonic_sort_gpu
 */

#ifndef BITONIC_SORT_GPU_TYPES_H
#define BITONIC_SORT_GPU_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define BITONIC_SORT_GPU_ALIGNMENT 64
#define BITONIC_SORT_GPU_DEFAULT_CAPACITY 1024

typedef struct bitonic_sort_gpu_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} bitonic_sort_gpu_config_t;

typedef struct bitonic_sort_gpu_state {
    void* memory_arena;
    size_t count;
    uint64_t metric_cycles;
    bitonic_sort_gpu_config_t config;
} bitonic_sort_gpu_state_t;

#endif /* BITONIC_SORT_GPU_TYPES_H */
