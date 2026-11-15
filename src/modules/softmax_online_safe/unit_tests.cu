#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    using namespace cu_softmax_online_safe;
    SoftmaxConfig cfg{2, 256};
    assert(validate_softmax_cfg(cfg) == 0);
    std::vector<float> hi(512, 100.0f), ho(512, 0.0f);
    hi[7] = 105.0f;
    float *di, *dout;
    cudaMalloc(&di, 512 * sizeof(float));
    cudaMalloc(&dout, 512 * sizeof(float));
    cudaMemcpy(di, hi.data(), 512 * sizeof(float), cudaMemcpyHostToDevice);
    launch_online_softmax(di, dout, cfg, 0);
    cudaMemcpy(ho.data(), dout, 512 * sizeof(float), cudaMemcpyDeviceToHost);
    assert(verify_softmax_simplex_sum(ho.data(), 256) < 1e-4f);
    cudaFree(di); cudaFree(dout);
    return 0;
}
