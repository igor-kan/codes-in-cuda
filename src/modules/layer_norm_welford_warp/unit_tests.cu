#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    using namespace cu_layer_norm_welford_warp;
    LayerNormParams p{4, 512, 1e-5f};
    assert(validate_layernorm_params(p) == 0);
    std::vector<float> hx(4 * 512);
    for (int i = 0; i < 4 * 512; ++i) hx[i] = static_cast<float>((i % 37) - 18) * 0.25f;
    float *dx, *dy;
    cudaMalloc(&dx, hx.size() * sizeof(float));
    cudaMalloc(&dy, hx.size() * sizeof(float));
    cudaMemcpy(dx, hx.data(), hx.size() * sizeof(float), cudaMemcpyHostToDevice);
    launch_welford_layernorm(dx, nullptr, nullptr, dy, p, 0);
    cudaMemcpy(hx.data(), dy, hx.size() * sizeof(float), cudaMemcpyDeviceToHost);
    assert(verify_layernorm_row_moments(hx.data(), 512, 1e-5f) < 1e-3f);
    cudaFree(dx); cudaFree(dy);
    return 0;
}
