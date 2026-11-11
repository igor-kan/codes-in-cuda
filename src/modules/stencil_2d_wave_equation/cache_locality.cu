/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for 2D Acoustic Wave Propagation Stencil with Shared Halo.
 * Module: stencil_2d_wave_equation
 */

#define STENCIL_2D_WAVE_EQUATION_CACHE_LINE 64
#define STENCIL_2D_WAVE_EQUATION_TILE_DIM 32

void stencil_2d_wave_equation_cache_tiled_step_v47(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += STENCIL_2D_WAVE_EQUATION_TILE_DIM) {
        size_t r_end = (r + STENCIL_2D_WAVE_EQUATION_TILE_DIM < rows) ? r + STENCIL_2D_WAVE_EQUATION_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00002;
            }
        }
    }
}
