/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for Asynchronous Memory Copy Pipeline with Streams.
 * Module: async_pipeline_cuda12
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool async_pipeline_cuda12_is_valid_float(double x) {
    return isfinite(x);
}

static inline double async_pipeline_cuda12_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
