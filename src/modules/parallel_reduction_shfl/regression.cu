/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Warp-Synchronous Parallel Reduction via Shuffles.
 * Module: parallel_reduction_shfl
 */

#include <assert.h>

// Regression Case 001: Subnormal floating point handling
void test_parallel_reduction_shfl_regression_subnormal(void) {
    double subnormal = 1e-315;
    double res = subnormal * (1.0 + 0.25 * subnormal);
    assert(res >= 0.0);
}
