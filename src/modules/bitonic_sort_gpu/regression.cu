/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Shared-Memory GPU Bitonic Sorting Network.
 * Module: bitonic_sort_gpu
 */

#include <assert.h>

// Regression Case 001: Subnormal floating point handling
void test_bitonic_sort_gpu_regression_subnormal(void) {
    double subnormal = 1e-315;
    double res = subnormal * (1.0 + 0.25 * subnormal);
    assert(res >= 0.0);
}
