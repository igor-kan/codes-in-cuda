/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for 2D Acoustic Wave Propagation Stencil with Shared Halo.
 * Module: stencil_2d_wave_equation
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool stencil_2d_wave_equation_is_valid_float(double x) {
    return isfinite(x);
}

static inline double stencil_2d_wave_equation_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
