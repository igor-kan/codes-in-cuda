/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for 2D Block-Tiled Matrix GEMM with Double-Buffering.
 * Module: gemm_shared_tiled
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool gemm_shared_tiled_is_valid_float(double x) {
    return isfinite(x);
}

static inline double gemm_shared_tiled_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
