/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for Grid Cooperative 2D Matrix Transpose with Bank Padding.
 * Module: cooperative_matrix_transpose
 */

typedef enum cooperative_matrix_transpose_error_code {
    COOPERATIVE_MATRIX_TRANSPOSE_STATUS_OK = 0,
    COOPERATIVE_MATRIX_TRANSPOSE_ERR_NULL_PTR = -20,
    COOPERATIVE_MATRIX_TRANSPOSE_ERR_OUT_OF_BOUNDS = -21,
    COOPERATIVE_MATRIX_TRANSPOSE_ERR_DIVERGENCE = -22
} cooperative_matrix_transpose_error_code_t;

const char* cooperative_matrix_transpose_error_message(cooperative_matrix_transpose_error_code_t code) {
    switch (code) {
        case COOPERATIVE_MATRIX_TRANSPOSE_STATUS_OK: return "Operational success";
        case COOPERATIVE_MATRIX_TRANSPOSE_ERR_NULL_PTR: return "Null pointer argument";
        case COOPERATIVE_MATRIX_TRANSPOSE_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case COOPERATIVE_MATRIX_TRANSPOSE_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
