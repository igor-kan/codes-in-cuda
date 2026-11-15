#include "interface.cuh"
#include <cmath>

namespace cu_softmax_online_safe {
float verify_softmax_simplex_sum(const float* h_row, int cols) {
    float s = 0.0f;
    for (int i = 0; i < cols; ++i) {
        if (h_row[i] < 0.0f || h_row[i] > 1.0f) return 1.0f;
        s += h_row[i];
    }
    return std::fabs(s - 1.0f);
}
} // namespace cu_softmax_online_safe
