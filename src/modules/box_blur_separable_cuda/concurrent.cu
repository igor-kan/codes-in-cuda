#include "interface.cuh"
namespace cu_box_blur_separable_cuda {
KernelStatus launch_blur_streamed(const float* in, float* tmp, float* out, BlurCfg cfg, cudaStream_t s) {
    launch_separable_blur(in, tmp, out, cfg, s);
    return KernelStatus::Ok;
}
} // namespace cu_box_blur_separable_cuda