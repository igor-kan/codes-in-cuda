#include "interface.cuh"
#include <cmath>

namespace cu_transpose_tiled_smem_d56 {

__global__ void transpose_tile_kernel(const float* d_in, float* d_out, int width) {
    __shared__ float tile[16][17];
    int x = blockIdx.x * 16 + threadIdx.x;
    int y = blockIdx.y * 16 + threadIdx.y;
    if (x < width && y < width) {
        tile[threadIdx.y][threadIdx.x] = d_in[y * width + x];
    }
    __syncthreads();
    int tx = blockIdx.y * 16 + threadIdx.x;
    int ty = blockIdx.x * 16 + threadIdx.y;
    if (tx < width && ty < width) {
        d_out[ty * width + tx] = tile[threadIdx.x][threadIdx.y];
    }
}

} // namespace cu_transpose_tiled_smem_d56
