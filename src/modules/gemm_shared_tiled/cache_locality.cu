/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for 2D Block-Tiled Matrix GEMM with Double-Buffering.
 * Module: gemm_shared_tiled
 */

#define GEMM_SHARED_TILED_CACHE_LINE 64
#define GEMM_SHARED_TILED_TILE_DIM 32

void gemm_shared_tiled_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += GEMM_SHARED_TILED_TILE_DIM) {
        size_t r_end = (r + GEMM_SHARED_TILED_TILE_DIM < rows) ? r + GEMM_SHARED_TILED_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00005;
            }
        }
    }
}
