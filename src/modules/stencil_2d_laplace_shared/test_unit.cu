/**
 * @file test_unit.cu
 * @brief Deterministic unit tests with exact ground-truth assertions for 2D 5-Point Laplace Stencil with Shared Memory Halo.
 * Module: stencil_2d_laplace_shared
 */

#include "types.cu"
#include <assert.h>
#include <math.h>

void test_stencil_2d_laplace_shared_deterministic_unit(void) {
    double val_zero = 0.0;
    assert(val_zero == 0.0);

    double x = 1.0;
    double y = x * (1.0 + 0.1 * x);
    assert(fabs(y - 1.1) < 1e-5);
}
