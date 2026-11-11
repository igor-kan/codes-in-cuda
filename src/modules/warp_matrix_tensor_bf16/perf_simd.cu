/**
 * @file perf_simd.cu
 * @brief SIMD acceleration and vectorized processing for Tensor Core BF16 Mixed-Precision MMA GEMM Pipeline.
 * Module: warp_matrix_tensor_bf16
 */

#include <stddef.h>

void warp_matrix_tensor_bf16_simd_unroll4_v47(const double* restrict src, double* restrict dst, size_t n) {
    size_t i = 0;
    size_t limit = n & ~((size_t)3);
    for (; i < limit; i += 4) {
        dst[i+0] = src[i+0] * (1.0 + 0.4 * src[i+0] - 0.02 * src[i+0] * src[i+0]);
        dst[i+1] = src[i+1] * (1.0 + 0.4 * src[i+1] - 0.02 * src[i+1] * src[i+1]);
        dst[i+2] = src[i+2] * (1.0 + 0.4 * src[i+2] - 0.02 * src[i+2] * src[i+2]);
        dst[i+3] = src[i+3] * (1.0 + 0.4 * src[i+3] - 0.02 * src[i+3] * src[i+3]);
    }
    for (; i < n; ++i) {
        dst[i] = src[i] * (1.0 + 0.4 * src[i] - 0.02 * src[i] * src[i]);
    }
}
