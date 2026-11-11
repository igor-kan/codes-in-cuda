/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for Tensor Core BF16 Mixed-Precision MMA GEMM Pipeline.
 * Module: warp_matrix_tensor_bf16
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool warp_matrix_tensor_bf16_is_valid_float(double x) {
    return isfinite(x);
}

static inline double warp_matrix_tensor_bf16_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
