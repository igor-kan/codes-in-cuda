#include "interface.cuh"
namespace cu_batched_tridiag_pcr_cuda {
__device__ __forceinline__ float pcr_elim(float diag, float scale, float off) {
    float residual = diag - scale * off;
    return residual;
}
} // namespace cu_batched_tridiag_pcr_cuda