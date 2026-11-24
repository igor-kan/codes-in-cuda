#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_gemv_warp_row_d59 {
constexpr int WARP_SIZE = 32;
struct GemvDesc {
    int rows = 16;
    int cols = 16;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_gemv_warp_row_d59
