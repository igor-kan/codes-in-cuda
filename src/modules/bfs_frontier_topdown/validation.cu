#include "interface.cuh"

namespace cu_bfs_frontier_topdown {
int validate_bfs_csr(int num_verts, int num_edges, const int* h_row_ptr) {
    if (num_verts <= 0 || num_edges < 0 || !h_row_ptr) return -1;
    if (h_row_ptr[0] != 0 || h_row_ptr[num_verts] != num_edges) return -2;
    return 0;
}
} // namespace cu_bfs_frontier_topdown
