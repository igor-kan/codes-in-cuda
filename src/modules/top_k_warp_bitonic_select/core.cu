#include "interface.cuh"
namespace cu_top_k_warp_bitonic_select {
__global__ void topk_warp_kernel(const float* __restrict__ in, float* __restrict__ out, int* __restrict__ idx, int rows, int cols, int k) {
    int row = blockIdx.x * blockDim.y + threadIdx.y;
    int lane = threadIdx.x;
    if (row >= rows || lane >= 32) return;
    float best_v = -1e30f;
    int best_i = -1;
    for (int c = lane; c < cols; c += 32) {
        float v = in[row * cols + c];
        if (v > best_v) { best_v = v; best_i = c; }
    }
    for (int size = 2; size <= 32; size <<= 1) {
        for (int stride = size >> 1; stride > 0; stride >>= 1) {
            float pv = __shfl_xor_sync(0xffffffffu, best_v, stride);
            int pi = __shfl_xor_sync(0xffffffffu, best_i, stride);
            bool asc = ((lane & size) != 0);
            bool swap = asc ? (best_v > pv) : (best_v < pv);
            if (swap) { best_v = pv; best_i = pi; }
        }
    }
    if (lane < k) { out[row * k + lane] = best_v; idx[row * k + lane] = best_i; }
}
void launch_warp_topk(const float* d_in, float* d_out, int* d_idx, TopKConfig cfg, cudaStream_t stream) {
    dim3 block(32, 4);
    dim3 grid((cfg.rows + 3) / 4);
    topk_warp_kernel<<<grid, block, 0, stream>>>(d_in, d_out, d_idx, cfg.rows, cfg.cols, cfg.k);
}
} // namespace cu_top_k_warp_bitonic_select