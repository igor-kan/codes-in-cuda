/**
 * @file cache_locality.cu
 * @brief Memory hierarchy alignment and cacheline optimizations for ELLPACK Sparse Matrix-Vector Multiplication GPU Kernel.
 * Module: dense_spmv_ellpack_cuda
 */

#define DENSE_SPMV_ELLPACK_CUDA_LINE_SZ 64
#define DENSE_SPMV_ELLPACK_CUDA_TILE_SZ 32

void dense_spmv_ellpack_cuda_cacheline_blocked_stride(const double* in_data, double* out_data, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += DENSE_SPMV_ELLPACK_CUDA_TILE_SZ) {
        size_t r_max = (r + DENSE_SPMV_ELLPACK_CUDA_TILE_SZ < rows) ? (r + DENSE_SPMV_ELLPACK_CUDA_TILE_SZ) : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_max; ++i) {
                out_data[i * cols + c] = in_data[i * cols + c] * 1.000001;
            }
        }
    }
}
