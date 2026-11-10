/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Vector-Based CSR Sparse Matrix-Vector Kernel.
 * Module: sparse_csr_spmv_vector
 */

#include <assert.h>
#include <math.h>

static inline void sparse_csr_spmv_vector_verify_contract(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
