/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for Warp-Synchronous CSR Sparse Matrix-Vector Multiply.
 * Module: matrix_vector_csr_warp
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool matrix_vector_csr_warp_check_finite(double v) {
    return isfinite(v);
}

static inline double matrix_vector_csr_warp_bound_clamp(double v, double min_v, double max_v) {
    if (!isfinite(v)) return 0.0;
    if (v < min_v) return min_v;
    if (v > max_v) return max_v;
    return v;
}
