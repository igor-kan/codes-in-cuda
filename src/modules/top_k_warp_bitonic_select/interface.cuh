#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_top_k_warp_bitonic_select {
void launch_warp_topk(const float* d_in, float* d_out, int* d_idx, TopKConfig cfg, cudaStream_t stream = 0);
} // namespace cu_top_k_warp_bitonic_select
