#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_radix_bit_partition_d56 {
constexpr int WARP_SIZE = 32;
struct BallotSplitDesc {
    int bit_pos = 0;
    unsigned mask = 0xFFFFFFFFu;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_radix_bit_partition_d56
