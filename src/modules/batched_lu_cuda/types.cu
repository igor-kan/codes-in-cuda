/**
 * @file types.cu
 * @brief Core types and configuration for Batched Small-Matrix LU Decomposition with Partial Pivoting.
 * Module: batched_lu_cuda
 */

#ifndef BATCHED_LU_CUDA_TYPES_H
#define BATCHED_LU_CUDA_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define BATCHED_LU_CUDA_ALIGNMENT 64
#define BATCHED_LU_CUDA_DEFAULT_SZ 8192

typedef struct batched_lu_cuda_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} batched_lu_cuda_config_t;

typedef struct batched_lu_cuda_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    batched_lu_cuda_config_t config;
} batched_lu_cuda_state_t;

#endif /* BATCHED_LU_CUDA_TYPES_H */
