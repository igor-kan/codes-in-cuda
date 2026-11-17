#include "interface.cuh"
#include <cassert>
#include <cmath>
namespace cu_convolution_1d_halo_shared {
void verify_conv1d_host(const float* in, const float* filt, const float* out, int n, int r) {
    for (int i = 0; i < n; ++i) {
        float acc = 0.0f;
        for (int k = -r; k <= r; ++k) if (i + k >= 0 && i + k < n) acc += in[i + k] * filt[k + r];
        assert(std::fabs(acc - out[i]) < 1e-4f);
    }
}
} // namespace cu_convolution_1d_halo_shared