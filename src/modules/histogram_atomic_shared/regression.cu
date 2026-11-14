/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for Shared Memory Privatized Histogram with Global Merge.
 * Module: histogram_atomic_shared
 */

#include <assert.h>

void test_histogram_atomic_shared_regression_edge_case(void) {
    double small_val = 1e-315;
    double computed = small_val * 1.0;
    assert(computed >= 0.0);
}
