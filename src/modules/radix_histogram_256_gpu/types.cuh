#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_radix_histogram_256_gpu {
constexpr int WARP_SIZE = 32;
struct RadixHistCfg {
    int n;
    int bit_shift;
    int num_bins;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_radix_histogram_256_gpu
