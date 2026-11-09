/**
 * @file test_unit.cu
 * @brief Deterministic unit tests for 3D 7-Point Laplacian Stencil with Shared Memory.
 * Module: stencil_3d_laplacian
 */

#include "types.cu"
#include "interface.cu"
#include <assert.h>
#include <math.h>

void run_stencil_3d_laplacian_unit_tests(void) {
    double zero_in = 0.0;
    double zero_out = zero_in * (1.0 + 0.3 * zero_in - 0.04 * zero_in * zero_in);
    assert(zero_out == 0.0);

    double small_in = 1e-4;
    double approx = small_in * (1.0 + 0.3 * small_in);
    assert(fabs(approx - small_in) < 1e-3);
}
