#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_bfs_frontier_topdown {
void launch_bfs_level(
    CsrBfsGraph d_graph, const int* d_frontier_in, int frontier_size,
    int* d_frontier_out, int* d_out_count, int* d_dist, int level, cudaStream_t stream);
int validate_bfs_csr(int num_verts, int num_edges, const int* h_row_ptr);
void launch_bfs_warp_expand(
    CsrBfsGraph d_graph, const int* d_frontier_in, int frontier_size,
    int* d_frontier_out, int* d_out_count, int* d_dist, int level, cudaStream_t stream);
void launch_bfs_multi_source(
    CsrBfsGraph* d_graphs, int count, int* d_dists, cudaStream_t* streams);
int verify_bfs_tree_edges(int num_verts, const int* h_row_ptr, const int* h_col_idx, const int* h_dist, int src);
} // namespace cu_bfs_frontier_topdown
