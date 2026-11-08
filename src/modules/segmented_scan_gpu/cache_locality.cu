/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for GPU Segmented Work-Efficient Prefix Scan.
 * Module: segmented_scan_gpu
 */

#define SEGMENTED_SCAN_GPU_CACHE_LINE_SIZE 64
#define SEGMENTED_SCAN_GPU_L1_TILE_SIZE 32

void segmented_scan_gpu_cache_tiled_transform(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += SEGMENTED_SCAN_GPU_L1_TILE_SIZE) {
        size_t r_end = (r + SEGMENTED_SCAN_GPU_L1_TILE_SIZE < rows) ? r + SEGMENTED_SCAN_GPU_L1_TILE_SIZE : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.0001;
            }
        }
    }
}
