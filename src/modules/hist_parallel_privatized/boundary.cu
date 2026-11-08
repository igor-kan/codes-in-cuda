/**
 * Boundary condition checking and IEEE-754 edge-case handlers for Privatized Shared Memory Histogram with Min-Max.
 * Module: hist_parallel_privatized
 */

#ifndef BOUNDARY_HIST_PARALLEL_PRIVATIZED_H
#define BOUNDARY_HIST_PARALLEL_PRIVATIZED_H

#include <math.h>
#include <stdbool.h>

static inline bool hist_parallel_privatized_is_finite_input(double x) {
    return isfinite(x);
}

static inline double hist_parallel_privatized_clamp(double val, double min_val, double max_val) {
    const double t = val < min_val ? min_val : val;
    return t > max_val ? max_val : t;
}

#endif /* BOUNDARY_HIST_PARALLEL_PRIVATIZED_H */
