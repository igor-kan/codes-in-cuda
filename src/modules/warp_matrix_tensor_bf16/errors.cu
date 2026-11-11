/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for Tensor Core BF16 Mixed-Precision MMA GEMM Pipeline.
 * Module: warp_matrix_tensor_bf16
 */

typedef enum warp_matrix_tensor_bf16_error_code {
    WARP_MATRIX_TENSOR_BF16_STATUS_OK = 0,
    WARP_MATRIX_TENSOR_BF16_ERR_NULL_PTR = -20,
    WARP_MATRIX_TENSOR_BF16_ERR_OUT_OF_BOUNDS = -21,
    WARP_MATRIX_TENSOR_BF16_ERR_DIVERGENCE = -22
} warp_matrix_tensor_bf16_error_code_t;

const char* warp_matrix_tensor_bf16_error_message(warp_matrix_tensor_bf16_error_code_t code) {
    switch (code) {
        case WARP_MATRIX_TENSOR_BF16_STATUS_OK: return "Operational success";
        case WARP_MATRIX_TENSOR_BF16_ERR_NULL_PTR: return "Null pointer argument";
        case WARP_MATRIX_TENSOR_BF16_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case WARP_MATRIX_TENSOR_BF16_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
