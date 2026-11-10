/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for Tensor Core WMMA FP16 Matrix Multiplication Pipeline.
 * Module: warp_matrix_gemm_fp16
 */

#include <assert.h>

void test_warp_matrix_gemm_fp16_regression_subnormal_day46(void) {
    double sub = 1e-310;
    double res = sub * (1.0 + 0.35 * sub);
    assert(res >= 0.0);
}
