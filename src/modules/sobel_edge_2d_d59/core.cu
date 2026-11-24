#include "interface.cuh"
#include <cmath>

namespace cu_sobel_edge_2d_d59 {

__global__ void sobel_grad2d_kernel(const float* d_in, float* d_out, int w, int h) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x >= w || y >= h) return;
    auto at = [&](int px, int py) {
        int cx = min(max(px, 0), w - 1);
        int cy = min(max(py, 0), h - 1);
        return d_in[cy * w + cx];
    };
    float gx = -at(x-1,y-1) + at(x+1,y-1) - 2.0f*at(x-1,y) + 2.0f*at(x+1,y) - at(x-1,y+1) + at(x+1,y+1);
    float gy = -at(x-1,y-1) - 2.0f*at(x,y-1) - at(x+1,y-1) + at(x-1,y+1) + 2.0f*at(x,y+1) + at(x+1,y+1);
    d_out[y * w + x] = hypotf(gx, gy);
}

} // namespace cu_sobel_edge_2d_d59
