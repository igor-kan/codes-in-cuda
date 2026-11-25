#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_saxpy_fma_fused_d60 {
constexpr int WARP_SIZE = 32;
enum class KernelStatus {
    Ok = 0,
    InvalidDimension = 1,
    LaunchError = 2
};
struct AffineScale {
    float alpha;
    float beta;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_saxpy_fma_fused_d60
