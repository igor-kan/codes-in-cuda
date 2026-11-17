#include "interface.cuh"
namespace cu_box_blur_separable_cuda {
__global__ void blur_horiz_kernel(const float* __restrict__ in, float* __restrict__ tmp, int w, int h, int r) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x >= w || y >= h) return;
    float sum = 0.0f;
    int cnt = 0;
    for (int dx = -r; dx <= r; ++dx) {
        int nx = x + dx;
        if (nx >= 0 && nx < w) { sum += in[y * w + nx]; ++cnt; }
    }
    tmp[y * w + x] = sum / static_cast<float>(cnt);
}
__global__ void blur_vert_kernel(const float* __restrict__ tmp, float* __restrict__ out, int w, int h, int r) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x >= w || y >= h) return;
    float sum = 0.0f;
    int cnt = 0;
    for (int dy = -r; dy <= r; ++dy) {
        int ny = y + dy;
        if (ny >= 0 && ny < h) { sum += tmp[ny * w + x]; ++cnt; }
    }
    out[y * w + x] = sum / static_cast<float>(cnt);
}
void launch_separable_blur(const float* d_in, float* d_tmp, float* d_out, BlurCfg cfg, cudaStream_t stream) {
    dim3 blk(16, 16);
    dim3 grd((cfg.w + 15) / 16, (cfg.h + 15) / 16);
    blur_horiz_kernel<<<grd, blk, 0, stream>>>(d_in, d_tmp, cfg.w, cfg.h, cfg.radius);
    blur_vert_kernel<<<grd, blk, 0, stream>>>(d_tmp, d_out, cfg.w, cfg.h, cfg.radius);
}
} // namespace cu_box_blur_separable_cuda