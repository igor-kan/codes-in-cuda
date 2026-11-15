#include "interface.cuh"

namespace cu_cosine_sim_topk {
int verify_cosine_bounds(const float* h_scores, int n) {
    for (int i = 0; i < n; ++i) {
        if (h_scores[i] < -1.0001f || h_scores[i] > 1.0001f) return -1;
    }
    return 0;
}
} // namespace cu_cosine_sim_topk
