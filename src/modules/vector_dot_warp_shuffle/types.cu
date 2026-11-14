/**
 * @file types.cu
 * @brief Domain types, memory layouts, and configurations for Warp-Shuffle Vector Inner Product with Threadblock.
 * Module: vector_dot_warp_shuffle | Algorithm Family: norm_reduce
 */

#ifndef VECTOR_DOT_WARP_SHUFFLE_TYPES_H
#define VECTOR_DOT_WARP_SHUFFLE_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define VECTOR_DOT_WARP_SHUFFLE_ALIGNMENT 64
#define VECTOR_DOT_WARP_SHUFFLE_CAPACITY 4096

typedef struct vector_dot_warp_shuffle_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
    uint64_t seed;
} vector_dot_warp_shuffle_config_t;

typedef struct vector_dot_warp_shuffle_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    double accumulator;
    vector_dot_warp_shuffle_config_t config;
} vector_dot_warp_shuffle_state_t;

#endif /* VECTOR_DOT_WARP_SHUFFLE_TYPES_H */
