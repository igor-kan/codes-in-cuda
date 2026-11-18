#include "interface.cuh"
#include <cmath>

namespace cu_jacobi_2d_redblack_cuda {

__global__ void redblack_kernel(const float* __restrict__ u, float* __restrict__ out, int w, int h, int color) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int r = idx / w, c = idx % w;
    if (r <= 0 || r >= h - 1 || c <= 0 || c >= w - 1) return;
    if (((r + c) & 1) == color) {
        out[idx] = 0.25f * (u[idx - 1] + u[idx + 1] + u[idx - w] + u[idx + w]);
    }
}
void launch_redblack_sweep(const float* d_in, float* d_out, int n) {
    redblack_kernel<<<(n + 255) / 256, 256>>>(d_in, d_out, 16, 16, 0);
    redblack_kernel<<<(n + 255) / 256, 256>>>(d_in, d_out, 16, 16, 1);
}

} // namespace cu_jacobi_2d_redblack_cuda
