/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for Grid Cooperative 2D Matrix Transpose with Bank Padding.
 * Module: cooperative_matrix_transpose
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool cooperative_matrix_transpose_is_valid_float(double x) {
    return isfinite(x);
}

static inline double cooperative_matrix_transpose_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
