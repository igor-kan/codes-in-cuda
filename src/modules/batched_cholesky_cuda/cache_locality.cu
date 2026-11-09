/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for Batched Small-Matrix Cholesky Decomposition.
 * Module: batched_cholesky_cuda
 */

#define BATCHED_CHOLESKY_CUDA_CACHE_LINE 64
#define BATCHED_CHOLESKY_CUDA_TILE_DIM 32

void batched_cholesky_cuda_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += BATCHED_CHOLESKY_CUDA_TILE_DIM) {
        size_t r_end = (r + BATCHED_CHOLESKY_CUDA_TILE_DIM < rows) ? r + BATCHED_CHOLESKY_CUDA_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00005;
            }
        }
    }
}
