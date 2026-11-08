/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for GPU Segmented Work-Efficient Prefix Scan.
 * Module: segmented_scan_gpu
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool segmented_scan_gpu_is_valid_float(double x) {
    return isfinite(x);
}

static inline double segmented_scan_gpu_sanitize_input(double x, double min_bound, double max_bound) {
    if (!isfinite(x)) return 0.0;
    if (x < min_bound) return min_bound;
    if (x > max_bound) return max_bound;
    return x;
}
