#include "interface.cuh"
#include <algorithm>

namespace cu_morton_zorder_bvh {
static std::uint32_t h_exp10(std::uint32_t v) {
    v = (v * 0x00010001u) & 0xFF0000FFu;
    v = (v * 0x00000101u) & 0x0F00F00Fu;
    v = (v * 0x00000011u) & 0xC30C30C3u;
    v = (v * 0x00000005u) & 0x49249249u;
    return v;
}

std::uint32_t host_morton3d_encode(float x, float y, float z) {
    float cx = std::min(std::max(x * 1024.0f, 0.0f), 1023.0f);
    float cy = std::min(std::max(y * 1024.0f, 0.0f), 1023.0f);
    float cz = std::min(std::max(z * 1024.0f, 0.0f), 1023.0f);
    return (h_exp10(static_cast<std::uint32_t>(cx)) << 2)
         | (h_exp10(static_cast<std::uint32_t>(cy)) << 1)
         |  h_exp10(static_cast<std::uint32_t>(cz));
}
} // namespace cu_morton_zorder_bvh
