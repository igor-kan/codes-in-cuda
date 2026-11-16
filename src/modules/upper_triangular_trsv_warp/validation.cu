#include "interface.cuh"
#include <cmath>

KernelStatus validate_trsv32(const Trsv32Config& cfg) {
    if (cfg.batch_count <= 0 || !std::isfinite(cfg.diag_shift)) return KernelStatus::InvalidDimension;
    return KernelStatus::Ok;
}
