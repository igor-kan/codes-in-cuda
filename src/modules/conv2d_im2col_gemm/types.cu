/**
 * @file types.cu
 * @brief Core types and configuration for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

#ifndef CONV2D_IM2COL_GEMM_TYPES_H
#define CONV2D_IM2COL_GEMM_TYPES_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define CONV2D_IM2COL_GEMM_ALIGNMENT 64
#define CONV2D_IM2COL_GEMM_DEFAULT_CAPACITY 1024

typedef struct conv2d_im2col_gemm_config {
    size_t capacity;
    double tolerance;
    uint32_t flags;
} conv2d_im2col_gemm_config_t;

typedef struct conv2d_im2col_gemm_state {
    void* memory_arena;
    size_t count;
    uint64_t metric_cycles;
    conv2d_im2col_gemm_config_t config;
} conv2d_im2col_gemm_state_t;

#endif /* CONV2D_IM2COL_GEMM_TYPES_H */
