#include "interface.cuh"

namespace cu_cosine_sim_topk {
int validate_retrieval_cfg(RetrievalConfig cfg) {
    if (cfg.num_docs <= 0 || cfg.dim <= 0 || cfg.top_k <= 0 || cfg.top_k > cfg.num_docs) return -1;
    return 0;
}
} // namespace cu_cosine_sim_topk
