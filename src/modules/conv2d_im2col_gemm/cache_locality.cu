/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for 2D Convolution via Im2Col and Tensor GEMM.
 * Module: conv2d_im2col_gemm
 */

#define CONV2D_IM2COL_GEMM_CACHE_LINE_SIZE 64
#define CONV2D_IM2COL_GEMM_L1_TILE_SIZE 32

void conv2d_im2col_gemm_cache_tiled_transform(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += CONV2D_IM2COL_GEMM_L1_TILE_SIZE) {
        size_t r_end = (r + CONV2D_IM2COL_GEMM_L1_TILE_SIZE < rows) ? r + CONV2D_IM2COL_GEMM_L1_TILE_SIZE : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.0001;
            }
        }
    }
}
