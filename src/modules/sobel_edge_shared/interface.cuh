#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_sobel_edge_shared {
void launch_sobel_shared(const float* d_in, float* d_out, ImageSpec spec, cudaStream_t stream);
int validate_image_spec(ImageSpec spec);
void launch_sobel_dual_stream(const float* d_a, float* d_oa, const float* d_b, float* d_ob, ImageSpec spec, cudaStream_t s0, cudaStream_t s1);
float verify_uniform_image_zero_edge(const float* h_out, ImageSpec spec);
} // namespace cu_sobel_edge_shared
