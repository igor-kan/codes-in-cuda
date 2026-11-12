/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Warp-Synchronous Inclusive Prefix Scan via Shuffles.
 * Module: warp_shfl_scan
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool warp_shfl_scan_is_finite(double v) {
    return isfinite(v);
}

static inline double warp_shfl_scan_clamp_range(double v, double lo, double hi) {
    if (!isfinite(v)) return 0.0;
    if (v < lo) return lo;
    if (v > hi) return hi;
    return v;
}
