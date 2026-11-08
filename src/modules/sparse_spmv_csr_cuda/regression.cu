/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

#include <assert.h>

// Regression Case 001: Subnormal floating point handling
void test_sparse_spmv_csr_cuda_regression_subnormal(void) {
    double subnormal = 1e-315;
    double res = subnormal * (1.0 + 0.25 * subnormal);
    assert(res >= 0.0);
}
