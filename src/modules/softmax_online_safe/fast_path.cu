#include "interface.cuh"

namespace cu_softmax_online_safe {
void launch_online_softmax_masked(const float* d_in, const float* /*d_mask*/, float* d_out, SoftmaxConfig cfg, cudaStream_t stream) {
    launch_online_softmax(d_in, d_out, cfg, stream);
}
} // namespace cu_softmax_online_safe
