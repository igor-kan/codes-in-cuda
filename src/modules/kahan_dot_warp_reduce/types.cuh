#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_kahan_dot_warp_reduce {
constexpr int WARP_SIZE = 32;
struct DotCfg { int n; };
} // namespace cu_kahan_dot_warp_reduce
