#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_relu_softmax_act_d58 {
constexpr int WARP_SIZE = 32;
struct ActivationDesc {
    float neg_slope = 0.01f;
    int n = 256;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_relu_softmax_act_d58
