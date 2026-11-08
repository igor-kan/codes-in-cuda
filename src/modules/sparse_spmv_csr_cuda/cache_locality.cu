/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for CSR Sparse Matrix-Vector GPU Kernel.
 * Module: sparse_spmv_csr_cuda
 */

#define SPARSE_SPMV_CSR_CUDA_CACHE_LINE_SIZE 64
#define SPARSE_SPMV_CSR_CUDA_L1_TILE_SIZE 32

void sparse_spmv_csr_cuda_cache_tiled_transform(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += SPARSE_SPMV_CSR_CUDA_L1_TILE_SIZE) {
        size_t r_end = (r + SPARSE_SPMV_CSR_CUDA_L1_TILE_SIZE < rows) ? r + SPARSE_SPMV_CSR_CUDA_L1_TILE_SIZE : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.0001;
            }
        }
    }
}
