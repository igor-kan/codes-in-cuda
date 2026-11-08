/**
 * Boundary condition checking and IEEE-754 edge-case handlers for Block-Level Reduction with Atomic Accumulator.
 * Module: vector_dot_product_atomic
 */

#ifndef BOUNDARY_VECTOR_DOT_PRODUCT_ATOMIC_H
#define BOUNDARY_VECTOR_DOT_PRODUCT_ATOMIC_H

#include <math.h>
#include <stdbool.h>

static inline bool vector_dot_product_atomic_is_finite_input(double x) {
    return isfinite(x);
}

static inline double vector_dot_product_atomic_clamp(double val, double min_val, double max_val) {
    const double t = val < min_val ? min_val : val;
    return t > max_val ? max_val : t;
}

#endif /* BOUNDARY_VECTOR_DOT_PRODUCT_ATOMIC_H */
