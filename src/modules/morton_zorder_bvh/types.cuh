#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_morton_zorder_bvh {
constexpr int WARP_SIZE = 32;
struct BvhNodeSplit {
    int left;
    int right;
    int is_leaf_left;
    int is_leaf_right;
};
} // namespace cu_morton_zorder_bvh
