/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for 1D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_1d_conduction
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool stencil_1d_conduction_is_finite(double v) {
    return isfinite(v);
}

static inline double stencil_1d_conduction_clamp_range(double v, double lo, double hi) {
    if (!isfinite(v)) return 0.0;
    if (v < lo) return lo;
    if (v > hi) return hi;
    return v;
}
