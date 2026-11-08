/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for Shared-Memory GPU Bitonic Sorting Network.
 * Module: bitonic_sort_gpu
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool bitonic_sort_gpu_is_valid_float(double x) {
    return isfinite(x);
}

static inline double bitonic_sort_gpu_sanitize_input(double x, double min_bound, double max_bound) {
    if (!isfinite(x)) return 0.0;
    if (x < min_bound) return min_bound;
    if (x > max_bound) return max_bound;
    return x;
}
