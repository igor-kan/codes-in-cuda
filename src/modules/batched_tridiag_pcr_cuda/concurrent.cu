#include "interface.cuh"
namespace cu_batched_tridiag_pcr_cuda {
KernelStatus launch_pcr_streamed(const float* a, const float* b, const float* c, float* rhs, PcrBatch cfg, cudaStream_t s) {
    (void)s;
    launch_pcr_batch(a, b, c, rhs, cfg);
    return KernelStatus::Ok;
}
} // namespace cu_batched_tridiag_pcr_cuda