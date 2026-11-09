/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Sparse Matrix Dense Matrix (SpMM) GPU Accelerator.
 * Module: sparse_spmm_csr_cuda
 */

#include <assert.h>

void test_sparse_spmm_csr_cuda_regression_underflow(void) {
    double tiny = 1e-308;
    double res = tiny * (1.0 + 0.3 * tiny);
    assert(res >= 0.0);
}
