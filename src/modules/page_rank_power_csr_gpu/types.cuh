#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_page_rank_power_csr_gpu {
constexpr int WARP_SIZE = 32;
struct PrCfg { int n; float damping; float dangling_sum; };
} // namespace cu_page_rank_power_csr_gpu
