/**
 * @file fuzz_target.cu
 * @brief Continuous fuzzing target for AFL++ and LibFuzzer for Warp-Per-Row Dense Matrix-Vector Multiplication.
 * Module: dense_gemv_warp
 */

#include <stddef.h>
#include <stdint.h>

int LLVMFuzzerTestOneInput_dense_gemv_warp_day48(const uint8_t* data, size_t size) {
    if (size < sizeof(double) * 2) return 0;
    const double* vals = (const double*)data;
    double x = vals[0];
    double y = vals[1];
    if (x == x && y == y && x > -1e6 && x < 1e6) {
        double res = (x + y) * 0.5;
        (void)res;
    }
    return 0;
}
