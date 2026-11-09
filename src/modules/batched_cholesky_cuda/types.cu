/**
 * @file types.cu
 * @brief Core types and configuration for Batched Small-Matrix Cholesky Decomposition.
 * Module: batched_cholesky_cuda
 */

#ifndef BATCHED_CHOLESKY_CUDA_TYPES_H
#define BATCHED_CHOLESKY_CUDA_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define BATCHED_CHOLESKY_CUDA_ALIGNMENT 64
#define BATCHED_CHOLESKY_CUDA_CAPACITY 2048

typedef struct batched_cholesky_cuda_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} batched_cholesky_cuda_config_t;

typedef struct batched_cholesky_cuda_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    batched_cholesky_cuda_config_t config;
} batched_cholesky_cuda_state_t;

#endif /* BATCHED_CHOLESKY_CUDA_TYPES_H */
