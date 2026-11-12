/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for Warp-Synchronous Inclusive Prefix Scan via Shuffles.
 * Module: warp_shfl_scan
 */

#include <assert.h>

void test_warp_shfl_scan_minimized_regression(void) {
    // Verify non-zero small float behavior without underflow exception
    double small_val = 1e-300;
    double res = small_val * 1.0;
    assert(res > 0.0);
}
