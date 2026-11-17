#include "interface.cuh"
int main() {
    int *rp=nullptr,*ci=nullptr,*deg=nullptr; float *po=nullptr,*pn=nullptr;
    cudaMalloc(&rp,65*4); cudaMalloc(&ci,256*4); cudaMalloc(&deg,64*4);
    cudaMalloc(&po,64*4); cudaMalloc(&pn,64*4);
    cu_page_rank_power_csr_gpu::launch_pagerank_step(rp, ci, deg, po, pn, {64, 0.85f, 0.0f});
    cudaFree(rp); cudaFree(ci); cudaFree(deg); cudaFree(po); cudaFree(pn);
    return 0;
}