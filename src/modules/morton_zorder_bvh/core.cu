#include "interface.cuh"

namespace cu_morton_zorder_bvh {
__host__ __device__ __forceinline__ std::uint32_t expand_bits10(std::uint32_t v) {
    v = (v * 0x00010001u) & 0xFF0000FFu;
    v = (v * 0x00000101u) & 0x0F00F00Fu;
    v = (v * 0x00000011u) & 0xC30C30C3u;
    v = (v * 0x00000005u) & 0x49249249u;
    return v;
}

__global__ void morton3d_kernel(
    const float* __restrict__ cx,
    const float* __restrict__ cy,
    const float* __restrict__ cz,
    std::uint32_t* __restrict__ codes, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= n) return;
    float x = fminf(fmaxf(cx[i] * 1024.0f, 0.0f), 1023.0f);
    float y = fminf(fmaxf(cy[i] * 1024.0f, 0.0f), 1023.0f);
    float z = fminf(fmaxf(cz[i] * 1024.0f, 0.0f), 1023.0f);
    codes[i] = (expand_bits10(static_cast<std::uint32_t>(x)) << 2)
             | (expand_bits10(static_cast<std::uint32_t>(y)) << 1)
             |  expand_bits10(static_cast<std::uint32_t>(z));
}

__device__ __forceinline__ int common_prefix(const std::uint32_t* codes, int n, int i, int j) {
    if (j < 0 || j >= n) return -1;
    std::uint32_t a = codes[i], b = codes[j];
    if (a != b) return __clz(a ^ b);
    return 32 + __clz(static_cast<std::uint32_t>(i ^ j));
}

__global__ void karras_split_kernel(const std::uint32_t* __restrict__ codes, BvhNodeSplit* nodes, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= n - 1) return;
    int dl = common_prefix(codes, n, i, i - 1);
    int dr = common_prefix(codes, n, i, i + 1);
    int d = (dr > dl) ? 1 : -1;
    int delta_min = common_prefix(codes, n, i, i - d);
    int lmax = 2;
    while (common_prefix(codes, n, i, i + lmax * d) > delta_min) lmax <<= 1;
    int l = 0;
    for (int t = lmax >> 1; t >= 1; t >>= 1) {
        if (common_prefix(codes, n, i, i + (l + t) * d) > delta_min) l += t;
    }
    int j = i + l * d;
    int delta_node = common_prefix(codes, n, i, j);
    int s = 0;
    int div = 2;
    while (true) {
        int step = (l + div - 1) / div;
        if (common_prefix(codes, n, i, i + (s + step) * d) > delta_node) s += step;
        if (step <= 1) break;
        div <<= 1;
    }
    int split = i + s * d + (d < 0 ? -1 : 0);
    int lo = (i < j) ? i : j;
    int hi = (i < j) ? j : i;
    nodes[i].left = split;
    nodes[i].right = split + 1;
    nodes[i].is_leaf_left = (lo == split) ? 1 : 0;
    nodes[i].is_leaf_right = (hi == split + 1) ? 1 : 0;
}

void launch_morton3d_encode(
    const float* d_cx, const float* d_cy, const float* d_cz,
    std::uint32_t* d_codes, int n, cudaStream_t stream) {
    int blocks = (n + 255) / 256;
    morton3d_kernel<<<blocks, 256, 0, stream>>>(d_cx, d_cy, d_cz, d_codes, n);
}

void launch_karras_radix_splits(
    const std::uint32_t* d_sorted_codes, BvhNodeSplit* d_internal_nodes,
    int num_leaves, cudaStream_t stream) {
    if (num_leaves < 2) return;
    int blocks = (num_leaves - 1 + 255) / 256;
    karras_split_kernel<<<blocks, 256, 0, stream>>>(d_sorted_codes, d_internal_nodes, num_leaves);
}
} // namespace cu_morton_zorder_bvh
