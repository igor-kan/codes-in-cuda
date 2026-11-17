#include "interface.cuh"
namespace cu_top_k_warp_bitonic_select {
KernelStatus launch_dual_stream(const float* in, float* out, int* idx, TopKConfig cfg, cudaStream_t s1, cudaStream_t s2) {
    int half = cfg.rows / 2;
    launch_warp_topk(in, out, idx, {half, cfg.cols, cfg.k}, s1);
    launch_warp_topk(in + half * cfg.cols, out + half * cfg.k, idx + half * cfg.k, {cfg.rows - half, cfg.cols, cfg.k}, s2);
    return KernelStatus::Ok;
}
} // namespace cu_top_k_warp_bitonic_select