/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for Tensor Core FP8/FP16 Mixed-Precision MMA Kernel.
 * Module: warp_matrix_tensor_fp8
 */

#define WARP_MATRIX_TENSOR_FP8_CACHE_LINE 64
#define WARP_MATRIX_TENSOR_FP8_TILE_DIM 32

void warp_matrix_tensor_fp8_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += WARP_MATRIX_TENSOR_FP8_TILE_DIM) {
        size_t r_end = (r + WARP_MATRIX_TENSOR_FP8_TILE_DIM < rows) ? r + WARP_MATRIX_TENSOR_FP8_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00005;
            }
        }
    }
}
