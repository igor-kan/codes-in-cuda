#include "interface.cuh"
namespace cu_page_rank_power_csr_gpu {
KernelStatus validate_pr(PrCfg cfg) {
    return (cfg.n > 0 && cfg.damping > 0.0f && cfg.damping < 1.0f) ? KernelStatus::Ok : KernelStatus::InvalidDimension;
}
} // namespace cu_page_rank_power_csr_gpu