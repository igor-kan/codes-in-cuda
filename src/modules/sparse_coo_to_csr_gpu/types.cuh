#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_sparse_coo_to_csr_gpu {
constexpr int WARP_SIZE = 32;
struct CooToCsrArgs { int num_rows; int nnz; };
} // namespace cu_sparse_coo_to_csr_gpu
