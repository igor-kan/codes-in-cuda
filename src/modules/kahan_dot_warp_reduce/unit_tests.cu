#include "interface.cuh"
int main() {
    float *a=nullptr,*b=nullptr,*o=nullptr;
    cudaMalloc(&a,256*4); cudaMalloc(&b,256*4); cudaMalloc(&o,4); cudaMemset(o,0,4);
    cu_kahan_dot_warp_reduce::launch_kahan_dot(a, b, o, 256);
    cudaFree(a); cudaFree(b); cudaFree(o);
    return 0;
}