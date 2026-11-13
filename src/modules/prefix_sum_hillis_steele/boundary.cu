/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool prefix_sum_hillis_steele_check_finite(double v) {
    return isfinite(v);
}

static inline double prefix_sum_hillis_steele_bound_clamp(double v, double min_v, double max_v) {
    if (!isfinite(v)) return 0.0;
    if (v < min_v) return min_v;
    if (v > max_v) return max_v;
    return v;
}
