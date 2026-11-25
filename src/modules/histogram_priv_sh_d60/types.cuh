#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_histogram_priv_sh_d60 {
constexpr int WARP_SIZE = 32;
enum class KernelStatus {
    Ok = 0,
    InvalidDimension = 1,
    LaunchError = 2
};
struct HistLayout {
    int bins;
    float scale;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_histogram_priv_sh_d60
