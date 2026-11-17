#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_convolution_1d_halo_shared {
void launch_conv1d_halo(const float* d_in, const float* d_filt, float* d_out, Conv1DCfg cfg, cudaStream_t stream = 0);
} // namespace cu_convolution_1d_halo_shared
