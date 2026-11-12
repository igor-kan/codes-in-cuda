/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Warp-Per-Row Dense Matrix-Vector Multiplication.
 * Module: dense_gemv_warp
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool dense_gemv_warp_is_finite(double v) {
    return isfinite(v);
}

static inline double dense_gemv_warp_clamp_range(double v, double lo, double hi) {
    if (!isfinite(v)) return 0.0;
    if (v < lo) return lo;
    if (v > hi) return hi;
    return v;
}
