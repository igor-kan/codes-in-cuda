#include "interface.cuh"
#include <cmath>

namespace cu_bilateral_1d_range_cuda {

__global__ void bilateral_1d_kernel(const float* __restrict__ in, float* __restrict__ out, int n, int rad, float inv_s2, float inv_r2) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= n) return;
    float center = in[i], num = 0.0f, den = 0.0f;
    for (int d = -rad; d <= rad; ++d) {
        int j = i + d < 0 ? 0 : (i + d >= n ? n - 1 : i + d);
        float val = in[j];
        float diff = val - center;
        float w = expf(-static_cast<float>(d * d) * inv_s2 - diff * diff * inv_r2);
        num += w * val;
        den += w;
    }
    out[i] = num / den;
}
void launch_bilateral_1d(const float* d_in, float* d_out, int n) {
    bilateral_1d_kernel<<<(n + 255) / 256, 256>>>(d_in, d_out, n, 3, 0.25f, 0.5f);
}

} // namespace cu_bilateral_1d_range_cuda
