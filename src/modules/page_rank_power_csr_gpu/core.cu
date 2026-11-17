#include "interface.cuh"
namespace cu_page_rank_power_csr_gpu {
__global__ void pagerank_scatter_kernel(const int* __restrict__ rp, const int* __restrict__ ci, const int* __restrict__ out_deg,
                                          const float* __restrict__ pr_old, float* __restrict__ pr_new, int n) {
    int u = blockIdx.x * blockDim.x + threadIdx.x;
    if (u >= n || out_deg[u] == 0) return;
    float contrib = pr_old[u] / static_cast<float>(out_deg[u]);
    for (int e = rp[u]; e < rp[u + 1]; ++e) atomicAdd(&pr_new[ci[e]], contrib);
}
__global__ void pagerank_finalize_kernel(float* __restrict__ pr_new, int n, float damping, float dangling_sum) {
    int u = blockIdx.x * blockDim.x + threadIdx.x;
    if (u >= n) return;
    float base = (1.0f - damping) / static_cast<float>(n) + damping * dangling_sum / static_cast<float>(n);
    pr_new[u] = base + damping * pr_new[u];
}
void launch_pagerank_step(const int* rp, const int* ci, const int* out_deg, const float* pr_old, float* pr_new, PrCfg cfg) {
    int blk = (cfg.n + 255) / 256;
    pagerank_scatter_kernel<<<blk, 256>>>(rp, ci, out_deg, pr_old, pr_new, cfg.n);
    pagerank_finalize_kernel<<<blk, 256>>>(pr_new, cfg.n, cfg.damping, cfg.dangling_sum);
}
} // namespace cu_page_rank_power_csr_gpu