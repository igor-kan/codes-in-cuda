#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    BilateralConfig cfg{64, 64, 2, 0.1f, 0.5f};
    std::vector<float> hin(64 * 64), hout(64 * 64);
    for (int y = 0; y < 64; ++y)
        for (int x = 0; x < 64; ++x) hin[y * 64 + x] = (x < 32) ? 0.1f : 1.0f;
    float *din = nullptr, *dout = nullptr;
    cudaMalloc(&din, hin.size() * 4); cudaMalloc(&dout, hout.size() * 4);
    cudaMemcpy(din, hin.data(), hin.size() * 4, cudaMemcpyHostToDevice);
    assert(launch_bilateral_shared(din, dout, cfg, 0) == KernelStatus::Ok);
    cudaMemcpy(hout.data(), dout, hout.size() * 4, cudaMemcpyDeviceToHost);
    assert(verify_bilateral_parity(hin.data(), hout.data(), cfg, 1e-4f) == KernelStatus::Ok);
    cudaFree(din); cudaFree(dout);
    return 0;
}
