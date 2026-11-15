#include "interface.cuh"

namespace cu_adamw_fused_optimizer {
int verify_second_moment_nonneg(const float* h_v, int n) {
    for (int i = 0; i < n; ++i) {
        if (h_v[i] < 0.0f) return -1;
    }
    return 0;
}
} // namespace cu_adamw_fused_optimizer
