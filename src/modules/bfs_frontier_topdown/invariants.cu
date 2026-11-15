#include "interface.cuh"

namespace cu_bfs_frontier_topdown {
int verify_bfs_tree_edges(int num_verts, const int* h_row_ptr, const int* h_col_idx, const int* h_dist, int src) {
    if (h_dist[src] != 0) return -1;
    for (int u = 0; u < num_verts; ++u) {
        if (h_dist[u] < 0) continue;
        for (int e = h_row_ptr[u]; e < h_row_ptr[u + 1]; ++e) {
            int v = h_col_idx[e];
            if (h_dist[v] < 0 || h_dist[v] > h_dist[u] + 1) return -2;
        }
    }
    return 0;
}
} // namespace cu_bfs_frontier_topdown
