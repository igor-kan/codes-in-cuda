#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_flash_attention_tiled {
constexpr int WARP_SIZE = 32;
struct FlashAttnConfig {
    int seq_len;
    int head_dim;
    float scale;
    int causal_mask;
};

struct FlashAttnStats {
    float max_abs_err;
    float checksum;
};
} // namespace cu_flash_attention_tiled
