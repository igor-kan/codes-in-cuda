/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for Sparse Matrix Dense Matrix (SpMM) GPU Accelerator.
 * Module: sparse_spmm_csr_cuda
 */

#define SPARSE_SPMM_CSR_CUDA_CACHE_LINE 64
#define SPARSE_SPMM_CSR_CUDA_TILE_DIM 32

void sparse_spmm_csr_cuda_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += SPARSE_SPMM_CSR_CUDA_TILE_DIM) {
        size_t r_end = (r + SPARSE_SPMM_CSR_CUDA_TILE_DIM < rows) ? r + SPARSE_SPMM_CSR_CUDA_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00005;
            }
        }
    }
}
