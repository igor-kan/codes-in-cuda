#include "interface.cuh"

namespace cu_rope_rotary_embedding {
void launch_rope_paired_fast(float* d_q, float* d_k, RopeConfig cfg, cudaStream_t stream) {
    launch_rope_forward(d_q, cfg, stream);
    launch_rope_forward(d_k, cfg, stream);
}
} // namespace cu_rope_rotary_embedding
