/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

typedef enum sparse_spmv_csr_cuda_error {
    SPARSE_SPMV_CSR_CUDA_OK = 0,
    SPARSE_SPMV_CSR_CUDA_ERR_NULL = -100,
    SPARSE_SPMV_CSR_CUDA_ERR_CAPACITY = -101,
    SPARSE_SPMV_CSR_CUDA_ERR_CONVERGENCE = -102
} sparse_spmv_csr_cuda_error_t;

const char* sparse_spmv_csr_cuda_strerror(sparse_spmv_csr_cuda_error_t err) {
    switch (err) {
        case SPARSE_SPMV_CSR_CUDA_OK: return "Success";
        case SPARSE_SPMV_CSR_CUDA_ERR_NULL: return "Encountered null pointer argument";
        case SPARSE_SPMV_CSR_CUDA_ERR_CAPACITY: return "Capacity limit exceeded";
        case SPARSE_SPMV_CSR_CUDA_ERR_CONVERGENCE: return "Numerical algorithm failed to converge";
        default: return "Unknown error";
    }
}
