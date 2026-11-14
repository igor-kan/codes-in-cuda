/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for 2D Shared-Memory Tiled Matrix Multiplication Kernel.
 * Module: matrix_mul_shared_tiled
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool matrix_mul_shared_tiled_is_finite_val(double v) {
    return isfinite(v);
}

static inline double matrix_mul_shared_tiled_clamp_val(double v, double min_v, double max_v) {
    if (!isfinite(v)) return 0.0;
    if (v < min_v) return min_v;
    if (v > max_v) return max_v;
    return v;
}
