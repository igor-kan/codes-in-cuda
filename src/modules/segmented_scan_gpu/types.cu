/**
 * @file types.cu
 * @brief Core types and configuration for GPU Segmented Work-Efficient Prefix Scan.
 * Module: segmented_scan_gpu
 */

#ifndef SEGMENTED_SCAN_GPU_TYPES_H
#define SEGMENTED_SCAN_GPU_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define SEGMENTED_SCAN_GPU_ALIGNMENT 64
#define SEGMENTED_SCAN_GPU_DEFAULT_CAPACITY 1024

typedef struct segmented_scan_gpu_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} segmented_scan_gpu_config_t;

typedef struct segmented_scan_gpu_state {
    void* memory_arena;
    size_t count;
    uint64_t metric_cycles;
    segmented_scan_gpu_config_t config;
} segmented_scan_gpu_state_t;

#endif /* SEGMENTED_SCAN_GPU_TYPES_H */
