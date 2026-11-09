/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for 3D 7-Point Laplacian Stencil with Shared Memory.
 * Module: stencil_3d_laplacian
 */

#include <assert.h>
#include <math.h>

static inline void stencil_3d_laplacian_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
