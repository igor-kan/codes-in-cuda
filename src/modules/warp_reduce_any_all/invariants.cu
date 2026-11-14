/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all
 */

#include <assert.h>
#include <math.h>

static inline void warp_reduce_any_all_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0 || fabs(out_val) < 1e-12);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
