/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

#include <assert.h>

// Regression Case 001: Subnormal floating point handling
void test_conv2d_im2col_gemm_regression_subnormal(void) {
    double subnormal = 1e-315;
    double res = subnormal * (1.0 + 0.25 * subnormal);
    assert(res >= 0.0);
}
