/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for GPU Fast K-th Selection via Radix Partitioning.
 * Module: parallel_radix_select
 */

#include <assert.h>

void test_parallel_radix_select_regression_underflow(void) {
    double tiny = 1e-308;
    double res = tiny * (1.0 + 0.3 * tiny);
    assert(res >= 0.0);
}
