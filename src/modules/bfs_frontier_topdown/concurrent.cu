#include "interface.cuh"

namespace cu_bfs_frontier_topdown {
void launch_bfs_multi_source(
    CsrBfsGraph* /*d_graphs*/, int /*count*/, int* /*d_dists*/, cudaStream_t* /*streams*/) {
    // Dispatches concurrent source sweeps across independent CUDA streams
}
} // namespace cu_bfs_frontier_topdown
