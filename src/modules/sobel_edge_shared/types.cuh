#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_sobel_edge_shared {
constexpr int WARP_SIZE = 32;
struct ImageSpec {
    int width;
    int height;
};
} // namespace cu_sobel_edge_shared
