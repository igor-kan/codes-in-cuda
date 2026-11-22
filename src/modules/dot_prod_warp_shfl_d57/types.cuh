#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_dot_prod_warp_shfl_d57 {
constexpr int WARP_SIZE = 32;
struct DotProdConfig {
    unsigned active_mask = 0xFFFFFFFFu;
    int block_dim = 256;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_dot_prod_warp_shfl_d57
