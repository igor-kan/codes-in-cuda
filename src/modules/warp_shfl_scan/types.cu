/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Warp-Synchronous Inclusive Prefix Scan via Shuffles.
 * Module: warp_shfl_scan | Algorithm Family: warp_scan
 */

#ifndef WARP_SHFL_SCAN_TYPES_H
#define WARP_SHFL_SCAN_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define WARP_SHFL_SCAN_ALIGNMENT 64
#define WARP_SHFL_SCAN_BASE_CAPACITY 1024

typedef struct warp_shfl_scan_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} warp_shfl_scan_config_t;

typedef struct warp_shfl_scan_state {
    void* buffer;
    size_t count;
    uint64_t operations;
    double accumulator;
    warp_shfl_scan_config_t config;
} warp_shfl_scan_state_t;

#endif /* WARP_SHFL_SCAN_TYPES_H */
