#include "interface.cuh"
#include <cmath>

namespace cu_saxpy_grid_stride_d57 {

__global__ void saxpy_stride_kernel(const float* d_x, float* d_y, float alpha, int n) {
    int stride = blockDim.x * gridDim.x;
    for (int idx = blockIdx.x * blockDim.x + threadIdx.x; idx < n; idx += stride) {
        d_y[idx] = alpha * d_x[idx] + d_y[idx];
    }
}

} // namespace cu_saxpy_grid_stride_d57
