#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_sell_c_sigma_spmv_cuda {
constexpr int WARP_SIZE = 32;
struct SellSlice {
    int slice_rows;
    int max_row_len;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_sell_c_sigma_spmv_cuda
