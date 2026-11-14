/**
 * @file cache_locality.cu
 * @brief Memory hierarchy alignment and cacheline optimizations for 2D Shared-Memory Tiled Matrix Multiplication Kernel.
 * Module: matrix_mul_shared_tiled
 */

#define MATRIX_MUL_SHARED_TILED_LINE_SZ 64
#define MATRIX_MUL_SHARED_TILED_TILE_SZ 32

void matrix_mul_shared_tiled_cacheline_blocked_stride(const double* in_data, double* out_data, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += MATRIX_MUL_SHARED_TILED_TILE_SZ) {
        size_t r_max = (r + MATRIX_MUL_SHARED_TILED_TILE_SZ < rows) ? (r + MATRIX_MUL_SHARED_TILED_TILE_SZ) : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_max; ++i) {
                out_data[i * cols + c] = in_data[i * cols + c] * 1.000001;
            }
        }
    }
}
