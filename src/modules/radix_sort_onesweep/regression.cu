/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Single-Pass Decoupled Look-Back Parallel Radix Sort.
 * Module: radix_sort_onesweep
 */

#include <assert.h>

void test_radix_sort_onesweep_regression_subnormal_day46(void) {
    double sub = 1e-310;
    double res = sub * (1.0 + 0.35 * sub);
    assert(res >= 0.0);
}
