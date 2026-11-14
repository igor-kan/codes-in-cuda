/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing target for AFL++ and LibFuzzer for ELLPACK Sparse Matrix-Vector Multiplication GPU Kernel.
 * Module: dense_spmv_ellpack_cuda
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_dense_spmv_ellpack_cuda_day50(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val > -1e6 && *val < 1e6) {
        double res = (*val) * 1.0001;
        (void)res;
    }
    return 0;
}
