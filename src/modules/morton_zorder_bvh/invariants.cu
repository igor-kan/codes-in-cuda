#include "interface.cuh"

namespace cu_morton_zorder_bvh {
int verify_morton_sorted(const std::uint32_t* h_codes, int n) {
    for (int i = 1; i < n; ++i) {
        if (h_codes[i] < h_codes[i - 1]) return -1;
    }
    return 0;
}
} // namespace cu_morton_zorder_bvh
