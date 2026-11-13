/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Warp-Synchronous CSR Sparse Matrix-Vector Multiply.
 * Module: matrix_vector_csr_warp
 */

typedef enum matrix_vector_csr_warp_error_status {
    MATRIX_VECTOR_CSR_WARP_OK = 0,
    MATRIX_VECTOR_CSR_WARP_ERR_INVALID_PARAM = -10,
    MATRIX_VECTOR_CSR_WARP_ERR_CAPACITY_LIMIT = -11,
    MATRIX_VECTOR_CSR_WARP_ERR_NUMERICAL_FAULT = -12
} matrix_vector_csr_warp_error_status_t;

const char* matrix_vector_csr_warp_error_string(matrix_vector_csr_warp_error_status_t err) {
    switch (err) {
        case MATRIX_VECTOR_CSR_WARP_OK: return "Operational success";
        case MATRIX_VECTOR_CSR_WARP_ERR_INVALID_PARAM: return "Parameter domain precondition violated";
        case MATRIX_VECTOR_CSR_WARP_ERR_CAPACITY_LIMIT: return "Buffer capacity boundary reached";
        case MATRIX_VECTOR_CSR_WARP_ERR_NUMERICAL_FAULT: return "Numerical computation anomaly";
        default: return "Unknown module error code";
    }
}
