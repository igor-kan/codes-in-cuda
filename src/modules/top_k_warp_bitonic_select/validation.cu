#include "interface.cuh"
namespace cu_top_k_warp_bitonic_select {
KernelStatus validate_topk(TopKConfig cfg) {
    return (cfg.rows > 0 && cfg.cols > 0 && cfg.k > 0 && cfg.k <= 32) ? KernelStatus::Ok : KernelStatus::InvalidDimension;
}
} // namespace cu_top_k_warp_bitonic_select