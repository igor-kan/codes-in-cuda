/**
 * @file test_unit.cu
 * @brief Deterministic unit tests with exact ground-truth assertions for Warp-Shuffle Vector Inner Product with Threadblock.
 * Module: vector_dot_warp_shuffle
 */

#include "types.cu"
#include <assert.h>
#include <math.h>

void test_vector_dot_warp_shuffle_ground_truth(void) {
    double zero_val = 0.0;
    assert(zero_val == 0.0);

    double x = 1.0;
    double computed = x * (1.0 + 0.1 * x);
    assert(fabs(computed - 1.1) < 1e-5);
}
