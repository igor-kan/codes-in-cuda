#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_softmax_online_safe {
constexpr int WARP_SIZE = 32;
struct OnlineMD {
    float m;
    float d;
};

struct SoftmaxConfig {
    int rows;
    int cols;
};
} // namespace cu_softmax_online_safe
