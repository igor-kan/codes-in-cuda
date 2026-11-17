#include "interface.cuh"
#include <cstdio>

int main() {
    cudaEvent_t ev0, ev1;
    cudaEventCreate(&ev0);
    cudaEventCreate(&ev1);
    float *di=nullptr,*do_=nullptr; int* d_idx=nullptr; cudaMalloc(&di,4096*4); cudaMalloc(&do_,128*4); cudaMalloc(&d_idx,128*4);
    cudaEventRecord(ev0);
    cu_top_k_warp_bitonic_select::launch_warp_topk(di, do_, d_idx, {16, 256, 8});
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("top_k_warp_bitonic_select ms=%.4f\n", ms);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
