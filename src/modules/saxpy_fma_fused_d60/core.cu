#include "interface.cuh"
#include <cmath>

namespace cu_saxpy_fma_fused_d60 {

__global__ void saxpy_fma_kernel_d60(const float* x, float* y, int n, float alpha, float beta) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = idx; i < n; i += stride) {
        y[i] = fmaf(alpha, x[i], beta);
    }
}

} // namespace cu_saxpy_fma_fused_d60
