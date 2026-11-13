/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Warp Ballot Voting and Shuffle-Down Tree Reduction.
 * Module: warp_divergence_reduction | Algorithm Family: warp_reduction
 */

#ifndef WARP_DIVERGENCE_REDUCTION_TYPES_H
#define WARP_DIVERGENCE_REDUCTION_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define WARP_DIVERGENCE_REDUCTION_ALIGNMENT 64
#define WARP_DIVERGENCE_REDUCTION_CAPACITY 2048

typedef struct warp_divergence_reduction_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} warp_divergence_reduction_config_t;

typedef struct warp_divergence_reduction_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    double accumulator;
    warp_divergence_reduction_config_t config;
} warp_divergence_reduction_state_t;

#endif /* WARP_DIVERGENCE_REDUCTION_TYPES_H */
