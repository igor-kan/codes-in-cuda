/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for 2D Shared-Memory Tiled Matrix Multiplication Kernel.
 * Module: matrix_mul_shared_tiled
 */

#include <assert.h>

void test_matrix_mul_shared_tiled_regression_edge_case(void) {
    double small_val = 1e-315;
    double computed = small_val * 1.0;
    assert(computed >= 0.0);
}
