#include "interface.cuh"
#include <cmath>

namespace cu_relu_softmax_act_d58 {

__global__ void leaky_relu_kernel(const float* d_in, float* d_out, float slope, int n) {
    int stride = blockDim.x * gridDim.x;
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += stride) {
        float x = d_in[i];
        d_out[i] = (x > 0.0f) ? x : (slope * x);
    }
}

} // namespace cu_relu_softmax_act_d58
