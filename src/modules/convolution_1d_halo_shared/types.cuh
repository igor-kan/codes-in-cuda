#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_convolution_1d_halo_shared {
constexpr int WARP_SIZE = 32;
struct Conv1DCfg { int n; int radius; float norm; };
} // namespace cu_convolution_1d_halo_shared
