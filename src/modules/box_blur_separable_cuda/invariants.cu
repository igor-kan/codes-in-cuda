#include "interface.cuh"
#include <cassert>
#include <cmath>
namespace cu_box_blur_separable_cuda {
void verify_constant_field(const float* out, int n, float expected) {
    for (int i = 0; i < n; ++i) assert(std::fabs(out[i] - expected) < 1e-4f);
}
} // namespace cu_box_blur_separable_cuda