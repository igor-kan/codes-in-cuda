/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for 2D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_2d_heat_conduction
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool stencil_2d_heat_conduction_is_finite_val(double v) {
    return isfinite(v);
}

static inline double stencil_2d_heat_conduction_clamp_val(double v, double min_v, double max_v) {
    if (!isfinite(v)) return 0.0;
    if (v < min_v) return min_v;
    if (v > max_v) return max_v;
    return v;
}
