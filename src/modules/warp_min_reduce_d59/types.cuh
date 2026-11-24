#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_warp_min_reduce_d59 {
constexpr int WARP_SIZE = 32;
struct WarpMinDesc {
    unsigned lane_mask = 0xFFFFFFFFu;
    int threads = 256;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_warp_min_reduce_d59
