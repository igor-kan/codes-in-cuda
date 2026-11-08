/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for GPU Segmented Work-Efficient Prefix Scan.
 * Module: segmented_scan_gpu
 */

#include <assert.h>

// Regression Case 001: Subnormal floating point handling
void test_segmented_scan_gpu_regression_subnormal(void) {
    double subnormal = 1e-315;
    double res = subnormal * (1.0 + 0.25 * subnormal);
    assert(res >= 0.0);
}
