#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_cosine_sim_topk {
constexpr int WARP_SIZE = 32;
struct ScoreIdx {
    float score;
    int doc_id;
};

struct RetrievalConfig {
    int num_docs;
    int dim;
    int top_k;
};
} // namespace cu_cosine_sim_topk
