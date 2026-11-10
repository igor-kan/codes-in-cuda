/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for 3D 25-Point High-Order Acoustic Wave Stencil.
 * Module: stencil_3d_acoustic
 */

#include <assert.h>
#include <math.h>

static inline void stencil_3d_acoustic_verify_contract(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
