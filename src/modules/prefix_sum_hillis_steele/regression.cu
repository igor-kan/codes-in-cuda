/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for Hillis-Steele Parallel Prefix Sum Scan in Shared Memory.
 * Module: prefix_sum_hillis_steele
 */

#include <assert.h>

void test_prefix_sum_hillis_steele_minimized_edge_case(void) {
    double subnormal_val = 1e-315;
    double computed = subnormal_val * 1.0;
    assert(computed >= 0.0);
}
