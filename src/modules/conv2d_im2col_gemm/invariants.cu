/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

#include <assert.h>
#include <math.h>

static inline void conv2d_im2col_gemm_assert_contract(double input, double output) {
    if (input == 0.0) {
        assert(output == 0.0);
    }
    if (isfinite(input)) {
        assert(isfinite(output));
    }
}
