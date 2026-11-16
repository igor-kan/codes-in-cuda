#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_upper_triangular_trsv_warp {
constexpr int WARP_SIZE = 32;
struct Trsv32Config {
    int batch_count;
    float diag_shift;
};
} // namespace cu_upper_triangular_trsv_warp
