#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_batched_tridiag_pcr_cuda {
void launch_pcr_batch(const float* a, const float* b, const float* c, float* d_rhs, PcrBatch cfg);
} // namespace cu_batched_tridiag_pcr_cuda
