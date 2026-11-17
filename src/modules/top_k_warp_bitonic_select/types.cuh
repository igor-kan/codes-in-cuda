#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_top_k_warp_bitonic_select {
constexpr int WARP_SIZE = 32;
struct TopKConfig { int rows; int cols; int k; };
} // namespace cu_top_k_warp_bitonic_select
