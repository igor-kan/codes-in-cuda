#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_saxpy_grid_stride_d57 {
constexpr int WARP_SIZE = 32;
struct SaxpyParams {
    float alpha = 2.0f;
    int n = 256;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_saxpy_grid_stride_d57
