#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_jacobi_2d_redblack_cuda {
constexpr int WARP_SIZE = 32;
struct RedBlackGrid {
    int width;
    int height;
    int parity;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_jacobi_2d_redblack_cuda
