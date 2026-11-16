#include "interface.cuh"

size_t eigen3x3_bytes_required(int count) {
    if (count <= 0) return 0U;
    size_t per_mat = (6U + 3U + 9U) * sizeof(float);
    return static_cast<size_t>(count) * per_mat;
}

int eigen3x3_grid_blocks(int count, int block_threads) {
    int tp = block_threads > 0 ? block_threads : 256;
    return (count + tp - 1) / tp;
}
