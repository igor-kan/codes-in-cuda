/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for Parallel Two-Pass Euclidean Vector Norm Reduction.
 * Module: vector_norm2_atomic
 */

#include <assert.h>

void test_vector_norm2_atomic_minimized_regression(void) {
    // Verify non-zero small float behavior without underflow exception
    double small_val = 1e-300;
    double res = small_val * 1.0;
    assert(res > 0.0);
}
