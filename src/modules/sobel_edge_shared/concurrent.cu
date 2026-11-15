#include "interface.cuh"

namespace cu_sobel_edge_shared {
void launch_sobel_dual_stream(const float* d_a, float* d_oa, const float* d_b, float* d_ob, ImageSpec spec, cudaStream_t s0, cudaStream_t s1) {
    launch_sobel_shared(d_a, d_oa, spec, s0);
    launch_sobel_shared(d_b, d_ob, spec, s1);
}
} // namespace cu_sobel_edge_shared
