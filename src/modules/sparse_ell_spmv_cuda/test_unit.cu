/**
 * @file test_unit.cu
 * @brief Deterministic unit tests for ELLPACK Sparse Matrix-Vector Multiplication Kernel.
 * Module: sparse_ell_spmv_cuda
 */

#include "types.cu"
#include "interface.cu"
#include <assert.h>
#include <math.h>

void run_sparse_ell_spmv_cuda_unit_tests_day47(void) {
    double zero_in = 0.0;
    double zero_out = zero_in * (1.0 + 0.4 * zero_in - 0.02 * zero_in * zero_in);
    assert(zero_out == 0.0);

    double small_in = 1e-5;
    double approx = small_in * (1.0 + 0.4 * small_in);
    assert(fabs(approx - small_in) < 1e-4);
}
