#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_box_blur_separable_cuda {
void launch_separable_blur(const float* d_in, float* d_tmp, float* d_out, BlurCfg cfg, cudaStream_t stream = 0);
} // namespace cu_box_blur_separable_cuda
