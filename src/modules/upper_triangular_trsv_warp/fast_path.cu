#include "interface.cuh"

size_t trsv32_workspace_bytes(int batch_count) {
    if (batch_count <= 0) return 0U;
    size_t floats_per_item = 1024U + 32U + 32U;
    return static_cast<size_t>(batch_count) * floats_per_item * sizeof(float);
}

int trsv32_blocks_needed(int batch_count, int warps_per_blk) {
    int w = warps_per_blk > 0 ? warps_per_blk : 4;
    return (batch_count + w - 1) / w;
}
