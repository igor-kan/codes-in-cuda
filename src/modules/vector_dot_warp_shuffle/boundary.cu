/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Warp-Shuffle Vector Inner Product with Threadblock.
 * Module: vector_dot_warp_shuffle
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool vector_dot_warp_shuffle_is_finite_val(double v) {
    return isfinite(v);
}

static inline double vector_dot_warp_shuffle_clamp_val(double v, double min_v, double max_v) {
    if (!isfinite(v)) return 0.0;
    if (v < min_v) return min_v;
    if (v > max_v) return max_v;
    return v;
}
