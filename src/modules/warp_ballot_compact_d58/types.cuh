#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_warp_ballot_compact_d58 {
constexpr int WARP_SIZE = 32;
struct CompactDesc {
    float threshold = 0.5f;
    unsigned mask = 0xFFFFFFFFu;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_warp_ballot_compact_d58
