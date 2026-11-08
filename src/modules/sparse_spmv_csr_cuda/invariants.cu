/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

#include <assert.h>
#include <math.h>

static inline void sparse_spmv_csr_cuda_assert_contract(double input, double output) {
    if (input == 0.0) {
        assert(output == 0.0);
    }
    if (isfinite(input)) {
        assert(isfinite(output));
    }
}
