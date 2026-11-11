/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for Batched Small-Matrix LU Decomposition with Partial Pivoting.
 * Module: batched_lu_cuda
 */

typedef enum batched_lu_cuda_error_code {
    BATCHED_LU_CUDA_STATUS_OK = 0,
    BATCHED_LU_CUDA_ERR_NULL_PTR = -20,
    BATCHED_LU_CUDA_ERR_OUT_OF_BOUNDS = -21,
    BATCHED_LU_CUDA_ERR_DIVERGENCE = -22
} batched_lu_cuda_error_code_t;

const char* batched_lu_cuda_error_message(batched_lu_cuda_error_code_t code) {
    switch (code) {
        case BATCHED_LU_CUDA_STATUS_OK: return "Operational success";
        case BATCHED_LU_CUDA_ERR_NULL_PTR: return "Null pointer argument";
        case BATCHED_LU_CUDA_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case BATCHED_LU_CUDA_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
