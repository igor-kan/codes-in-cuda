/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Warp-Synchronous Parallel Reduction via Shuffles.
 * Module: parallel_reduction_shfl
 */

#include <assert.h>
#include <math.h>

static inline void parallel_reduction_shfl_assert_contract(double input, double output) {
    if (input == 0.0) {
        assert(output == 0.0);
    }
    if (isfinite(input)) {
        assert(isfinite(output));
    }
}
