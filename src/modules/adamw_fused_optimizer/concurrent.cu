#include "interface.cuh"

namespace cu_adamw_fused_optimizer {
void launch_adamw_multi_tensor(
    float** d_params, const float** d_grads, float** d_ms, float** d_vs,
    int num_tensors, const AdamWConfig* cfgs, cudaStream_t* streams) {
    for (int t = 0; t < num_tensors; ++t) {
        launch_adamw_fused(d_params[t], d_grads[t], d_ms[t], d_vs[t], cfgs[t], streams ? streams[t] : 0);
    }
}
} // namespace cu_adamw_fused_optimizer
