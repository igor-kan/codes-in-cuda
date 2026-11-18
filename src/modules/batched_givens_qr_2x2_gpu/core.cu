#include "interface.cuh"
#include <cmath>

namespace cu_batched_givens_qr_2x2_gpu {

__global__ void givens_qr_kernel(const float* __restrict__ in, float* __restrict__ out, int batch) {
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if (b >= batch) return;
    float a00 = in[b], a10 = in[b] * 0.5f;
    float r = hypotf(a00, a10);
    float c = r > 0.0f ? a00 / r : 1.0f;
    float s = r > 0.0f ? a10 / r : 0.0f;
    out[b] = c * a00 + s * a10;
}
void launch_batched_givens(const float* d_in, float* d_out, int batch) {
    givens_qr_kernel<<<(batch + 255) / 256, 256>>>(d_in, d_out, batch);
}

} // namespace cu_batched_givens_qr_2x2_gpu
