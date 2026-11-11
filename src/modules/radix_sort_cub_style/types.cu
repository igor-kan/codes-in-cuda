/**
 * @file types.cu
 * @brief Core types and configuration for CUB-Style Parallel Block Radix Sort with Warp Shuffles.
 * Module: radix_sort_cub_style
 */

#ifndef RADIX_SORT_CUB_STYLE_TYPES_H
#define RADIX_SORT_CUB_STYLE_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define RADIX_SORT_CUB_STYLE_ALIGNMENT 64
#define RADIX_SORT_CUB_STYLE_DEFAULT_SZ 8192

typedef struct radix_sort_cub_style_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} radix_sort_cub_style_config_t;

typedef struct radix_sort_cub_style_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    radix_sort_cub_style_config_t config;
} radix_sort_cub_style_state_t;

#endif /* RADIX_SORT_CUB_STYLE_TYPES_H */
