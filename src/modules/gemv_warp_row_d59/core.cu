#include "interface.cuh"
#include <cmath>

namespace cu_gemv_warp_row_d59 {

__global__ void warp_gemv_kernel(const float* d_mat, const float* d_vec, float* d_out, int rows, int cols) {
    int warp_id = (blockIdx.x * blockDim.x + threadIdx.x) >> 5;
    int lane = threadIdx.x & 31;
    if (warp_id >= rows) return;
    float acc = 0.0f;
    for (int c = lane; c < cols; c += 32) {
        acc = fmaf(d_mat[warp_id * cols + c], d_vec[c], acc);
    }
    for (int off = 16; off > 0; off >>= 1) {
        acc += __shfl_down_sync(0xFFFFFFFFu, acc, off);
    }
    if (lane == 0) d_out[warp_id] = acc;
}

} // namespace cu_gemv_warp_row_d59
