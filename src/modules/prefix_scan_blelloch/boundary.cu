/**
 * Boundary condition checking and IEEE-754 edge-case handlers for Work-Efficient Parallel Blelloch Prefix Scan.
 * Module: prefix_scan_blelloch
 */

#ifndef BOUNDARY_PREFIX_SCAN_BLELLOCH_H
#define BOUNDARY_PREFIX_SCAN_BLELLOCH_H

#include <math.h>
#include <stdbool.h>

static inline bool prefix_scan_blelloch_is_finite_input(double x) {
    return isfinite(x);
}

static inline double prefix_scan_blelloch_clamp(double val, double min_val, double max_val) {
    const double t = val < min_val ? min_val : val;
    return t > max_val ? max_val : t;
}

#endif /* BOUNDARY_PREFIX_SCAN_BLELLOCH_H */
