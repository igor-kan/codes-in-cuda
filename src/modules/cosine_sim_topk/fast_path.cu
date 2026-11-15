#include "interface.cuh"
#include <algorithm>
#include <vector>

namespace cu_cosine_sim_topk {
void select_topk_host_merge(const float* h_scores, int num_docs, int k, ScoreIdx* out_topk) {
    std::vector<ScoreIdx> items(num_docs);
    for (int i = 0; i < num_docs; ++i) items[i] = {h_scores[i], i};
    std::partial_sort(items.begin(), items.begin() + k, items.end(), [](const ScoreIdx& a, const ScoreIdx& b) {
        return a.score > b.score;
    });
    for (int i = 0; i < k; ++i) out_topk[i] = items[i];
}
} // namespace cu_cosine_sim_topk
