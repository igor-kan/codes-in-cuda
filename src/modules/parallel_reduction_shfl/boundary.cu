/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for Warp-Synchronous Parallel Reduction via Shuffles.
 * Module: parallel_reduction_shfl
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool parallel_reduction_shfl_is_valid_float(double x) {
    return isfinite(x);
}

static inline double parallel_reduction_shfl_sanitize_input(double x, double min_bound, double max_bound) {
    if (!isfinite(x)) return 0.0;
    if (x < min_bound) return min_bound;
    if (x > max_bound) return max_bound;
    return x;
}
