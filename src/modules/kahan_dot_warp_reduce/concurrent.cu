#include "interface.cuh"
namespace cu_kahan_dot_warp_reduce {
KernelStatus launch_dot_async(const float* a, const float* b, float* out, int n, cudaStream_t s) {
    cudaMemsetAsync(out, 0, sizeof(float), s);
    launch_kahan_dot(a, b, out, n, s);
    return KernelStatus::Ok;
}
} // namespace cu_kahan_dot_warp_reduce