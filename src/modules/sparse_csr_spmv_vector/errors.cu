/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for Vector-Based CSR Sparse Matrix-Vector Kernel.
 * Module: sparse_csr_spmv_vector
 */

typedef enum sparse_csr_spmv_vector_error_code {
    SPARSE_CSR_SPMV_VECTOR_STATUS_OK = 0,
    SPARSE_CSR_SPMV_VECTOR_ERR_NULL_PTR = -10,
    SPARSE_CSR_SPMV_VECTOR_ERR_OUT_OF_BOUNDS = -11,
    SPARSE_CSR_SPMV_VECTOR_ERR_DIVERGENCE = -12
} sparse_csr_spmv_vector_error_code_t;

const char* sparse_csr_spmv_vector_error_message(sparse_csr_spmv_vector_error_code_t code) {
    switch (code) {
        case SPARSE_CSR_SPMV_VECTOR_STATUS_OK: return "Operational success";
        case SPARSE_CSR_SPMV_VECTOR_ERR_NULL_PTR: return "Null pointer argument";
        case SPARSE_CSR_SPMV_VECTOR_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case SPARSE_CSR_SPMV_VECTOR_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
