/**
 * Boundary condition checking and IEEE-754 edge-case handlers for Bank-Conflict-Free 2D Matrix Transposition.
 * Module: matrix_transpose_bank_conflict
 */

#ifndef BOUNDARY_MATRIX_TRANSPOSE_BANK_CONFLICT_H
#define BOUNDARY_MATRIX_TRANSPOSE_BANK_CONFLICT_H

#include <math.h>
#include <stdbool.h>

static inline bool matrix_transpose_bank_conflict_is_finite_input(double x) {
    return isfinite(x);
}

static inline double matrix_transpose_bank_conflict_clamp(double val, double min_val, double max_val) {
    const double t = val < min_val ? min_val : val;
    return t > max_val ? max_val : t;
}

#endif /* BOUNDARY_MATRIX_TRANSPOSE_BANK_CONFLICT_H */
