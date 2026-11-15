#include "interface.cuh"

namespace cu_softmax_online_safe {
void launch_softmax_multi_stream(const float** d_ins, float** d_outs, int n, SoftmaxConfig cfg, cudaStream_t* streams) {
    for (int i = 0; i < n; ++i) {
        launch_online_softmax(d_ins[i], d_outs[i], cfg, streams ? streams[i] : 0);
    }
}
} // namespace cu_softmax_online_safe
