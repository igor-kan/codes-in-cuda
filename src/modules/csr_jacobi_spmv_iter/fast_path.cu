#include "interface.cuh"
namespace cu_csr_jacobi_spmv_iter {
__device__ __forceinline__ float damped_blend(float old_v, float target, float w) {
    return fmaf(w, target - old_v, old_v);
}
} // namespace cu_csr_jacobi_spmv_iter