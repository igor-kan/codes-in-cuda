/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool warp_reduce_any_all_is_finite_val(double v) {
    return isfinite(v);
}

static inline double warp_reduce_any_all_clamp_val(double v, double min_v, double max_v) {
    if (!isfinite(v)) return 0.0;
    if (v < min_v) return min_v;
    if (v > max_v) return max_v;
    return v;
}
