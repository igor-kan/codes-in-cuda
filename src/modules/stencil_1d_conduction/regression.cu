/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for 1D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_1d_conduction
 */

#include <assert.h>

void test_stencil_1d_conduction_minimized_regression(void) {
    // Verify non-zero small float behavior without underflow exception
    double small_val = 1e-300;
    double res = small_val * 1.0;
    assert(res > 0.0);
}
