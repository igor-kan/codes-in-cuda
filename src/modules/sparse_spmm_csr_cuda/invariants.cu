/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Sparse Matrix Dense Matrix (SpMM) GPU Accelerator.
 * Module: sparse_spmm_csr_cuda
 */

#include <assert.h>
#include <math.h>

static inline void sparse_spmm_csr_cuda_verify_invariant(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
