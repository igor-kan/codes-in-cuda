/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Shared Memory Matrix Transpose with Bank Padding.
 * Module: matrix_transpose_pad
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool matrix_transpose_pad_is_finite(double v) {
    return isfinite(v);
}

static inline double matrix_transpose_pad_clamp_range(double v, double lo, double hi) {
    if (!isfinite(v)) return 0.0;
    if (v < lo) return lo;
    if (v > hi) return hi;
    return v;
}
