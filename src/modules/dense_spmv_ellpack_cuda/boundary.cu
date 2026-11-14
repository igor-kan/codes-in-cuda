/**
 * @file boundary.cu
 * @brief Boundary validation, clamping, and edge-case guards for ELLPACK Sparse Matrix-Vector Multiplication GPU Kernel.
 * Module: dense_spmv_ellpack_cuda
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool dense_spmv_ellpack_cuda_is_finite_val(double v) {
    return isfinite(v);
}

static inline double dense_spmv_ellpack_cuda_clamp_val(double v, double min_v, double max_v) {
    if (!isfinite(v)) return 0.0;
    if (v < min_v) return min_v;
    if (v > max_v) return max_v;
    return v;
}
