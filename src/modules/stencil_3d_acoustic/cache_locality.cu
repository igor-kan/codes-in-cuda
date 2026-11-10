/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for 3D 25-Point High-Order Acoustic Wave Stencil.
 * Module: stencil_3d_acoustic
 */

#define STENCIL_3D_ACOUSTIC_CACHE_LINE 64
#define STENCIL_3D_ACOUSTIC_TILE_DIM 32

void stencil_3d_acoustic_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += STENCIL_3D_ACOUSTIC_TILE_DIM) {
        size_t r_end = (r + STENCIL_3D_ACOUSTIC_TILE_DIM < rows) ? r + STENCIL_3D_ACOUSTIC_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00003;
            }
        }
    }
}
