/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Warp Ballot Voting and Shuffle-Down Tree Reduction.
 * Module: warp_divergence_reduction
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool warp_divergence_reduction_check_finite(double v) {
    return isfinite(v);
}

static inline double warp_divergence_reduction_bound_clamp(double v, double min_v, double max_v) {
    if (!isfinite(v)) return 0.0;
    if (v < min_v) return min_v;
    if (v > max_v) return max_v;
    return v;
}
