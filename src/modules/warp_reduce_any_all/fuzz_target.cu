/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing target for AFL++ and LibFuzzer for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_warp_reduce_any_all_day50(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val > -1e6 && *val < 1e6) {
        double res = (*val) * 1.0001;
        (void)res;
    }
    return 0;
}
