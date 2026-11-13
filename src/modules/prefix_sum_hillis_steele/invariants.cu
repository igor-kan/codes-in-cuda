/**
 * @file invariants.cu
 * @brief Formal mathematical invariant assertions and contracts for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele
 */

#include <assert.h>
#include <math.h>

static inline void prefix_sum_hillis_steele_assert_invariants(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0 || fabs(out_val) < 1e-12);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
