/**
 * @file errors.cu
 * @brief Domain diagnostic error codes and messages for Parallel Two-Pass Euclidean Vector Norm Reduction.
 * Module: vector_norm2_atomic
 */

typedef enum vector_norm2_atomic_error {
    VECTOR_NORM2_ATOMIC_SUCCESS = 0,
    VECTOR_NORM2_ATOMIC_ERR_INVALID_INPUT = -1,
    VECTOR_NORM2_ATOMIC_ERR_BUFFER_OVERFLOW = -2,
    VECTOR_NORM2_ATOMIC_ERR_CONVERGENCE_FAIL = -3
} vector_norm2_atomic_error_t;

const char* vector_norm2_atomic_str_error(vector_norm2_atomic_error_t code) {
    switch (code) {
        case VECTOR_NORM2_ATOMIC_SUCCESS: return "Operation completed successfully";
        case VECTOR_NORM2_ATOMIC_ERR_INVALID_INPUT: return "Input argument violates domain preconditions";
        case VECTOR_NORM2_ATOMIC_ERR_BUFFER_OVERFLOW: return "Output buffer capacity exceeded";
        case VECTOR_NORM2_ATOMIC_ERR_CONVERGENCE_FAIL: return "Numerical algorithm failed to converge within limit";
        default: return "Unrecognized error code";
    }
}
