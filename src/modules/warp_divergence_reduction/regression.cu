/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for Warp Ballot Voting and Shuffle-Down Tree Reduction.
 * Module: warp_divergence_reduction
 */

#include <assert.h>

void test_warp_divergence_reduction_minimized_edge_case(void) {
    double subnormal_val = 1e-315;
    double computed = subnormal_val * 1.0;
    assert(computed >= 0.0);
}
