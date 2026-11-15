#include "interface.cuh"

namespace cu_morton_zorder_bvh {
int validate_morton_bounds(int num_leaves) {
    return (num_leaves >= 2) ? 0 : -1;
}
} // namespace cu_morton_zorder_bvh
