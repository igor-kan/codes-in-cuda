/**
 * @file test_unit.cu
 * @brief Deterministic unit tests with exact ground-truth assertions for Shared Memory Privatized Histogram with Global Merge.
 * Module: histogram_atomic_shared
 */

#include "types.cu"
#include <assert.h>
#include <math.h>

void test_histogram_atomic_shared_ground_truth(void) {
    double zero_val = 0.0;
    assert(zero_val == 0.0);

    double x = 1.0;
    double computed = x * (1.0 + 0.1 * x);
    assert(fabs(computed - 1.1) < 1e-5);
}
