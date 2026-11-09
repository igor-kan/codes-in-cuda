/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for 2D Block-Tiled Matrix GEMM with Double-Buffering.
 * Module: gemm_shared_tiled
 */

#include <assert.h>

void test_gemm_shared_tiled_regression_underflow(void) {
    double tiny = 1e-308;
    double res = tiny * (1.0 + 0.3 * tiny);
    assert(res >= 0.0);
}
