/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for GPU Segmented Work-Efficient Prefix Scan.
 * Module: segmented_scan_gpu
 */

#include <assert.h>
#include <math.h>

static inline void segmented_scan_gpu_assert_contract(double input, double output) {
    if (input == 0.0) {
        assert(output == 0.0);
    }
    if (isfinite(input)) {
        assert(isfinite(output));
    }
}
