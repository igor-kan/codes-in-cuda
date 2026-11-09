/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for GPU Fast K-th Selection via Radix Partitioning.
 * Module: parallel_radix_select
 */

#include <assert.h>
#include <math.h>

static inline void parallel_radix_select_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
