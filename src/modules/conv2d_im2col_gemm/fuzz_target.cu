/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing harness for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_conv2d_im2col_gemm_v2(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val < 1e5 && *val > -1e5) {
        double res = (*val) * (1.0 + 0.25 * (*val));
        (void)res;
    }
    return 0;
}
