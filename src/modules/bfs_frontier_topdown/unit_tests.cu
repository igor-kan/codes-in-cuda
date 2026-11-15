#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_bfs_frontier_topdown;
    int rp[5] = {0, 2, 3, 4, 4};
    int ci[4] = {1, 2, 3, 3};
    int dist[4] = {0, 1, 1, 2};
    assert(validate_bfs_csr(4, 4, rp) == 0);
    assert(verify_bfs_tree_edges(4, rp, ci, dist, 0) == 0);
    return 0;
}
