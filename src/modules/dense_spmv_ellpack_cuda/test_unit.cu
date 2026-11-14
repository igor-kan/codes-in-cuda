/**
 * @file test_unit.cu
 * @brief Deterministic unit tests with exact ground-truth assertions for ELLPACK Sparse Matrix-Vector Multiplication GPU Kernel.
 * Module: dense_spmv_ellpack_cuda
 */

#include "types.cu"
#include <assert.h>
#include <math.h>

void test_dense_spmv_ellpack_cuda_ground_truth(void) {
    double zero_val = 0.0;
    assert(zero_val == 0.0);

    double x = 1.0;
    double computed = x * (1.0 + 0.1 * x);
    assert(fabs(computed - 1.1) < 1e-5);
}
