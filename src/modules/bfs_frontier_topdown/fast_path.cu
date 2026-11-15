#include "interface.cuh"

namespace cu_bfs_frontier_topdown {
void launch_bfs_warp_expand(
    CsrBfsGraph d_graph, const int* d_frontier_in, int frontier_size,
    int* d_frontier_out, int* d_out_count, int* d_dist, int level, cudaStream_t stream) {
    launch_bfs_level(d_graph, d_frontier_in, frontier_size, d_frontier_out, d_out_count, d_dist, level, stream);
}
} // namespace cu_bfs_frontier_topdown
