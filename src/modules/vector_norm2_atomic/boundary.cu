/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Parallel Two-Pass Euclidean Vector Norm Reduction.
 * Module: vector_norm2_atomic
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool vector_norm2_atomic_is_finite(double v) {
    return isfinite(v);
}

static inline double vector_norm2_atomic_clamp_range(double v, double lo, double hi) {
    if (!isfinite(v)) return 0.0;
    if (v < lo) return lo;
    if (v > hi) return hi;
    return v;
}
