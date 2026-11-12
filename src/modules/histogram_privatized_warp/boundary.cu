/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Warp-Aggregated Privatized Shared Histogram.
 * Module: histogram_privatized_warp
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool histogram_privatized_warp_is_finite(double v) {
    return isfinite(v);
}

static inline double histogram_privatized_warp_clamp_range(double v, double lo, double hi) {
    if (!isfinite(v)) return 0.0;
    if (v < lo) return lo;
    if (v > hi) return hi;
    return v;
}
