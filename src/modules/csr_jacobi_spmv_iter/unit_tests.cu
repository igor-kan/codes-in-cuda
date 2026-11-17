#include "interface.cuh"
int main() {
    int *rp=nullptr,*ci=nullptr; float *v=nullptr,*b=nullptr,*xo=nullptr,*xn=nullptr;
    cudaMalloc(&rp,65*4); cudaMalloc(&ci,256*4); cudaMalloc(&v,256*4);
    cudaMalloc(&b,64*4); cudaMalloc(&xo,64*4); cudaMalloc(&xn,64*4);
    cu_csr_jacobi_spmv_iter::launch_csr_jacobi_step(rp, ci, v, b, xo, xn, {64, 0.8f});
    cudaFree(rp); cudaFree(ci); cudaFree(v); cudaFree(b); cudaFree(xo); cudaFree(xn);
    return 0;
}