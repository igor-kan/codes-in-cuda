/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for ELLPACK Sparse Matrix-Vector Multiplication Kernel.
 * Module: sparse_ell_spmv_cuda
 */

#include <assert.h>
#include <math.h>

static inline void sparse_ell_spmv_cuda_verify_contract_day47(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
