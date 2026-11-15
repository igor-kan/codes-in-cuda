#include "interface.cuh"
#include <cmath>

namespace cu_sobel_edge_shared {
constexpr int TILE_W = 16;
constexpr int TILE_H = 16;

__global__ void sobel_shared_kernel(const float* __restrict__ in, float* __restrict__ out, int w, int h) {
    __shared__ float tile[TILE_H + 2][TILE_W + 2];
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int gx = blockIdx.x * TILE_W + tx;
    int gy = blockIdx.y * TILE_H + ty;

    for (int dy = ty; dy < TILE_H + 2; dy += TILE_H) {
        int sy = min(max(blockIdx.y * TILE_H + dy - 1, 0), h - 1);
        for (int dx = tx; dx < TILE_W + 2; dx += TILE_W) {
            int sx = min(max(blockIdx.x * TILE_W + dx - 1, 0), w - 1);
            tile[dy][dx] = in[sy * w + sx];
        }
    }
    __syncthreads();

    if (gx < w && gy < h) {
        float tl = tile[ty][tx],     tc = tile[ty][tx + 1],     tr = tile[ty][tx + 2];
        float ml = tile[ty + 1][tx],                             mr = tile[ty + 1][tx + 2];
        float bl = tile[ty + 2][tx], bc = tile[ty + 2][tx + 1], br = tile[ty + 2][tx + 2];

        float dx_g = -tl + tr - 2.0f * ml + 2.0f * mr - bl + br;
        float dy_g = -tl - 2.0f * tc - tr + bl + 2.0f * bc + br;
        out[gy * w + gx] = hypotf(dx_g, dy_g);
    }
}

void launch_sobel_shared(const float* d_in, float* d_out, ImageSpec spec, cudaStream_t stream) {
    dim3 block(TILE_W, TILE_H);
    dim3 grid((spec.width + TILE_W - 1) / TILE_W, (spec.height + TILE_H - 1) / TILE_H);
    sobel_shared_kernel<<<grid, block, 0, stream>>>(d_in, d_out, spec.width, spec.height);
}
} // namespace cu_sobel_edge_shared
