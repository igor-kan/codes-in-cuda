#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_bilateral_filter_shared2d {
constexpr int WARP_SIZE = 32;
struct BilateralConfig {
    int width;
    int height;
    int radius;
    float inv_two_sigma_s2;
    float inv_two_sigma_r2;
};
} // namespace cu_bilateral_filter_shared2d
