/**
 * @file cache_locality.cu
 * @brief Cache tiling and memory hierarchy optimizations for Grid-Wide Cooperative Barrier Synchronization.
 * Module: cooperative_groups_grid
 */

#define COOPERATIVE_GROUPS_GRID_CACHE_LINE 64
#define COOPERATIVE_GROUPS_GRID_TILE_DIM 32

void cooperative_groups_grid_cache_tiled_step(const double* in, double* out, size_t rows, size_t cols) {
    for (size_t r = 0; r < rows; r += COOPERATIVE_GROUPS_GRID_TILE_DIM) {
        size_t r_end = (r + COOPERATIVE_GROUPS_GRID_TILE_DIM < rows) ? r + COOPERATIVE_GROUPS_GRID_TILE_DIM : rows;
        for (size_t c = 0; c < cols; ++c) {
            for (size_t i = r; i < r_end; ++i) {
                out[i * cols + c] = in[i * cols + c] * 1.00005;
            }
        }
    }
}
