/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for 2D 5-Point Laplace Stencil with Shared Memory Halo.
 * Module: stencil_2d_laplace_shared
 */

#include <assert.h>
#include <math.h>

static inline void stencil_2d_laplace_shared_assert_invariants(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0 || fabs(out_val) < 1e-12);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
