#include "interface.cuh"
#include <cstdio>

int main() {
    cudaEvent_t ev0, ev1;
    cudaEventCreate(&ev0);
    cudaEventCreate(&ev1);
    int *rp=nullptr,*ci=nullptr,*deg=nullptr; float *po=nullptr,*pn=nullptr; cudaMalloc(&rp,257*4); cudaMalloc(&ci,1024*4); cudaMalloc(&deg,256*4); cudaMalloc(&po,256*4); cudaMalloc(&pn,256*4);
    cudaEventRecord(ev0);
    cu_page_rank_power_csr_gpu::launch_pagerank_step(rp, ci, deg, po, pn, {256, 0.85f, 0.0f});
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("page_rank_power_csr_gpu ms=%.4f\n", ms);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
