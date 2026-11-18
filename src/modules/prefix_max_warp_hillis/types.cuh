#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_prefix_max_warp_hillis {
constexpr int WARP_SIZE = 32;
struct ScanMaxCfg {
    int length;
    float init_min;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_prefix_max_warp_hillis
