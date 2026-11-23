#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_matmul_outer_tile_d58 {
constexpr int WARP_SIZE = 32;
struct OuterTileDesc {
    int tile = 16;
    int dim = 16;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_matmul_outer_tile_d58
