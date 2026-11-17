#include "interface.cuh"
namespace cu_batched_tridiag_pcr_cuda {
KernelStatus validate_pcr(PcrBatch cfg) {
    bool pow2 = cfg.sys_size > 0 && (cfg.sys_size & (cfg.sys_size - 1)) == 0;
    return (pow2 && cfg.sys_size <= 512 && cfg.batch_count > 0) ? KernelStatus::Ok : KernelStatus::InvalidGrid;
}
} // namespace cu_batched_tridiag_pcr_cuda