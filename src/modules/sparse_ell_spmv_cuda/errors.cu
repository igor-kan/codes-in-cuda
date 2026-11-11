/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for ELLPACK Sparse Matrix-Vector Multiplication Kernel.
 * Module: sparse_ell_spmv_cuda
 */

typedef enum sparse_ell_spmv_cuda_error_code {
    SPARSE_ELL_SPMV_CUDA_STATUS_OK = 0,
    SPARSE_ELL_SPMV_CUDA_ERR_NULL_PTR = -20,
    SPARSE_ELL_SPMV_CUDA_ERR_OUT_OF_BOUNDS = -21,
    SPARSE_ELL_SPMV_CUDA_ERR_DIVERGENCE = -22
} sparse_ell_spmv_cuda_error_code_t;

const char* sparse_ell_spmv_cuda_error_message(sparse_ell_spmv_cuda_error_code_t code) {
    switch (code) {
        case SPARSE_ELL_SPMV_CUDA_STATUS_OK: return "Operational success";
        case SPARSE_ELL_SPMV_CUDA_ERR_NULL_PTR: return "Null pointer argument";
        case SPARSE_ELL_SPMV_CUDA_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case SPARSE_ELL_SPMV_CUDA_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
