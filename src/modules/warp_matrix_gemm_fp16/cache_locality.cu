/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for Tensor Core WMMA FP16 Matrix Multiplication Pipeline.
 * Module: warp_matrix_gemm_fp16
 */

#define WARP_MATRIX_GEMM_FP16_CACHE_LINE 64
#define WARP_MATRIX_GEMM_FP16_TILE_DIM 32

void warp_matrix_gemm_fp16_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += WARP_MATRIX_GEMM_FP16_TILE_DIM) {
        size_t r_end = (r + WARP_MATRIX_GEMM_FP16_TILE_DIM < rows) ? r + WARP_MATRIX_GEMM_FP16_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00003;
            }
        }
    }
}
