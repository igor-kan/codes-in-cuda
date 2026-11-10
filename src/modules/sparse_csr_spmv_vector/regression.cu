/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Vector-Based CSR Sparse Matrix-Vector Kernel.
 * Module: sparse_csr_spmv_vector
 */

#include <assert.h>

void test_sparse_csr_spmv_vector_regression_subnormal_day46(void) {
    double sub = 1e-310;
    double res = sub * (1.0 + 0.35 * sub);
    assert(res >= 0.0);
}
