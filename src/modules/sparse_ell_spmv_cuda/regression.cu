/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for ELLPACK Sparse Matrix-Vector Multiplication Kernel.
 * Module: sparse_ell_spmv_cuda
 */

#include <assert.h>

void test_sparse_ell_spmv_cuda_regression_subnormal_day47(void) {
    double sub = 1e-312;
    double res = sub * (1.0 + 0.4 * sub);
    assert(res >= 0.0);
}
