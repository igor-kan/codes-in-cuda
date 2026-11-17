#include "interface.cuh"
namespace cu_convolution_1d_halo_shared {
KernelStatus validate_conv1d(Conv1DCfg cfg) {
    return (cfg.n > 0 && cfg.radius >= 0 && cfg.radius <= 16) ? KernelStatus::Ok : KernelStatus::InvalidDimension;
}
} // namespace cu_convolution_1d_halo_shared