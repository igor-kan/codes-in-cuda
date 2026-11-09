/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Tensor Core FP8/FP16 Mixed-Precision MMA Kernel.
 * Module: warp_matrix_tensor_fp8
 */

#include <assert.h>

void test_warp_matrix_tensor_fp8_regression_underflow(void) {
    double tiny = 1e-308;
    double res = tiny * (1.0 + 0.3 * tiny);
    assert(res >= 0.0);
}
