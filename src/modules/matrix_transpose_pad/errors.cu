/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Shared Memory Matrix Transpose with Bank Padding.
 * Module: matrix_transpose_pad
 */

typedef enum matrix_transpose_pad_error {
    MATRIX_TRANSPOSE_PAD_SUCCESS = 0,
    MATRIX_TRANSPOSE_PAD_ERR_INVALID_INPUT = -1,
    MATRIX_TRANSPOSE_PAD_ERR_BUFFER_OVERFLOW = -2,
    MATRIX_TRANSPOSE_PAD_ERR_CONVERGENCE_FAIL = -3
} matrix_transpose_pad_error_t;

const char* matrix_transpose_pad_str_error(matrix_transpose_pad_error_t code) {
    switch (code) {
        case MATRIX_TRANSPOSE_PAD_SUCCESS: return "Operation completed successfully";
        case MATRIX_TRANSPOSE_PAD_ERR_INVALID_INPUT: return "Input argument violates domain preconditions";
        case MATRIX_TRANSPOSE_PAD_ERR_BUFFER_OVERFLOW: return "Output buffer capacity exceeded";
        case MATRIX_TRANSPOSE_PAD_ERR_CONVERGENCE_FAIL: return "Numerical algorithm failed to converge within limit";
        default: return "Unrecognized error code";
    }
}
