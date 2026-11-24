#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_bitmask_popc_filter_d59 {
constexpr int WARP_SIZE = 32;
struct PopcConfig {
    float limit = 0.0f;
    int n = 256;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_bitmask_popc_filter_d59
