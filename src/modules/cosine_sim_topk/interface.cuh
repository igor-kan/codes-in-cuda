#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_cosine_sim_topk {
void launch_cosine_scores(
    const float* d_docs, const float* d_query, float* d_scores,
    int num_docs, int dim, cudaStream_t stream);
int validate_retrieval_cfg(RetrievalConfig cfg);
void select_topk_host_merge(const float* h_scores, int num_docs, int k, ScoreIdx* out_topk);
int verify_cosine_bounds(const float* h_scores, int n);
} // namespace cu_cosine_sim_topk
