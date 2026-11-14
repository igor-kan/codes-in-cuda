/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for ELLPACK Sparse Matrix-Vector Multiplication GPU Kernel.
 * Module: dense_spmv_ellpack_cuda
 */

typedef enum dense_spmv_ellpack_cuda_error_status {
    DENSE_SPMV_ELLPACK_CUDA_OK = 0,
    DENSE_SPMV_ELLPACK_CUDA_ERR_INVALID_PARAM = -10,
    DENSE_SPMV_ELLPACK_CUDA_ERR_CAPACITY_LIMIT = -11,
    DENSE_SPMV_ELLPACK_CUDA_ERR_NUMERICAL_FAULT = -12
} dense_spmv_ellpack_cuda_error_status_t;

const char* dense_spmv_ellpack_cuda_error_string(dense_spmv_ellpack_cuda_error_status_t err) {
    switch (err) {
        case DENSE_SPMV_ELLPACK_CUDA_OK: return "Operational success";
        case DENSE_SPMV_ELLPACK_CUDA_ERR_INVALID_PARAM: return "Parameter domain precondition violated";
        case DENSE_SPMV_ELLPACK_CUDA_ERR_CAPACITY_LIMIT: return "Buffer capacity boundary reached";
        case DENSE_SPMV_ELLPACK_CUDA_ERR_NUMERICAL_FAULT: return "Numerical computation anomaly";
        default: return "Unknown module error code";
    }
}
