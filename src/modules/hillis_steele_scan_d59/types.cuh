#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_hillis_steele_scan_d59 {
constexpr int WARP_SIZE = 32;
struct HillisConfig {
    int tile_len = 256;
    bool inclusive = true;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_hillis_steele_scan_d59
