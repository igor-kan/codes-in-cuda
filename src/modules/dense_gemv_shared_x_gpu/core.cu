#include "interface.cuh"
#include <cmath>

namespace cu_dense_gemv_shared_x_gpu {

__global__ void shared_gemv_kernel(const float* __restrict__ A, const float* __restrict__ x, float* __restrict__ y, int rows, int cols) {
    __shared__ float sx[256];
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    float acc = 0.0f;
    for (int t = 0; t < cols; t += 256) {
        if (t + threadIdx.x < cols) sx[threadIdx.x] = x[t + threadIdx.x];
        __syncthreads();
        if (row < rows) {
            int lim = (t + 256 < cols) ? 256 : (cols - t);
            for (int k = 0; k < lim; ++k) acc += A[row * cols + t + k] * sx[k];
        }
        __syncthreads();
    }
    if (row < rows) y[row] = acc;
}
void launch_shared_gemv(const float* d_a, float* d_y, int n) {
    shared_gemv_kernel<<<1, 256>>>(d_a, d_a, d_y, 16, n > 16 ? 16 : n);
}

} // namespace cu_dense_gemv_shared_x_gpu
