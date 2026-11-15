#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_softmax_online_safe {
void launch_online_softmax(const float* d_in, float* d_out, SoftmaxConfig cfg, cudaStream_t stream);
int validate_softmax_cfg(SoftmaxConfig cfg);
void launch_online_softmax_masked(const float* d_in, const float* d_mask, float* d_out, SoftmaxConfig cfg, cudaStream_t stream);
void launch_softmax_multi_stream(const float** d_ins, float** d_outs, int n, SoftmaxConfig cfg, cudaStream_t* streams);
float verify_softmax_simplex_sum(const float* h_row, int cols);
} // namespace cu_softmax_online_safe
