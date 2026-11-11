/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for 2D Acoustic Wave Propagation Stencil with Shared Halo.
 * Module: stencil_2d_wave_equation
 */

#include <assert.h>
#include <math.h>

static inline void stencil_2d_wave_equation_verify_contract_day47(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
