#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_cosine_sim_topk;
    assert(validate_retrieval_cfg({10, 128, 12}) != 0);
    assert(validate_retrieval_cfg({1024, 384, 10}) == 0);
    return 0;
}
