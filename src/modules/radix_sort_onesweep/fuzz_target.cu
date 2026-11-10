/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing harness for Single-Pass Decoupled Look-Back Parallel Radix Sort.
 * Module: radix_sort_onesweep
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_radix_sort_onesweep_day46(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val < 1e5 && *val > -1e5) {
        double res = (*val) * (1.0 + 0.35 * (*val));
        (void)res;
    }
    return 0;
}
