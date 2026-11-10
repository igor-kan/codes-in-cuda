/**
 * @file types.cu
 * @brief Core types and configuration for Stream Compaction and Filtering via Parallel Scan.
 * Module: parallel_compact_stream
 */

#ifndef PARALLEL_COMPACT_STREAM_TYPES_H
#define PARALLEL_COMPACT_STREAM_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define PARALLEL_COMPACT_STREAM_ALIGNMENT 64
#define PARALLEL_COMPACT_STREAM_CAPACITY 4096

typedef struct parallel_compact_stream_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} parallel_compact_stream_config_t;

typedef struct parallel_compact_stream_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    parallel_compact_stream_config_t config;
} parallel_compact_stream_state_t;

#endif /* PARALLEL_COMPACT_STREAM_TYPES_H */
