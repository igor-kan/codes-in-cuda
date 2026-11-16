#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    RmsNormConfig cfg{8, 256, 1e-5f, 128};
    std::vector<float> hx(8 * 256), hg(256, 1.0f), hy(8 * 256);
    for (size_t i = 0; i < hx.size(); ++i) hx[i] = static_cast<float>((i % 31) - 15) * 0.125f;
    float *dx = nullptr, *dg = nullptr, *dy = nullptr;
    cudaMalloc(&dx, hx.size() * sizeof(float));
    cudaMalloc(&dg, hg.size() * sizeof(float));
    cudaMalloc(&dy, hy.size() * sizeof(float));
    cudaMemcpy(dx, hx.data(), hx.size() * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(dg, hg.data(), hg.size() * sizeof(float), cudaMemcpyHostToDevice);
    assert(launch_rms_norm_baseline(dx, dg, dy, cfg, 0) == KernelStatus::Ok);
    cudaMemcpy(hy.data(), dy, hy.size() * sizeof(float), cudaMemcpyDeviceToHost);
    assert(verify_rms_cpu_parity(hx.data(), hg.data(), hy.data(), cfg, 1e-4f) == KernelStatus::Ok);
    cudaFree(dx); cudaFree(dg); cudaFree(dy);
    return 0;
}
