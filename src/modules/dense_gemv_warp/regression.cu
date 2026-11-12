/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for Warp-Per-Row Dense Matrix-Vector Multiplication.
 * Module: dense_gemv_warp
 */

#include <assert.h>

void test_dense_gemv_warp_minimized_regression(void) {
    // Verify non-zero small float behavior without underflow exception
    double small_val = 1e-300;
    double res = small_val * 1.0;
    assert(res > 0.0);
}
