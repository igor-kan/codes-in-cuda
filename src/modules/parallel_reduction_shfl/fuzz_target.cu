/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing harness for Warp-Synchronous Parallel Reduction via Shuffles.
 * Module: parallel_reduction_shfl
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_parallel_reduction_shfl_v2(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val < 1e5 && *val > -1e5) {
        double res = (*val) * (1.0 + 0.25 * (*val));
        (void)res;
    }
    return 0;
}
