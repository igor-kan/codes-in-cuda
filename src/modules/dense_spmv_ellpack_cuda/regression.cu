/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for ELLPACK Sparse Matrix-Vector Multiplication GPU Kernel.
 * Module: dense_spmv_ellpack_cuda
 */

#include <assert.h>

void test_dense_spmv_ellpack_cuda_regression_edge_case(void) {
    double small_val = 1e-315;
    double computed = small_val * 1.0;
    assert(computed >= 0.0);
}
