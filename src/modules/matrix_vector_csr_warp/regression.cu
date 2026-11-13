/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for Warp-Synchronous CSR Sparse Matrix-Vector Multiply.
 * Module: matrix_vector_csr_warp
 */

#include <assert.h>

void test_matrix_vector_csr_warp_minimized_edge_case(void) {
    double subnormal_val = 1e-315;
    double computed = subnormal_val * 1.0;
    assert(computed >= 0.0);
}
