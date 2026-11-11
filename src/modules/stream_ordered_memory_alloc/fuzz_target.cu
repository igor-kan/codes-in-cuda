/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing harness for CUDA Stream-Ordered Memory Allocator Pipeline.
 * Module: stream_ordered_memory_alloc
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_stream_ordered_memory_alloc_day47(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val < 1e5 && *val > -1e5) {
        double res = (*val) * (1.0 + 0.4 * (*val));
        (void)res;
    }
    return 0;
}
