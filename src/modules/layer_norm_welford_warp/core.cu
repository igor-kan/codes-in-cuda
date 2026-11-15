#include "interface.cuh"
#include <cmath>

namespace cu_layer_norm_welford_warp {
__device__ __forceinline__ WelfordState welford_combine(WelfordState a, WelfordState b) {
    if (b.count == 0.0f) return a;
    if (a.count == 0.0f) return b;
    float total = a.count + b.count;
    float delta = b.mean - a.mean;
    float mean = a.mean + delta * (b.count / total);
    float m2 = a.m2 + b.m2 + delta * delta * (a.count * b.count / total);
    return {total, mean, m2};
}

__device__ __forceinline__ WelfordState warp_reduce_welford(WelfordState st) {
    for (int offset = 16; offset > 0; offset >>= 1) {
        WelfordState other;
        other.count = __shfl_down_sync(0xffffffffu, st.count, offset);
        other.mean  = __shfl_down_sync(0xffffffffu, st.mean, offset);
        other.m2    = __shfl_down_sync(0xffffffffu, st.m2, offset);
        st = welford_combine(st, other);
    }
    return st;
}

__global__ void layernorm_welford_kernel(
    const float* __restrict__ X,
    const float* __restrict__ gamma,
    const float* __restrict__ beta,
    float* __restrict__ Y,
    int cols, float eps) {
    int row = blockIdx.x;
    const float* rx = X + row * cols;
    float* ry = Y + row * cols;

    WelfordState local{0.0f, 0.0f, 0.0f};
    for (int c = threadIdx.x; c < cols; c += blockDim.x) {
        float v = rx[c];
        local.count += 1.0f;
        float delta = v - local.mean;
        local.mean += delta / local.count;
        local.m2 += delta * (v - local.mean);
    }

    local = warp_reduce_welford(local);
    __shared__ WelfordState s_warp[32];
    int lane = threadIdx.x & 31;
    int wid  = threadIdx.x >> 5;
    if (lane == 0) s_warp[wid] = local;
    __syncthreads();

    if (wid == 0) {
        int nwarps = (blockDim.x + 31) >> 5;
        WelfordState b_st = (lane < nwarps) ? s_warp[lane] : WelfordState{0.0f, 0.0f, 0.0f};
        b_st = warp_reduce_welford(b_st);
        if (lane == 0) s_warp[0] = b_st;
    }
    __syncthreads();

    float mean = s_warp[0].mean;
    float inv_std = rsqrtf(s_warp[0].m2 / static_cast<float>(cols) + eps);
    for (int c = threadIdx.x; c < cols; c += blockDim.x) {
        float g = gamma ? gamma[c] : 1.0f;
        float b = beta ? beta[c] : 0.0f;
        ry[c] = (rx[c] - mean) * inv_std * g + b;
    }
}

void launch_welford_layernorm(
    const float* d_x, const float* d_gamma, const float* d_beta, float* d_y,
    LayerNormParams params, cudaStream_t stream) {
    int threads = 256;
    if (params.cols < 256) threads = 64;
    layernorm_welford_kernel<<<params.rows, threads, 0, stream>>>(
        d_x, d_gamma, d_beta, d_y, params.cols, params.eps);
}
} // namespace cu_layer_norm_welford_warp
