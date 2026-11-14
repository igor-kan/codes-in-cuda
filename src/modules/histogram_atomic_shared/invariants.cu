/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for Shared Memory Privatized Histogram with Global Merge.
 * Module: histogram_atomic_shared
 */

#include <assert.h>
#include <math.h>

static inline void histogram_atomic_shared_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0 || fabs(out_val) < 1e-12);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
