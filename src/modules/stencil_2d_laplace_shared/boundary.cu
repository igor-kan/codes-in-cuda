/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for 2D 5-Point Laplace Stencil with Shared Memory Halo.
 * Module: stencil_2d_laplace_shared
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool stencil_2d_laplace_shared_check_finite(double v) {
    return isfinite(v);
}

static inline double stencil_2d_laplace_shared_bound_clamp(double v, double min_v, double max_v) {
    if (!isfinite(v)) return 0.0;
    if (v < min_v) return min_v;
    if (v > max_v) return max_v;
    return v;
}
