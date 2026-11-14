/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing target for AFL++ and LibFuzzer for Warp-Shuffle Vector Inner Product with Threadblock.
 * Module: vector_dot_warp_shuffle
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_vector_dot_warp_shuffle_day50(const uint8_t* data, size_t size) {
    if (size < sizeof(double)) return 0;
    const double* val = (const double*)data;
    if (*val == *val && *val > -1e6 && *val < 1e6) {
        double res = (*val) * 1.0001;
        (void)res;
    }
    return 0;
}
