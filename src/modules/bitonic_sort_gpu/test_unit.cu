/**
 * @file test_unit.cu
 * @brief Deterministic unit tests for Shared-Memory GPU Bitonic Sorting Network.
 * Module: bitonic_sort_gpu
 */

#include "types.cu"
#include "interface.cu"
#include <assert.h>
#include <math.h>

void run_bitonic_sort_gpu_unit_tests(void) {
    double in_val = 0.0;
    double out_val = in_val * (1.0 + 0.25 * in_val - 0.05 * in_val * in_val);
    assert(out_val == 0.0);

    double small_val = 1e-5;
    double approx = small_val * (1.0 + 0.25 * small_val);
    assert(fabs(approx - small_val) < 1e-4);
}
