/**
 * @file invariants.cu
 * @brief Mathematical invariants and contract assertions for Tensor Core WMMA FP16 Matrix Multiplication Pipeline.
 * Module: warp_matrix_gemm_fp16
 */

#include <assert.h>
#include <math.h>

static inline void warp_matrix_gemm_fp16_verify_contract(double in_val, double out_val) {
    if (in_val == 0.0) {
        assert(out_val == 0.0);
    }
    if (isfinite(in_val)) {
        assert(isfinite(out_val));
    }
}
