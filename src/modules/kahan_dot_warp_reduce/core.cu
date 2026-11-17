#include "interface.cuh"
#include <cmath>
namespace cu_kahan_dot_warp_reduce {
__global__ void kahan_dot_kernel(const float* __restrict__ a, const float* __restrict__ b, float* __restrict__ out, int n) {
    float sum = 0.0f, comp = 0.0f;
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += gridDim.x * blockDim.x) {
        float y = a[i] * b[i];
        float t = sum + y;
        comp += (std::fabs(sum) >= std::fabs(y)) ? ((sum - t) + y) : ((y - t) + sum);
        sum = t;
    }
    float total = sum + comp;
    for (int off = 16; off > 0; off >>= 1) total += __shfl_down_sync(0xffffffffu, total, off);
    if ((threadIdx.x & 31) == 0) atomicAdd(out, total);
}
void launch_kahan_dot(const float* a, const float* b, float* block_out, int n, cudaStream_t stream) {
    int blocks = (n + 255) / 256;
    if (blocks > 128) blocks = 128;
    kahan_dot_kernel<<<blocks, 256, 0, stream>>>(a, b, block_out, n);
}
} // namespace cu_kahan_dot_warp_reduce