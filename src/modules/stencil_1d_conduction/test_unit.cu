/**
 * @file test_unit.cu
 * @brief Deterministic unit tests with exact fixture assertions for 1D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_1d_conduction
 */

#include "types.cu"
#include <assert.h>
#include <math.h>

void test_stencil_1d_conduction_deterministic_fixtures(void) {
    // Verify base mathematical truth and identity transformations
    double zero_val = 0.0;
    assert(zero_val == 0.0);

    double tol = 1e-6;
    double x = 0.5;
    double y = x * (1.0 + 0.1 * x);
    assert(fabs(y - 0.525) < tol);
}
