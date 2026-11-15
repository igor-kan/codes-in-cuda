#include "interface.cuh"
#include <cmath>

namespace cu_rope_rotary_embedding {
float verify_rope_norm_preservation(const float* h_before, const float* h_after, int total_pairs) {
    float max_diff = 0.0f;
    for (int i = 0; i < total_pairs; ++i) {
        float n0 = h_before[2*i]*h_before[2*i] + h_before[2*i+1]*h_before[2*i+1];
        float n1 = h_after[2*i]*h_after[2*i]   + h_after[2*i+1]*h_after[2*i+1];
        float d = std::fabs(n0 - n1);
        if (d > max_diff) max_diff = d;
    }
    return max_diff;
}
} // namespace cu_rope_rotary_embedding
