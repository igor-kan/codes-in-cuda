#include "interface.cuh"
#include <cmath>

namespace cu_box_blur_clamp_2d_d57 {

__global__ void box_blur2d_kernel(const float* d_in, float* d_out, int w, int h) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x >= w || y >= h) return;
    float sum = 0.0f;
    for (int dy = -1; dy <= 1; ++dy) {
        int cy = min(max(y + dy, 0), h - 1);
        for (int dx = -1; dx <= 1; ++dx) {
            int cx = min(max(x + dx, 0), w - 1);
            sum += d_in[cy * w + cx];
        }
    }
    d_out[y * w + x] = sum / 9.0f;
}

} // namespace cu_box_blur_clamp_2d_d57
