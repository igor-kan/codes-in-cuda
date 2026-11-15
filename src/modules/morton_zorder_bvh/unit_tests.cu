#include "interface.cuh"
#include <cassert>

int main() {
    using namespace cu_morton_zorder_bvh;
    assert(host_morton3d_encode(0.0f, 0.0f, 0.0f) == 0u);
    assert(host_morton3d_encode(0.9999f, 0.9999f, 0.9999f) == 0x3FFFFFFFu);
    std::uint32_t codes[3] = {0u, 15u, 64u};
    assert(verify_morton_sorted(codes, 3) == 0);
    return 0;
}
