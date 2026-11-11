/**
 * @file types.cu
 * @brief Core types and configuration for CUDA Stream-Ordered Memory Allocator Pipeline.
 * Module: stream_ordered_memory_alloc
 */

#ifndef STREAM_ORDERED_MEMORY_ALLOC_TYPES_H
#define STREAM_ORDERED_MEMORY_ALLOC_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define STREAM_ORDERED_MEMORY_ALLOC_ALIGNMENT 64
#define STREAM_ORDERED_MEMORY_ALLOC_DEFAULT_SZ 8192

typedef struct stream_ordered_memory_alloc_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} stream_ordered_memory_alloc_config_t;

typedef struct stream_ordered_memory_alloc_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    stream_ordered_memory_alloc_config_t config;
} stream_ordered_memory_alloc_state_t;

#endif /* STREAM_ORDERED_MEMORY_ALLOC_TYPES_H */
