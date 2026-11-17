#include "interface.cuh"
namespace cu_convolution_1d_halo_shared {
KernelStatus async_conv1d(const float* in, const float* filt, float* out, Conv1DCfg cfg, cudaStream_t s) {
    launch_conv1d_halo(in, filt, out, cfg, s);
    return KernelStatus::Ok;
}
} // namespace cu_convolution_1d_halo_shared