/**
 * @file types.cu
 * @brief Core types and configuration for GPU Fast K-th Selection via Radix Partitioning.
 * Module: parallel_radix_select
 */

#ifndef PARALLEL_RADIX_SELECT_TYPES_H
#define PARALLEL_RADIX_SELECT_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define PARALLEL_RADIX_SELECT_ALIGNMENT 64
#define PARALLEL_RADIX_SELECT_CAPACITY 2048

typedef struct parallel_radix_select_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} parallel_radix_select_config_t;

typedef struct parallel_radix_select_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    parallel_radix_select_config_t config;
} parallel_radix_select_state_t;

#endif /* PARALLEL_RADIX_SELECT_TYPES_H */
