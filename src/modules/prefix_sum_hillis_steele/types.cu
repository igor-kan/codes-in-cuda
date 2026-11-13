/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele | Algorithm Family: prefix_scan
 */

#ifndef PREFIX_SUM_HILLIS_STEELE_TYPES_H
#define PREFIX_SUM_HILLIS_STEELE_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define PREFIX_SUM_HILLIS_STEELE_ALIGNMENT 64
#define PREFIX_SUM_HILLIS_STEELE_CAPACITY 2048

typedef struct prefix_sum_hillis_steele_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} prefix_sum_hillis_steele_config_t;

typedef struct prefix_sum_hillis_steele_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    double accumulator;
    prefix_sum_hillis_steele_config_t config;
} prefix_sum_hillis_steele_state_t;

#endif /* PREFIX_SUM_HILLIS_STEELE_TYPES_H */
