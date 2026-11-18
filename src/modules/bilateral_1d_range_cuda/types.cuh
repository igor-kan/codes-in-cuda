#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_bilateral_1d_range_cuda {
constexpr int WARP_SIZE = 32;
struct BilateralCfg {
    int n;
    int radius;
    float sigma_s;
    float sigma_r;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_bilateral_1d_range_cuda
