#include "interface.cuh"
namespace cu_box_blur_separable_cuda {
KernelStatus validate_blur(BlurCfg cfg) {
    return (cfg.w > 0 && cfg.h > 0 && cfg.radius >= 1) ? KernelStatus::Ok : KernelStatus::InvalidDimension;
}
} // namespace cu_box_blur_separable_cuda