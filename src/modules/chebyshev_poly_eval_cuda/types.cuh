#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_chebyshev_poly_eval_cuda {
constexpr int WARP_SIZE = 32;
struct ChebSeries {
    int degree;
    float c0;
    float c1;
    float c2;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_chebyshev_poly_eval_cuda
