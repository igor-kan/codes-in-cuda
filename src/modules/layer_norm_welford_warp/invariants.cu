#include "interface.cuh"
#include <cmath>

namespace cu_layer_norm_welford_warp {
float verify_layernorm_row_moments(const float* h_row, int cols, float eps) {
    double s = 0.0;
    for (int i = 0; i < cols; ++i) s += h_row[i];
    double mean = s / cols;
    double v = 0.0;
    for (int i = 0; i < cols; ++i) { double d = h_row[i] - mean; v += d * d; }
    return static_cast<float>(std::fabs(mean) + std::fabs(v / cols - (1.0 - eps)));
}
} // namespace cu_layer_norm_welford_warp
