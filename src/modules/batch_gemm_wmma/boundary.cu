/**
 * Boundary condition checking and IEEE-754 edge-case handlers for Tensor Core WMMA Mixed-Precision GEMM Acceleration.
 * Module: batch_gemm_wmma
 */

#ifndef BOUNDARY_BATCH_GEMM_WMMA_H
#define BOUNDARY_BATCH_GEMM_WMMA_H

#include <math.h>
#include <stdbool.h>

static inline bool batch_gemm_wmma_is_finite_input(double x) {
    return isfinite(x);
}

static inline double batch_gemm_wmma_clamp(double val, double min_val, double max_val) {
    const double t = val < min_val ? min_val : val;
    return t > max_val ? max_val : t;
}

#endif /* BOUNDARY_BATCH_GEMM_WMMA_H */
