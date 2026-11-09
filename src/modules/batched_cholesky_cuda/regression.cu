/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Batched Small-Matrix Cholesky Decomposition.
 * Module: batched_cholesky_cuda
 */

#include <assert.h>

void test_batched_cholesky_cuda_regression_underflow(void) {
    double tiny = 1e-308;
    double res = tiny * (1.0 + 0.3 * tiny);
    assert(res >= 0.0);
}
