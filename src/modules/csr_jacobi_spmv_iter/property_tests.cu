#include "interface.cuh"
int main() {
    int *rp=nullptr,*ci=nullptr; float *v=nullptr,*b=nullptr,*xo=nullptr,*xn=nullptr;
    cudaMalloc(&rp,129*4); cudaMalloc(&ci,512*4); cudaMalloc(&v,512*4);
    cudaMalloc(&b,128*4); cudaMalloc(&xo,128*4); cudaMalloc(&xn,128*4);
    cu_csr_jacobi_spmv_iter::launch_csr_jacobi_step(rp, ci, v, b, xo, xn, {128, 1.0f});
    cudaFree(rp); cudaFree(ci); cudaFree(v); cudaFree(b); cudaFree(xo); cudaFree(xn);
    return 0;
}