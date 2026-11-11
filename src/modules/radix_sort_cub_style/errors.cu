/**
 * @file errors.cu
 * @brief Rich diagnostic error reporting for CUB-Style Parallel Block Radix Sort with Warp Shuffles.
 * Module: radix_sort_cub_style
 */

typedef enum radix_sort_cub_style_error_code {
    RADIX_SORT_CUB_STYLE_STATUS_OK = 0,
    RADIX_SORT_CUB_STYLE_ERR_NULL_PTR = -20,
    RADIX_SORT_CUB_STYLE_ERR_OUT_OF_BOUNDS = -21,
    RADIX_SORT_CUB_STYLE_ERR_DIVERGENCE = -22
} radix_sort_cub_style_error_code_t;

const char* radix_sort_cub_style_error_message(radix_sort_cub_style_error_code_t code) {
    switch (code) {
        case RADIX_SORT_CUB_STYLE_STATUS_OK: return "Operational success";
        case RADIX_SORT_CUB_STYLE_ERR_NULL_PTR: return "Null pointer argument";
        case RADIX_SORT_CUB_STYLE_ERR_OUT_OF_BOUNDS: return "Buffer boundary exceeded";
        case RADIX_SORT_CUB_STYLE_ERR_DIVERGENCE: return "Numerical divergence detected";
        default: return "Unspecified error code";
    }
}
