#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_rope_rotary_embedding {
constexpr int WARP_SIZE = 32;
struct RopeConfig {
    int seq_len;
    int num_heads;
    int head_dim;
    float base_theta;
    int pos_offset;
};
} // namespace cu_rope_rotary_embedding
