/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool conv2d_im2col_gemm_is_valid_float(double x) {
    return isfinite(x);
}

static inline double conv2d_im2col_gemm_sanitize_input(double x, double min_bound, double max_bound) {
    if (!isfinite(x)) return 0.0;
    if (x < min_bound) return min_bound;
    if (x > max_bound) return max_bound;
    return x;
}
