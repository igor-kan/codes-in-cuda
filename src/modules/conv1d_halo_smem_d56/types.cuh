#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_conv1d_halo_smem_d56 {
constexpr int WARP_SIZE = 32;
struct StencilSpec {
    int radius = 2;
    int tile = 256;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_conv1d_halo_smem_d56
