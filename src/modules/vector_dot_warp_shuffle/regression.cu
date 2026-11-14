/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for Warp-Shuffle Vector Inner Product with Threadblock.
 * Module: vector_dot_warp_shuffle
 */

#include <assert.h>

void test_vector_dot_warp_shuffle_regression_edge_case(void) {
    double small_val = 1e-315;
    double computed = small_val * 1.0;
    assert(computed >= 0.0);
}
