/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Warp-Aggregated Privatized Shared Histogram.
 * Module: histogram_privatized_warp | Algorithm Family: histogram
 */

#ifndef HISTOGRAM_PRIVATIZED_WARP_TYPES_H
#define HISTOGRAM_PRIVATIZED_WARP_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define HISTOGRAM_PRIVATIZED_WARP_ALIGNMENT 64
#define HISTOGRAM_PRIVATIZED_WARP_BASE_CAPACITY 1024

typedef struct histogram_privatized_warp_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} histogram_privatized_warp_config_t;

typedef struct histogram_privatized_warp_state {
    void* buffer;
    size_t count;
    uint64_t operations;
    double accumulator;
    histogram_privatized_warp_config_t config;
} histogram_privatized_warp_state_t;

#endif /* HISTOGRAM_PRIVATIZED_WARP_TYPES_H */
