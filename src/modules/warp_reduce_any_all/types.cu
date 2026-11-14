/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all | Algorithm Family: warp_reduction
 */

#ifndef WARP_REDUCE_ANY_ALL_TYPES_H
#define WARP_REDUCE_ANY_ALL_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define WARP_REDUCE_ANY_ALL_ALIGNMENT 64
#define WARP_REDUCE_ANY_ALL_CAPACITY 4096

typedef struct warp_reduce_any_all_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} warp_reduce_any_all_config_t;

typedef struct warp_reduce_any_all_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    double accumulator;
    warp_reduce_any_all_config_t config;
} warp_reduce_any_all_state_t;

#endif /* WARP_REDUCE_ANY_ALL_TYPES_H */
