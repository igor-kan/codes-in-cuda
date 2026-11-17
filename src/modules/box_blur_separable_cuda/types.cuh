#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_box_blur_separable_cuda {
constexpr int WARP_SIZE = 32;
struct BlurCfg { int w; int h; int radius; };
} // namespace cu_box_blur_separable_cuda
