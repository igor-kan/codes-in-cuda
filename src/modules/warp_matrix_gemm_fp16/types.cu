/**
 * @file types.cu
 * @brief Core types and configuration for Tensor Core WMMA FP16 Matrix Multiplication Pipeline.
 * Module: warp_matrix_gemm_fp16
 */

#ifndef WARP_MATRIX_GEMM_FP16_TYPES_H
#define WARP_MATRIX_GEMM_FP16_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define WARP_MATRIX_GEMM_FP16_ALIGNMENT 64
#define WARP_MATRIX_GEMM_FP16_CAPACITY 4096

typedef struct warp_matrix_gemm_fp16_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} warp_matrix_gemm_fp16_config_t;

typedef struct warp_matrix_gemm_fp16_state {
    void* buffer;
    size_t count;
    uint64_t cycles;
    warp_matrix_gemm_fp16_config_t config;
} warp_matrix_gemm_fp16_state_t;

#endif /* WARP_MATRIX_GEMM_FP16_TYPES_H */
