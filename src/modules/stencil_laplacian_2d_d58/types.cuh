#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_stencil_laplacian_2d_d58 {
constexpr int WARP_SIZE = 32;
struct LaplacianDesc {
    int width = 16;
    int height = 16;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_stencil_laplacian_2d_d58
