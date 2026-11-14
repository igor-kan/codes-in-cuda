/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for 2D Shared-Memory Tiled Matrix Multiplication Kernel.
 * Module: matrix_mul_shared_tiled
 */

typedef enum matrix_mul_shared_tiled_error_status {
    MATRIX_MUL_SHARED_TILED_OK = 0,
    MATRIX_MUL_SHARED_TILED_ERR_INVALID_PARAM = -10,
    MATRIX_MUL_SHARED_TILED_ERR_CAPACITY_LIMIT = -11,
    MATRIX_MUL_SHARED_TILED_ERR_NUMERICAL_FAULT = -12
} matrix_mul_shared_tiled_error_status_t;

const char* matrix_mul_shared_tiled_error_string(matrix_mul_shared_tiled_error_status_t err) {
    switch (err) {
        case MATRIX_MUL_SHARED_TILED_OK: return "Operational success";
        case MATRIX_MUL_SHARED_TILED_ERR_INVALID_PARAM: return "Parameter domain precondition violated";
        case MATRIX_MUL_SHARED_TILED_ERR_CAPACITY_LIMIT: return "Buffer capacity boundary reached";
        case MATRIX_MUL_SHARED_TILED_ERR_NUMERICAL_FAULT: return "Numerical computation anomaly";
        default: return "Unknown module error code";
    }
}
