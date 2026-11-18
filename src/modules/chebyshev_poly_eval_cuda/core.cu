#include "interface.cuh"
#include <cmath>

namespace cu_chebyshev_poly_eval_cuda {

__global__ void clenshaw_kernel(const float* __restrict__ x, float* __restrict__ y, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= n) return;
    float xv = x[i];
    float b2 = 0.0f, b1 = 0.5f;
    float b0 = 1.0f + 2.0f * xv * b1 - b2;
    y[i] = 1.0f + xv * b0 - b1;
}
void launch_clenshaw_eval(const float* d_x, float* d_y, int n) {
    clenshaw_kernel<<<(n + 255) / 256, 256>>>(d_x, d_y, n);
}

} // namespace cu_chebyshev_poly_eval_cuda
