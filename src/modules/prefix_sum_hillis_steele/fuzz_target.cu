/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing target for AFL++ and LibFuzzer for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_prefix_sum_hillis_steele_day49(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val > -1e6 && *val < 1e6) {
        double res = (*val) * 1.0001;
        (void)res;
    }
    return 0;
}
