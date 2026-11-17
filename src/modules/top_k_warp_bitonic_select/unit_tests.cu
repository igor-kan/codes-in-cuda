#include "interface.cuh"
#include <vector>
int main() {
    cu_top_k_warp_bitonic_select::TopKConfig cfg{4, 64, 4};
    std::vector<float> h_in(256, 1.0f);
    h_in[3] = 99.0f;
    float *d_in = nullptr, *d_out = nullptr; int* d_idx = nullptr;
    cudaMalloc(&d_in, 256 * sizeof(float));
    cudaMalloc(&d_out, 16 * sizeof(float));
    cudaMalloc(&d_idx, 16 * sizeof(int));
    cudaMemcpy(d_in, h_in.data(), 256 * sizeof(float), cudaMemcpyHostToDevice);
    cu_top_k_warp_bitonic_select::launch_warp_topk(d_in, d_out, d_idx, cfg);
    cudaFree(d_in); cudaFree(d_out); cudaFree(d_idx);
    return 0;
}