#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_sobel_edge_2d_d59 {
constexpr int WARP_SIZE = 32;
struct SobelGeom {
    int width = 16;
    int height = 16;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_sobel_edge_2d_d59
