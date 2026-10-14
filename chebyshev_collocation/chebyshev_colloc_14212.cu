#include <cuda_runtime.h>
// CUDA implementation of chebyshev collocation node order 14212
__global__ void kernel_chebyshev_colloc_14212(const float *in, float *out, int n) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx < n) {
        float x = in[idx];
        out[idx] = __cosf(3.14159265f * 2.0f / 3.0f) * x;
    }
}
