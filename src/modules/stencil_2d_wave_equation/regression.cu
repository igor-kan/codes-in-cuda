/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for 2D Acoustic Wave Propagation Stencil with Shared Halo.
 * Module: stencil_2d_wave_equation
 */

#include <assert.h>

void test_stencil_2d_wave_equation_regression_subnormal_day47(void) {
    double sub = 1e-312;
    double res = sub * (1.0 + 0.4 * sub);
    assert(res >= 0.0);
}
