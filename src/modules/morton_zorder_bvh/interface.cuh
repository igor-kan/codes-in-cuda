#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_morton_zorder_bvh {
void launch_morton3d_encode(
    const float* d_cx, const float* d_cy, const float* d_cz,
    std::uint32_t* d_codes, int n, cudaStream_t stream);
void launch_karras_radix_splits(
    const std::uint32_t* d_sorted_codes, BvhNodeSplit* d_internal_nodes,
    int num_leaves, cudaStream_t stream);
int validate_morton_bounds(int num_leaves);
std::uint32_t host_morton3d_encode(float x, float y, float z);
int verify_morton_sorted(const std::uint32_t* h_codes, int n);
} // namespace cu_morton_zorder_bvh
