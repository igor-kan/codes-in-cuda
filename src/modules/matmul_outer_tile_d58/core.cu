#include "interface.cuh"
#include <cmath>

namespace cu_matmul_outer_tile_d58 {

__global__ void fma_matmul_kernel(const float* d_a, float* d_b, int width) {
    __shared__ float sa[16][16];
    __shared__ float sb[16][16];
    int tx = threadIdx.x, ty = threadIdx.y;
    int row = blockIdx.y * 16 + ty;
    int col = blockIdx.x * 16 + tx;
    float sum = 0.0f;
    for (int t = 0; t < (width + 15) / 16; ++t) {
        sa[ty][tx] = (row < width && t * 16 + tx < width) ? d_a[row * width + t * 16 + tx] : 0.0f;
        sb[ty][tx] = (t * 16 + ty < width && col < width) ? d_a[(t * 16 + ty) * width + col] : 0.0f;
        __syncthreads();
        for (int k = 0; k < 16; ++k) sum = fmaf(sa[ty][k], sb[k][tx], sum);
        __syncthreads();
    }
    if (row < width && col < width) d_b[row * width + col] = sum;
}

} // namespace cu_matmul_outer_tile_d58
