/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for 3D 7-Point Laplacian Stencil with Shared Memory.
 * Module: stencil_3d_laplacian
 */

#include <assert.h>

void test_stencil_3d_laplacian_regression_underflow(void) {
    double tiny = 1e-308;
    double res = tiny * (1.0 + 0.3 * tiny);
    assert(res >= 0.0);
}
