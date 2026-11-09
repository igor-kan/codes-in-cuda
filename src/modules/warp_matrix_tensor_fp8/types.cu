/**
 * @file types.cu
 * @brief Core types and configuration for Tensor Core FP8/FP16 Mixed-Precision MMA Kernel.
 * Module: warp_matrix_tensor_fp8
 */

#ifndef WARP_MATRIX_TENSOR_FP8_TYPES_H
#define WARP_MATRIX_TENSOR_FP8_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define WARP_MATRIX_TENSOR_FP8_ALIGNMENT 64
#define WARP_MATRIX_TENSOR_FP8_CAPACITY 2048

typedef struct warp_matrix_tensor_fp8_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} warp_matrix_tensor_fp8_config_t;

typedef struct warp_matrix_tensor_fp8_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    warp_matrix_tensor_fp8_config_t config;
} warp_matrix_tensor_fp8_state_t;

#endif /* WARP_MATRIX_TENSOR_FP8_TYPES_H */
