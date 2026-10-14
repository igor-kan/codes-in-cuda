#include <cuda_runtime.h>
// CUDA implementation of rational function approximant order 14241
__global__ void kernel_pade_approx_14241(const float *in, float *out, int n) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx < n) {
        float x = in[idx];
        out[idx] = (1.0f + x * 1.0f) / (1.0f + x * x * 2.0f);
    }
}
