/**
 * @file types.cu
 * @brief Core types and configuration for Asynchronous Memory Copy Pipeline with Streams.
 * Module: async_pipeline_cuda12
 */

#ifndef ASYNC_PIPELINE_CUDA12_TYPES_H
#define ASYNC_PIPELINE_CUDA12_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define ASYNC_PIPELINE_CUDA12_ALIGNMENT 64
#define ASYNC_PIPELINE_CUDA12_CAPACITY 2048

typedef struct async_pipeline_cuda12_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} async_pipeline_cuda12_config_t;

typedef struct async_pipeline_cuda12_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    async_pipeline_cuda12_config_t config;
} async_pipeline_cuda12_state_t;

#endif /* ASYNC_PIPELINE_CUDA12_TYPES_H */
