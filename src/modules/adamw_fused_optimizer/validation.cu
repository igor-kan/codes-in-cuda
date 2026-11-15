#include "interface.cuh"

namespace cu_adamw_fused_optimizer {
int validate_adamw_cfg(AdamWConfig cfg) {
    if (cfg.lr <= 0.0f || cfg.beta1 < 0.0f || cfg.beta1 >= 1.0f) return -1;
    if (cfg.beta2 < 0.0f || cfg.beta2 >= 1.0f || cfg.eps <= 0.0f) return -2;
    if (cfg.step < 1 || cfg.n_params <= 0) return -3;
    return 0;
}
} // namespace cu_adamw_fused_optimizer
