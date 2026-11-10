/**
 * @file types.cu
 * @brief Core types and configuration for Single-Pass Decoupled Look-Back Parallel Radix Sort.
 * Module: radix_sort_onesweep
 */

#ifndef RADIX_SORT_ONESWEEP_TYPES_H
#define RADIX_SORT_ONESWEEP_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define RADIX_SORT_ONESWEEP_ALIGNMENT 64
#define RADIX_SORT_ONESWEEP_CAPACITY 4096

typedef struct radix_sort_onesweep_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} radix_sort_onesweep_config_t;

typedef struct radix_sort_onesweep_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    radix_sort_onesweep_config_t config;
} radix_sort_onesweep_state_t;

#endif /* RADIX_SORT_ONESWEEP_TYPES_H */
