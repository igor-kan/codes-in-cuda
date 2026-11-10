/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for 3D 25-Point High-Order Acoustic Wave Stencil.
 * Module: stencil_3d_acoustic
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool stencil_3d_acoustic_is_valid_float(double x) {
    return isfinite(x);
}

static inline double stencil_3d_acoustic_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
