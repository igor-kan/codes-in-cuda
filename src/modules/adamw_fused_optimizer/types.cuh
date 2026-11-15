#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_adamw_fused_optimizer {
constexpr int WARP_SIZE = 32;
struct AdamWConfig {
    float lr;
    float beta1;
    float beta2;
    float eps;
    float weight_decay;
    int step;
    int n_params;
};
} // namespace cu_adamw_fused_optimizer
