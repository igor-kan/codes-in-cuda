#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    BilateralConfig cfg{32, 32, 3, 0.05f, 0.25f};
    std::vector<float> hin(32 * 32, 0.42f), hout(32 * 32, 0.0f);
    float *din = nullptr, *dout = nullptr;
    cudaMalloc(&din, hin.size() * 4); cudaMalloc(&dout, hout.size() * 4);
    cudaMemcpy(din, hin.data(), hin.size() * 4, cudaMemcpyHostToDevice);
    assert(launch_bilateral_global(din, dout, cfg, 0) == KernelStatus::Ok);
    cudaMemcpy(hout.data(), dout, hout.size() * 4, cudaMemcpyDeviceToHost);
    assert(verify_bilateral_parity(hin.data(), hout.data(), cfg, 1e-5f) == KernelStatus::Ok);
    cudaFree(din); cudaFree(dout);
    return 0;
}
