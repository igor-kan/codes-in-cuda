#include "interface.cuh"
#include <cmath>

KernelStatus validate_isoline_cfg(const IsolineConfig& cfg) {
    if (cfg.width < 2 || cfg.height < 2 || !std::isfinite(cfg.iso_level)) return KernelStatus::InvalidDimension;
    return KernelStatus::Ok;
}
