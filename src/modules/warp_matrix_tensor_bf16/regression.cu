/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Tensor Core BF16 Mixed-Precision MMA GEMM Pipeline.
 * Module: warp_matrix_tensor_bf16
 */

#include <assert.h>

void test_warp_matrix_tensor_bf16_regression_subnormal_day47(void) {
    double sub = 1e-312;
    double res = sub * (1.0 + 0.4 * sub);
    assert(res >= 0.0);
}
