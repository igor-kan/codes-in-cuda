#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_batched_givens_qr_2x2_gpu {
constexpr int WARP_SIZE = 32;
struct GivensPair {
    float c;
    float s;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_batched_givens_qr_2x2_gpu
