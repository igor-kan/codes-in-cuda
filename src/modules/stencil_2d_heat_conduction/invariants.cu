/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for 2D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_2d_heat_conduction
 */

#include <assert.h>
#include <math.h>

static inline void stencil_2d_heat_conduction_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0 || fabs(out_val) < 1e-12);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
