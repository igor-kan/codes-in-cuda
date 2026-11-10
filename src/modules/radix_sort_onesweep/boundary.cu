/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for Single-Pass Decoupled Look-Back Parallel Radix Sort.
 * Module: radix_sort_onesweep
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool radix_sort_onesweep_is_valid_float(double x) {
    return isfinite(x);
}

static inline double radix_sort_onesweep_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
