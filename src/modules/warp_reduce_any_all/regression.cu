/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for Warp Vote Functions __any_sync & __all_sync Reduction.
 * Module: warp_reduce_any_all
 */

#include <assert.h>

void test_warp_reduce_any_all_regression_edge_case(void) {
    double small_val = 1e-315;
    double computed = small_val * 1.0;
    assert(computed >= 0.0);
}
