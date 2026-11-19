#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_dense_gemv_shared_x_gpu {
constexpr int WARP_SIZE = 32;
struct GemvShape {
    int rows;
    int cols;
    float alpha;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_dense_gemv_shared_x_gpu
