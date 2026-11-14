/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Shared Memory Privatized Histogram with Global Merge.
 * Module: histogram_atomic_shared | Algorithm Family: histogram
 */

#ifndef HISTOGRAM_ATOMIC_SHARED_TYPES_H
#define HISTOGRAM_ATOMIC_SHARED_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define HISTOGRAM_ATOMIC_SHARED_ALIGNMENT 64
#define HISTOGRAM_ATOMIC_SHARED_CAPACITY 4096

typedef struct histogram_atomic_shared_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} histogram_atomic_shared_config_t;

typedef struct histogram_atomic_shared_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    double accumulator;
    histogram_atomic_shared_config_t config;
} histogram_atomic_shared_state_t;

#endif /* HISTOGRAM_ATOMIC_SHARED_TYPES_H */
