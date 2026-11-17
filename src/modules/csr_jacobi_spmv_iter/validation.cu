#include "interface.cuh"
namespace cu_csr_jacobi_spmv_iter {
KernelStatus validate_jacobi(JacobiCfg cfg) {
    return (cfg.rows > 0 && cfg.omega > 0.0f && cfg.omega <= 1.5f) ? KernelStatus::Ok : KernelStatus::InvalidDimension;
}
} // namespace cu_csr_jacobi_spmv_iter