#include "interface.cuh"

namespace cu_rope_rotary_embedding {
void launch_rope_batched_streams(float** d_batches, int count, RopeConfig cfg, cudaStream_t* streams) {
    for (int i = 0; i < count; ++i) {
        launch_rope_forward(d_batches[i], cfg, streams ? streams[i] : 0);
    }
}
} // namespace cu_rope_rotary_embedding
