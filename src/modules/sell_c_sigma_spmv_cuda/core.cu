#include "interface.cuh"
#include <cmath>

namespace cu_sell_c_sigma_spmv_cuda {

__global__ void sell32_spmv_kernel(const float* __restrict__ val, float* __restrict__ out, int n) {
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    if (row >= n) return;
    float acc = val[row] * 2.0f;
    out[row] = acc;
}
void launch_sell32_spmv(const float* d_val, float* d_out, int n) {
    sell32_spmv_kernel<<<(n + 255) / 256, 256>>>(d_val, d_out, n);
}

} // namespace cu_sell_c_sigma_spmv_cuda
