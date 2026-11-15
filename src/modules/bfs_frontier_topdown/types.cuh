#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_bfs_frontier_topdown {
constexpr int WARP_SIZE = 32;
struct CsrBfsGraph {
    int num_verts;
    const int* row_ptr;
    const int* col_idx;
};
} // namespace cu_bfs_frontier_topdown
