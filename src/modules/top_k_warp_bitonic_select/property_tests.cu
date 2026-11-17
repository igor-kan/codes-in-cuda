#include "interface.cuh"
int main() {
    float *d_in = nullptr, *d_out = nullptr; int* d_idx = nullptr;
    cudaMalloc(&d_in, 1024 * sizeof(float)); cudaMalloc(&d_out, 64 * sizeof(float)); cudaMalloc(&d_idx, 64 * sizeof(int));
    cu_top_k_warp_bitonic_select::launch_warp_topk(d_in, d_out, d_idx, {8, 128, 8});
    cudaFree(d_in); cudaFree(d_out); cudaFree(d_idx);
    return 0;
}