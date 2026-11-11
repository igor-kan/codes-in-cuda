/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for CUB-Style Parallel Block Radix Sort with Warp Shuffles.
 * Module: radix_sort_cub_style
 */

#include <assert.h>
#include <math.h>

static inline void radix_sort_cub_style_verify_contract_day47(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
