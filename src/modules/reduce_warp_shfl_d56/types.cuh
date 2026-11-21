#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_reduce_warp_shfl_d56 {
constexpr int WARP_SIZE = 32;
struct ReductionSpec {
    unsigned lane_mask = 0xFFFFFFFFu;
    int warp_sz = 32;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_reduce_warp_shfl_d56
