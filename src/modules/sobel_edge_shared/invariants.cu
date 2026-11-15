#include "interface.cuh"
#include <cmath>

namespace cu_sobel_edge_shared {
float verify_uniform_image_zero_edge(const float* h_out, ImageSpec spec) {
    float mx = 0.0f;
    for (int i = 0; i < spec.width * spec.height; ++i) mx = fmaxf(mx, std::fabs(h_out[i]));
    return mx;
}
} // namespace cu_sobel_edge_shared
