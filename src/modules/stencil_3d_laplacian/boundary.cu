/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for 3D 7-Point Laplacian Stencil with Shared Memory.
 * Module: stencil_3d_laplacian
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool stencil_3d_laplacian_is_valid_float(double x) {
    return isfinite(x);
}

static inline double stencil_3d_laplacian_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
