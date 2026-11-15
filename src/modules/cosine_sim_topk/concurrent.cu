#include "interface.cuh"

namespace cu_cosine_sim_topk {
void launch_cosine_multi_query(
    const float* d_docs, const float** d_queries, float** d_scores,
    int num_queries, int num_docs, int dim, cudaStream_t* streams) {
    for (int i = 0; i < num_queries; ++i) {
        launch_cosine_scores(d_docs, d_queries[i], d_scores[i], num_docs, dim, streams ? streams[i] : 0);
    }
}
} // namespace cu_cosine_sim_topk
