#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_stencil_5pt_halo_tiled {
constexpr int WARP_SIZE = 32;
struct StencilTile {
    int width;
    int height;
    float omega;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_stencil_5pt_halo_tiled
