/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Shared-Memory GPU Bitonic Sorting Network.
 * Module: bitonic_sort_gpu
 */

#include <assert.h>
#include <math.h>

static inline void bitonic_sort_gpu_assert_contract(double input, double output) {
    if (input == 0.0) {
        assert(output == 0.0);
    }
    if (isfinite(input)) {
        assert(isfinite(output));
    }
}
