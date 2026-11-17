#include "interface.cuh"
namespace cu_convolution_1d_halo_shared {
__global__ void conv1d_halo_kernel(const float* __restrict__ in, const float* __restrict__ filt, float* __restrict__ out, int n, int r, float norm) {
    extern __shared__ float tile[];
    int tid = threadIdx.x;
    int gid = blockIdx.x * blockDim.x + tid;
    tile[tid + r] = (gid < n) ? in[gid] : 0.0f;
    if (tid < r) {
        int li = gid - r;
        int ri = gid + blockDim.x;
        tile[tid] = (li >= 0) ? in[li] : 0.0f;
        tile[tid + blockDim.x + r] = (ri < n) ? in[ri] : 0.0f;
    }
    __syncthreads();
    if (gid < n) {
        float acc = 0.0f;
        for (int k = -r; k <= r; ++k) acc = fmaf(tile[tid + r + k], filt[k + r], acc);
        out[gid] = acc * norm;
    }
}
void launch_conv1d_halo(const float* d_in, const float* d_filt, float* d_out, Conv1DCfg cfg, cudaStream_t stream) {
    int blocks = (cfg.n + 255) / 256;
    std::size_t sh = static_cast<std::size_t>(256 + 2 * cfg.radius) * sizeof(float);
    conv1d_halo_kernel<<<blocks, 256, sh, stream>>>(d_in, d_filt, d_out, cfg.n, cfg.radius, cfg.norm);
}
} // namespace cu_convolution_1d_halo_shared