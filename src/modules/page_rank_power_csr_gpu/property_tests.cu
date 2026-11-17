#include "interface.cuh"
int main() {
    int *rp=nullptr,*ci=nullptr,*deg=nullptr; float *po=nullptr,*pn=nullptr;
    cudaMalloc(&rp,129*4); cudaMalloc(&ci,512*4); cudaMalloc(&deg,128*4);
    cudaMalloc(&po,128*4); cudaMalloc(&pn,128*4);
    cu_page_rank_power_csr_gpu::launch_pagerank_step(rp, ci, deg, po, pn, {128, 0.85f, 0.05f});
    cudaFree(rp); cudaFree(ci); cudaFree(deg); cudaFree(po); cudaFree(pn);
    return 0;
}