#include "interface.cuh"
namespace cu_page_rank_power_csr_gpu {
KernelStatus async_pagerank(const int* rp, const int* ci, const int* deg, const float* old_v, float* new_v, PrCfg cfg, cudaStream_t s) {
    cudaMemsetAsync(new_v, 0, static_cast<std::size_t>(cfg.n) * sizeof(float), s);
    launch_pagerank_step(rp, ci, deg, old_v, new_v, cfg);
    return KernelStatus::Ok;
}
} // namespace cu_page_rank_power_csr_gpu