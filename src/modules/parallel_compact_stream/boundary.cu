/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for Stream Compaction and Filtering via Parallel Scan.
 * Module: parallel_compact_stream
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool parallel_compact_stream_is_valid_float(double x) {
    return isfinite(x);
}

static inline double parallel_compact_stream_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
