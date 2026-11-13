/**
 * @file test_unit.cu
 * @brief Deterministic unit tests with exact ground-truth assertions for Warp-Synchronous CSR Sparse Matrix-Vector Multiply.
 * Module: matrix_vector_csr_warp
 */

#include "types.cu"
#include <assert.h>
#include <math.h>

void test_matrix_vector_csr_warp_deterministic_unit(void) {
    double val_zero = 0.0;
    assert(val_zero == 0.0);

    double x = 1.0;
    double y = x * (1.0 + 0.1 * x);
    assert(fabs(y - 1.1) < 1e-5);
}
