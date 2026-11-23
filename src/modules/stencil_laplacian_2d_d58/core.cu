#include "interface.cuh"
#include <cmath>

namespace cu_stencil_laplacian_2d_d58 {

__global__ void laplacian_5pt_kernel(const float* d_in, float* d_out, int w, int h) {
    __shared__ float s[18][18];
    int tx = threadIdx.x, ty = threadIdx.y;
    int gx = blockIdx.x * 16 + tx;
    int gy = blockIdx.y * 16 + ty;
    int cx = min(max(gx, 0), w - 1);
    int cy = min(max(gy, 0), h - 1);
    s[ty + 1][tx + 1] = d_in[cy * w + cx];
    if (tx == 0) s[ty + 1][0] = d_in[cy * w + max(gx - 1, 0)];
    if (tx == 15) s[ty + 1][17] = d_in[cy * w + min(gx + 1, w - 1)];
    if (ty == 0) s[0][tx + 1] = d_in[max(gy - 1, 0) * w + cx];
    if (ty == 15) s[17][tx + 1] = d_in[min(gy + 1, h - 1) * w + cx];
    __syncthreads();
    if (gx < w && gy < h) {
        d_out[gy * w + gx] = s[ty][tx + 1] + s[ty + 2][tx + 1] + s[ty + 1][tx] + s[ty + 1][tx + 2] - 4.0f * s[ty + 1][tx + 1];
    }
}

} // namespace cu_stencil_laplacian_2d_d58
