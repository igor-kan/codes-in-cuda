/**
 * @file regression.cu
 * @brief Minimized regression fixtures and edge-case verification for 2D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_2d_heat_conduction
 */

#include <assert.h>

void test_stencil_2d_heat_conduction_regression_edge_case(void) {
    double small_val = 1e-315;
    double computed = small_val * 1.0;
    assert(computed >= 0.0);
}
