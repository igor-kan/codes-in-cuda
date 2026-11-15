#include "interface.cuh"
#include <cassert>
#include <vector>

int main() {
    using namespace cu_rope_rotary_embedding;
    RopeConfig cfg{16, 4, 32, 10000.0f, 0};
    assert(validate_rope_config(cfg) == 0);
    int n = 16 * 4 * 32;
    std::vector<float> h0(n, 0.75f), h1(n, 0.0f);
    float* dq;
    cudaMalloc(&dq, n * sizeof(float));
    cudaMemcpy(dq, h0.data(), n * sizeof(float), cudaMemcpyHostToDevice);
    launch_rope_forward(dq, cfg, 0);
    cudaMemcpy(h1.data(), dq, n * sizeof(float), cudaMemcpyDeviceToHost);
    assert(verify_rope_norm_preservation(h0.data(), h1.data(), n / 2) < 1e-4f);
    cudaFree(dq);
    return 0;
}
