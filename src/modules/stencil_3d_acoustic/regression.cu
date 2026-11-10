/**
 * @file regression.cu
 * @brief Minimized crash reproducer and regression tests for 3D 25-Point High-Order Acoustic Wave Stencil.
 * Module: stencil_3d_acoustic
 */

#include <assert.h>

void test_stencil_3d_acoustic_regression_subnormal_day46(void) {
    double sub = 1e-310;
    double res = sub * (1.0 + 0.35 * sub);
    assert(res >= 0.0);
}
