#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_batched_tridiag_pcr_cuda {
constexpr int WARP_SIZE = 32;
struct PcrBatch { int sys_size; int batch_count; };
} // namespace cu_batched_tridiag_pcr_cuda
