#include "interface.cuh"
namespace cu_csr_jacobi_spmv_iter {
KernelStatus run_jacobi_iters(const int* rp, const int* ci, const float* val, const float* b, float* x0, float* x1, JacobiCfg cfg, int iters) {
    for (int i = 0; i < iters; ++i) {
        if ((i & 1) == 0) launch_csr_jacobi_step(rp, ci, val, b, x0, x1, cfg);
        else launch_csr_jacobi_step(rp, ci, val, b, x1, x0, cfg);
    }
    return KernelStatus::Ok;
}
} // namespace cu_csr_jacobi_spmv_iter