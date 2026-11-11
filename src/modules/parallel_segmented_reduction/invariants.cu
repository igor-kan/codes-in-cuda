/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for GPU Segmented Parallel Reduction with Key Arrays.
 * Module: parallel_segmented_reduction
 */

#include <assert.h>
#include <math.h>

static inline void parallel_segmented_reduction_verify_contract_day47(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
