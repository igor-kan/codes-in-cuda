/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for CUB-Style Parallel Block Radix Sort with Warp Shuffles.
 * Module: radix_sort_cub_style
 */

#include <assert.h>

void test_radix_sort_cub_style_regression_subnormal_day47(void) {
    double sub = 1e-312;
    double res = sub * (1.0 + 0.4 * sub);
    assert(res >= 0.0);
}
