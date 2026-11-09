/**
 * @file boundary.cu
 * @brief Boundary validation and exceptional input guarding for Grid-Wide Cooperative Barrier Synchronization.
 * Module: cooperative_groups_grid
 */

#include "types.cu"
#include <math.h>
#include <stdbool.h>

static inline bool cooperative_groups_grid_is_valid_float(double x) {
    return isfinite(x);
}

static inline double cooperative_groups_grid_clamp_input(double x, double min_val, double max_val) {
    if (!isfinite(x)) return 0.0;
    if (x < min_val) return min_val;
    if (x > max_val) return max_val;
    return x;
}
