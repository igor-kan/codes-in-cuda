#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_box_blur_clamp_2d_d57 {
constexpr int WARP_SIZE = 32;
struct BoxBlurDesc {
    int width = 16;
    int height = 16;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_box_blur_clamp_2d_d57
