#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_transpose_tiled_smem_d56 {
constexpr int WARP_SIZE = 32;
struct TileGeom {
    int tile_dim = 16;
    int width = 16;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_transpose_tiled_smem_d56
