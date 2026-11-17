#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_csr_jacobi_spmv_iter {
constexpr int WARP_SIZE = 32;
struct JacobiCfg { int rows; float omega; };
} // namespace cu_csr_jacobi_spmv_iter
