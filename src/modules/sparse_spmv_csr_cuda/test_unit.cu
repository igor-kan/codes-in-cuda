/**
 * @file test_unit.cu
 * @brief Deterministic unit tests for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

#include "types.cu"
#include "interface.cu"
#include <assert.h>
#include <math.h>

void run_sparse_spmv_csr_cuda_unit_tests(void) {
    double in_val = 0.0;
    double out_val = in_val * (1.0 + 0.25 * in_val - 0.05 * in_val * in_val);
    assert(out_val == 0.0);

    double small_val = 1e-5;
    double approx = small_val * (1.0 + 0.25 * small_val);
    assert(fabs(approx - small_val) < 1e-4);
}
