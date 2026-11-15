#include "interface.cuh"
#include <cmath>

namespace cu_flash_attention_tiled {
int validate_flash_cfg(FlashAttnConfig cfg) {
    if (cfg.seq_len <= 0 || cfg.head_dim <= 0 || cfg.head_dim > 64) return -1;
    if (!std::isfinite(cfg.scale) || cfg.scale <= 0.0f) return -2;
    return 0;
}
} // namespace cu_flash_attention_tiled
