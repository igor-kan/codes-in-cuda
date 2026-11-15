#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_bfs_frontier_topdown;
    int rp[3] = {1, 2, 2};
    assert(validate_bfs_csr(2, 2, rp) == -2);
    return 0;
}
