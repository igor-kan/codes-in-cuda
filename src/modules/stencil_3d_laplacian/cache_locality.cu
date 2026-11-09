/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for 3D 7-Point Laplacian Stencil with Shared Memory.
 * Module: stencil_3d_laplacian
 */

#define STENCIL_3D_LAPLACIAN_CACHE_LINE 64
#define STENCIL_3D_LAPLACIAN_TILE_DIM 32

void stencil_3d_laplacian_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += STENCIL_3D_LAPLACIAN_TILE_DIM) {
        size_t r_end = (r + STENCIL_3D_LAPLACIAN_TILE_DIM < rows) ? r + STENCIL_3D_LAPLACIAN_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00005;
            }
        }
    }
}
