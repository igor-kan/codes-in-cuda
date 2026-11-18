#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_huber_loss_grad_fused_gpu {
constexpr int WARP_SIZE = 32;
struct HuberParams {
    float delta;
    int count;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_huber_loss_grad_fused_gpu
