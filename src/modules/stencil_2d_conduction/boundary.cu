/**
 * Boundary condition checking and IEEE-754 edge-case handlers for 9-Point Thermal Conduction Stencil with Shared Memory.
 * Module: stencil_2d_conduction
 */

#ifndef BOUNDARY_STENCIL_2D_CONDUCTION_H
#define BOUNDARY_STENCIL_2D_CONDUCTION_H

#include <math.h>
#include <stdbool.h>

static inline bool stencil_2d_conduction_is_finite_input(double x) {
    return isfinite(x);
}

static inline double stencil_2d_conduction_clamp(double val, double min_val, double max_val) {
    const double t = val < min_val ? min_val : val;
    return t > max_val ? max_val : t;
}

#endif /* BOUNDARY_STENCIL_2D_CONDUCTION_H */
