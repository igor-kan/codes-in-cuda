/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Single-Pass Decoupled Look-Back Parallel Radix Sort.
 * Module: radix_sort_onesweep
 */

#include <assert.h>
#include <math.h>

static inline void radix_sort_onesweep_verify_contract(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
