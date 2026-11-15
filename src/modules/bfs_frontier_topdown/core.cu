#include "interface.cuh"

namespace cu_bfs_frontier_topdown {
__global__ void bfs_expand_kernel(
    const int* __restrict__ row_ptr,
    const int* __restrict__ col_idx,
    const int* __restrict__ frontier_in,
    int frontier_size,
    int* __restrict__ frontier_out,
    int* __restrict__ out_count,
    int* __restrict__ dist,
    int next_dist) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid >= frontier_size) return;
    int u = frontier_in[tid];
    int start = row_ptr[u];
    int end   = row_ptr[u + 1];
    for (int e = start; e < end; ++e) {
        int v = col_idx[e];
        if (atomicCAS(&dist[v], -1, next_dist) == -1) {
            int pos = atomicAdd(out_count, 1);
            frontier_out[pos] = v;
        }
    }
}

void launch_bfs_level(
    CsrBfsGraph d_graph, const int* d_frontier_in, int frontier_size,
    int* d_frontier_out, int* d_out_count, int* d_dist, int level, cudaStream_t stream) {
    if (frontier_size <= 0) return;
    int threads = 256;
    int blocks = (frontier_size + threads - 1) / threads;
    bfs_expand_kernel<<<blocks, threads, 0, stream>>>(
        d_graph.row_ptr, d_graph.col_idx, d_frontier_in, frontier_size,
        d_frontier_out, d_out_count, d_dist, level + 1);
}
} // namespace cu_bfs_frontier_topdown
