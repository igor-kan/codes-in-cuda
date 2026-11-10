/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for Tensor Core WMMA FP16 Matrix Multiplication Pipeline.
 * Module: warp_matrix_gemm_fp16
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool warp_matrix_gemm_fp16_is_valid_float(double x) {
    return isfinite(x);
}

static inline double warp_matrix_gemm_fp16_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
