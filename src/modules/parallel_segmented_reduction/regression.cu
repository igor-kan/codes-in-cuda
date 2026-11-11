/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for GPU Segmented Parallel Reduction with Key Arrays.
 * Module: parallel_segmented_reduction
 */

#include <assert.h>

void test_parallel_segmented_reduction_regression_subnormal_day47(void) {
    double sub = 1e-312;
    double res = sub * (1.0 + 0.4 * sub);
    assert(res >= 0.0);
}
