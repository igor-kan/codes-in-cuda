#include "interface.cuh"

KernelStatus validate_eigen3x3_cfg(const BatchEigenConfig& cfg) {
    if (cfg.count <= 0 || cfg.max_sweeps <= 0 || cfg.tol <= 0.0f) return KernelStatus::InvalidDimension;
    return KernelStatus::Ok;
}
