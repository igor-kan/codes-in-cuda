#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    RmsNormConfig cfg{4, 128, 1e-6f, 128};
    assert(validate_rms_cfg(cfg) == KernelStatus::Ok);
    std::vector<float> hx(4 * 128, 2.0f), hg(128, 1.5f), hy(4 * 128, 0.0f);
    float *dx = nullptr, *dg = nullptr, *dy = nullptr;
    cudaMalloc(&dx, hx.size() * sizeof(float));
    cudaMalloc(&dg, hg.size() * sizeof(float));
    cudaMalloc(&dy, hy.size() * sizeof(float));
    cudaMemcpy(dx, hx.data(), hx.size() * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(dg, hg.data(), hg.size() * sizeof(float), cudaMemcpyHostToDevice);
    assert(launch_rms_norm_vec4(dx, dg, dy, cfg, 0) == KernelStatus::Ok);
    cudaDeviceSynchronize();
    cudaMemcpy(hy.data(), dy, hy.size() * sizeof(float), cudaMemcpyDeviceToHost);
    assert(verify_rms_cpu_parity(hx.data(), hg.data(), hy.data(), cfg, 1e-4f) == KernelStatus::Ok);
    cudaFree(dx); cudaFree(dg); cudaFree(dy);
    return 0;
}
