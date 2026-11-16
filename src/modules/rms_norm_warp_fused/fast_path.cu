#include "interface.cuh"

__global__ void rms_norm_float4_kernel(const float* __restrict__ x, const float* __restrict__ gamma, float* __restrict__ y, int dim, float eps) {
    __shared__ float red[32];
    int row = blockIdx.x;
    int tid = threadIdx.x;
    int vec_dim = dim >> 2;
    const float4* x4 = reinterpret_cast<const float4*>(x + static_cast<size_t>(row) * dim);
    const float4* g4 = reinterpret_cast<const float4*>(gamma);
    float4* y4 = reinterpret_cast<float4*>(y + static_cast<size_t>(row) * dim);

    float sq = 0.0f;
    for (int i = tid; i < vec_dim; i += blockDim.x) {
        float4 v = x4[i];
        sq += v.x * v.x + v.y * v.y + v.z * v.z + v.w * v.w;
    }
    for (int off = 16; off > 0; off >>= 1) sq += __shfl_xor_sync(0xFFFFFFFFu, sq, off);
    if ((tid & 31) == 0) red[tid >> 5] = sq;
    __syncthreads();
    if (tid < 32) {
        float s = (tid < (blockDim.x >> 5)) ? red[tid] : 0.0f;
        for (int off = 16; off > 0; off >>= 1) s += __shfl_xor_sync(0xFFFFFFFFu, s, off);
        if (tid == 0) red[0] = rsqrtf(s / static_cast<float>(dim) + eps);
    }
    __syncthreads();
    float inv = red[0];
    for (int i = tid; i < vec_dim; i += blockDim.x) {
        float4 v = x4[i];
        float4 g = g4[i];
        y4[i] = make_float4(v.x * inv * g.x, v.y * inv * g.y, v.z * inv * g.z, v.w * inv * g.w);
    }
}

KernelStatus launch_rms_norm_vec4(const float* d_x, const float* d_gamma, float* d_y, const RmsNormConfig& cfg, cudaStream_t stream) {
    if ((cfg.hidden_dim & 3) != 0) return launch_rms_norm_baseline(d_x, d_gamma, d_y, cfg, stream);
    rms_norm_float4_kernel<<<cfg.rows, cfg.block_size, 0, stream>>>(d_x, d_gamma, d_y, cfg.hidden_dim, cfg.eps);
    return check_cuda(cudaGetLastError(), "rms_norm_float4_kernel");
}
