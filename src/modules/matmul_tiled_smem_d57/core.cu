#include "interface.cuh"
#include <cmath>

namespace cu_matmul_tiled_smem_d57 {

__global__ void matmul_tile16_kernel(const float* d_a, float* d_b, int width) {
    __shared__ float asub[16][16];
    __shared__ float bsub[16][16];
    int tx = threadIdx.x, ty = threadIdx.y;
    int col = blockIdx.x * 16 + tx;
    int row = blockIdx.y * 16 + ty;
    float acc = 0.0f;
    for (int t = 0; t < (width + 15) / 16; ++t) {
        int a_col = t * 16 + tx;
        int b_row = t * 16 + ty;
        asub[ty][tx] = (row < width && a_col < width) ? d_a[row * width + a_col] : 0.0f;
        bsub[ty][tx] = (b_row < width && col < width) ? d_a[b_row * width + col] : 0.0f;
        __syncthreads();
        for (int k = 0; k < 16; ++k) acc += asub[ty][k] * bsub[k][tx];
        __syncthreads();
    }
    if (row < width && col < width) d_b[row * width + col] = acc;
}

} // namespace cu_matmul_tiled_smem_d57
