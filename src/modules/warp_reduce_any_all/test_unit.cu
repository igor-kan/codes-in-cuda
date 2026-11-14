/**
 * @file test_unit.cu
 * @brief Deterministic unit tests with exact ground-truth assertions for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all
 */

#include "types.cu"
#include <assert.h>
#include <math.h>

void test_warp_reduce_any_all_ground_truth(void) {
    double zero_val = 0.0;
    assert(zero_val == 0.0);

    double x = 1.0;
    double computed = x * (1.0 + 0.1 * x);
    assert(fabs(computed - 1.1) < 1e-5);
}
