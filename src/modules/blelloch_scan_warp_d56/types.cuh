#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_blelloch_scan_warp_d56 {
constexpr int WARP_SIZE = 32;
struct ScanBlockDesc {
    int block_elems = 256;
    bool inclusive = false;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_blelloch_scan_warp_d56
