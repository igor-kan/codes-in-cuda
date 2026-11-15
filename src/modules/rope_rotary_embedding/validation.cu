#include "interface.cuh"

namespace cu_rope_rotary_embedding {
int validate_rope_config(RopeConfig cfg) {
    if (cfg.seq_len <= 0 || cfg.num_heads <= 0 || cfg.head_dim <= 0) return -1;
    if ((cfg.head_dim & 1) != 0) return -2;
    if (cfg.base_theta <= 1.0f) return -3;
    return 0;
}
} // namespace cu_rope_rotary_embedding
