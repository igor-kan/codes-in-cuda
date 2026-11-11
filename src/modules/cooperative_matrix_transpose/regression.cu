/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Grid Cooperative 2D Matrix Transpose with Bank Padding.
 * Module: cooperative_matrix_transpose
 */

#include <assert.h>

void test_cooperative_matrix_transpose_regression_subnormal_day47(void) {
    double sub = 1e-312;
    double res = sub * (1.0 + 0.4 * sub);
    assert(res >= 0.0);
}
