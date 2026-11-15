#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_layer_norm_welford_warp {
constexpr int WARP_SIZE = 32;
struct WelfordState {
    float count;
    float mean;
    float m2;
};

struct LayerNormParams {
    int rows;
    int cols;
    float eps;
};
} // namespace cu_layer_norm_welford_warp
