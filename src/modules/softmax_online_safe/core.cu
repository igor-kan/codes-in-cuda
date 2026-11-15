#include "interface.cuh"
#include <cfloat>
#include <cmath>

namespace cu_softmax_online_safe {
__device__ __forceinline__ OnlineMD combine_md(OnlineMD a, OnlineMD b) {
    if (b.m > a.m) {
        return {b.m, a.d * expf(a.m - b.m) + b.d};
    }
    return {a.m, a.d + b.d * expf(b.m - a.m)};
}

__device__ __forceinline__ OnlineMD warp_reduce_md(OnlineMD v) {
    for (int off = 16; off > 0; off >>= 1) {
        OnlineMD o;
        o.m = __shfl_down_sync(0xffffffffu, v.m, off);
        o.d = __shfl_down_sync(0xffffffffu, v.d, off);
        v = combine_md(v, o);
    }
    return v;
}

__global__ void online_softmax_kernel(const float* __restrict__ X, float* __restrict__ Y, int cols) {
    int row = blockIdx.x;
    const float* rx = X + row * cols;
    float* ry = Y + row * cols;

    OnlineMD local{-FLT_MAX, 0.0f};
    for (int c = threadIdx.x; c < cols; c += blockDim.x) {
        float x = rx[c];
        float m_new = fmaxf(local.m, x);
        local.d = local.d * expf(local.m - m_new) + expf(x - m_new);
        local.m = m_new;
    }

    local = warp_reduce_md(local);
    __shared__ OnlineMD s_md[32];
    int lane = threadIdx.x & 31;
    int wid  = threadIdx.x >> 5;
    if (lane == 0) s_md[wid] = local;
    __syncthreads();

    if (wid == 0) {
        int nwarps = (blockDim.x + 31) >> 5;
        OnlineMD acc = (lane < nwarps) ? s_md[lane] : OnlineMD{-FLT_MAX, 0.0f};
        acc = warp_reduce_md(acc);
        if (lane == 0) s_md[0] = acc;
    }
    __syncthreads();

    float gmax = s_md[0].m;
    float inv_sum = 1.0f / s_md[0].d;
    for (int c = threadIdx.x; c < cols; c += blockDim.x) {
        ry[c] = expf(rx[c] - gmax) * inv_sum;
    }
}

void launch_online_softmax(const float* d_in, float* d_out, SoftmaxConfig cfg, cudaStream_t stream) {
    online_softmax_kernel<<<cfg.rows, 256, 0, stream>>>(d_in, d_out, cfg.cols);
}
} // namespace cu_softmax_online_safe
