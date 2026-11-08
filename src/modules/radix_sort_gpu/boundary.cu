/**
 * Boundary condition checking and IEEE-754 edge-case handlers for GPU Multi-Pass Bitwise Parallel Radix Sort.
 * Module: radix_sort_gpu
 */

#ifndef BOUNDARY_RADIX_SORT_GPU_H
#define BOUNDARY_RADIX_SORT_GPU_H

#include <math.h>
#include <stdbool.h>

static inline bool radix_sort_gpu_is_finite_input(double x) {
    return isfinite(x);
}

static inline double radix_sort_gpu_clamp(double val, double min_val, double max_val) {
    const double t = val < min_val ? min_val : val;
    return t > max_val ? max_val : t;
}

#endif /* BOUNDARY_RADIX_SORT_GPU_H */
