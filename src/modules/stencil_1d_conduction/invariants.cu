/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for 1D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_1d_conduction
 */

#include <assert.h>
#include <math.h>

static inline void stencil_1d_conduction_check_invariants(double input, double output) {
    if (input == 0.0) {
        assert(output == 0.0 || fabs(output) < 1e-12);
    }
    if (isfinite(input)) {
        assert(isfinite(output));
    }
}
