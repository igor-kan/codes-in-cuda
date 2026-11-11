/**
 * @file types.cu
 * @brief Core types and configuration for Tensor Core BF16 Mixed-Precision MMA GEMM Pipeline.
 * Module: warp_matrix_tensor_bf16
 */

#ifndef WARP_MATRIX_TENSOR_BF16_TYPES_H
#define WARP_MATRIX_TENSOR_BF16_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define WARP_MATRIX_TENSOR_BF16_ALIGNMENT 64
#define WARP_MATRIX_TENSOR_BF16_DEFAULT_SZ 8192

typedef struct warp_matrix_tensor_bf16_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} warp_matrix_tensor_bf16_config_t;

typedef struct warp_matrix_tensor_bf16_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    warp_matrix_tensor_bf16_config_t config;
} warp_matrix_tensor_bf16_state_t;

#endif /* WARP_MATRIX_TENSOR_BF16_TYPES_H */
