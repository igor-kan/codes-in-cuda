#include "interface.cuh"

KernelStatus validate_bilateral(const BilateralConfig& cfg) {
    if (cfg.width <= 0 || cfg.height <= 0 || cfg.radius < 1 || cfg.radius > 4) return KernelStatus::InvalidDimension;
    if (cfg.inv_two_sigma_s2 <= 0.0f || cfg.inv_two_sigma_r2 <= 0.0f) return KernelStatus::InvalidDimension;
    return KernelStatus::Ok;
}
