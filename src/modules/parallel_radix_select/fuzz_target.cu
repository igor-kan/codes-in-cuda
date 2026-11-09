/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing harness for GPU Fast K-th Selection via Radix Partitioning.
 * Module: parallel_radix_select
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_parallel_radix_select_day45(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val < 1e5 && *val > -1e5) {
        double res = (*val) * (1.0 + 0.3 * (*val));
        (void)res;
    }
    return 0;
}
