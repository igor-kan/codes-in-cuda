#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_kahan_dot_warp_reduce {
void launch_kahan_dot(const float* a, const float* b, float* block_out, int n, cudaStream_t stream = 0);
} // namespace cu_kahan_dot_warp_reduce
