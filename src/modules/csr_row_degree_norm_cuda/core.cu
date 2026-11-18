#include "interface.cuh"
#include <cmath>

namespace cu_csr_row_degree_norm_cuda {

__global__ void degree_norm_kernel(const float* __restrict__ deg, float* __restrict__ val, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= n) return;
    float d = deg[i] > 1.0f ? deg[i] : 1.0f;
    val[i] = rsqrtf(d);
}
void launch_degree_norm(const float* d_deg, float* d_val, int n) {
    degree_norm_kernel<<<(n + 255) / 256, 256>>>(d_deg, d_val, n);
}

} // namespace cu_csr_row_degree_norm_cuda
