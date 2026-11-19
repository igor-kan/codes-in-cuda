#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_reduce_argmax_warp_cuda {
constexpr int WARP_SIZE = 32;
struct ArgMaxPair {
    float val;
    int idx;
    int pad0;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_reduce_argmax_warp_cuda
