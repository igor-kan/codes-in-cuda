/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for Tensor Core WMMA FP16 Matrix Multiplication Pipeline.
 * Module: warp_matrix_gemm_fp16
 */

typedef enum warp_matrix_gemm_fp16_error_code {
    WARP_MATRIX_GEMM_FP16_STATUS_OK = 0,
    WARP_MATRIX_GEMM_FP16_ERR_NULL_PTR = -10,
    WARP_MATRIX_GEMM_FP16_ERR_OUT_OF_BOUNDS = -11,
    WARP_MATRIX_GEMM_FP16_ERR_DIVERGENCE = -12
} warp_matrix_gemm_fp16_error_code_t;

const char* warp_matrix_gemm_fp16_error_message(warp_matrix_gemm_fp16_error_code_t code) {
    switch (code) {
        case WARP_MATRIX_GEMM_FP16_STATUS_OK: return "Operational success";
        case WARP_MATRIX_GEMM_FP16_ERR_NULL_PTR: return "Null pointer argument";
        case WARP_MATRIX_GEMM_FP16_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case WARP_MATRIX_GEMM_FP16_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
