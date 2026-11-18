#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_csr_row_degree_norm_cuda {
constexpr int WARP_SIZE = 32;
struct CsrNormCfg {
    int num_nodes;
    int nnz;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_csr_row_degree_norm_cuda
