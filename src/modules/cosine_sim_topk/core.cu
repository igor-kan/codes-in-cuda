#include "interface.cuh"
#include <cmath>

namespace cu_cosine_sim_topk {
__device__ __forceinline__ float warp_sum(float v) {
    for (int off = 16; off > 0; off >>= 1) v += __shfl_down_sync(0xffffffffu, v, off);
    return v;
}

__global__ void cosine_sim_kernel(
    const float* __restrict__ docs,
    const float* __restrict__ query,
    float* __restrict__ scores,
    int num_docs, int dim) {
    int doc = blockIdx.x;
    if (doc >= num_docs) return;
    const float* dvec = docs + doc * dim;
    float dot = 0.0f, nd = 0.0f, nq = 0.0f;
    for (int c = threadIdx.x; c < dim; c += blockDim.x) {
        float dv = dvec[c];
        float qv = query[c];
        dot += dv * qv;
        nd  += dv * dv;
        nq  += qv * qv;
    }
    dot = warp_sum(dot);
    nd  = warp_sum(nd);
    nq  = warp_sum(nq);

    __shared__ float s_buf[3 * 32];
    int lane = threadIdx.x & 31;
    int wid  = threadIdx.x >> 5;
    if (lane == 0) { s_buf[wid] = dot; s_buf[32 + wid] = nd; s_buf[64 + wid] = nq; }
    __syncthreads();

    if (wid == 0) {
        int nw = (blockDim.x + 31) >> 5;
        float a_dot = (lane < nw) ? s_buf[lane] : 0.0f;
        float a_nd  = (lane < nw) ? s_buf[32 + lane] : 0.0f;
        float a_nq  = (lane < nw) ? s_buf[64 + lane] : 0.0f;
        a_dot = warp_sum(a_dot);
        a_nd  = warp_sum(a_nd);
        a_nq  = warp_sum(a_nq);
        if (lane == 0) {
            float denom = sqrtf(a_nd * a_nq);
            scores[doc] = (denom > 1e-12f) ? (a_dot / denom) : 0.0f;
        }
    }
}

void launch_cosine_scores(
    const float* d_docs, const float* d_query, float* d_scores,
    int num_docs, int dim, cudaStream_t stream) {
    cosine_sim_kernel<<<num_docs, 128, 0, stream>>>(d_docs, d_query, d_scores, num_docs, dim);
}
} // namespace cu_cosine_sim_topk
