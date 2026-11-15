#include "interface.cuh"
#include <cassert>
#include <cmath>

int main() {
    using namespace cu_cosine_sim_topk;
    float scores[4] = {0.2f, 0.95f, -0.5f, 0.7f};
    assert(verify_cosine_bounds(scores, 4) == 0);
    ScoreIdx top[2];
    select_topk_host_merge(scores, 4, 2, top);
    assert(top[0].doc_id == 1 && top[1].doc_id == 3);
    return 0;
}
