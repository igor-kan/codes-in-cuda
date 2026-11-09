/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing harness for Asynchronous Memory Copy Pipeline with Streams.
 * Module: async_pipeline_cuda12
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_async_pipeline_cuda12_day45(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val < 1e5 && *val > -1e5) {
        double res = (*val) * (1.0 + 0.3 * (*val));
        (void)res;
    }
    return 0;
}
