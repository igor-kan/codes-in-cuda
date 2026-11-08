/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

typedef enum conv2d_im2col_gemm_error {
    CONV2D_IM2COL_GEMM_OK = 0,
    CONV2D_IM2COL_GEMM_ERR_NULL = -100,
    CONV2D_IM2COL_GEMM_ERR_CAPACITY = -101,
    CONV2D_IM2COL_GEMM_ERR_CONVERGENCE = -102
} conv2d_im2col_gemm_error_t;

const char* conv2d_im2col_gemm_strerror(conv2d_im2col_gemm_error_t err) {
    switch (err) {
        case CONV2D_IM2COL_GEMM_OK: return "Success";
        case CONV2D_IM2COL_GEMM_ERR_NULL: return "Encountered null pointer argument";
        case CONV2D_IM2COL_GEMM_ERR_CAPACITY: return "Capacity limit exceeded";
        case CONV2D_IM2COL_GEMM_ERR_CONVERGENCE: return "Numerical algorithm failed to converge";
        default: return "Unknown error";
    }
}
