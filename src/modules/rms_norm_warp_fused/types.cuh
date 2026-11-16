#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_rms_norm_warp_fused {
constexpr int WARP_SIZE = 32;
struct RmsNormConfig {
    int rows;
    int hidden_dim;
    float eps;
    int block_size;
};
} // namespace cu_rms_norm_warp_fused
