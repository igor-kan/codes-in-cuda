#include "interface.cuh"

KernelStatus validate_rms_cfg(const RmsNormConfig& cfg) {
    if (cfg.rows <= 0 || cfg.hidden_dim <= 0 || cfg.eps <= 0.0f) return KernelStatus::InvalidDimension;
    if (cfg.block_size <= 0 || cfg.block_size > 1024 || (cfg.block_size & 31) != 0) return KernelStatus::InvalidGrid;
    return KernelStatus::Ok;
}
