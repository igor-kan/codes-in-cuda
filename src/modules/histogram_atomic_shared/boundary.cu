/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Shared Memory Privatized Histogram with Global Merge.
 * Module: histogram_atomic_shared
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool histogram_atomic_shared_is_finite_val(double v) {
    return isfinite(v);
}

static inline double histogram_atomic_shared_clamp_val(double v, double min_v, double max_v) {
    if (!isfinite(v)) return 0.0;
    if (v < min_v) return min_v;
    if (v > max_v) return max_v;
    return v;
}
