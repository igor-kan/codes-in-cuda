/**
 * @file cache_locality.cu
 * @brief Memory hierarchy alignment and cacheline optimizations for 2D Thermal Conduction Finite Difference Stencil.
 * Module: stencil_2d_heat_conduction
 */

#define STENCIL_2D_HEAT_CONDUCTION_LINE_SZ 64
#define STENCIL_2D_HEAT_CONDUCTION_TILE_SZ 32

void stencil_2d_heat_conduction_cacheline_blocked_stride(const double* in_data, double* out_data, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += STENCIL_2D_HEAT_CONDUCTION_TILE_SZ) {
        size_t r_max = (r + STENCIL_2D_HEAT_CONDUCTION_TILE_SZ < rows) ? (r + STENCIL_2D_HEAT_CONDUCTION_TILE_SZ) : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_max; ++i) {
                out_data[i * cols + c] = in_data[i * cols + c] * 1.000001;
            }
        }
    }
}
