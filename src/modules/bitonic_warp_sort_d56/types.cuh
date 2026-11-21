#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_bitonic_warp_sort_d56 {
constexpr int WARP_SIZE = 32;
struct BitonicConfig {
    int tile_n = 256;
    bool ascending = true;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_bitonic_warp_sort_d56
