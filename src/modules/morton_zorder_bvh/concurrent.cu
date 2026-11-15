#include "interface.cuh"

namespace cu_morton_zorder_bvh {
// Async radix sorting & split dispatch via CUDA streams
void dispatch_morton_pipeline(
    const float* d_x, const float* d_y, const float* d_z,
    std::uint32_t* d_codes, BvhNodeSplit* d_nodes, int n, cudaStream_t stream) {
    launch_morton3d_encode(d_x, d_y, d_z, d_codes, n, stream);
    launch_karras_radix_splits(d_codes, d_nodes, n, stream);
}
} // namespace cu_morton_zorder_bvh
