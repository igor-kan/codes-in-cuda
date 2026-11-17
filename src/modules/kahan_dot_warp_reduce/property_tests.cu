#include "interface.cuh"
int main() {
    float *a=nullptr,*b=nullptr,*o=nullptr;
    cudaMalloc(&a,1000*4); cudaMalloc(&b,1000*4); cudaMalloc(&o,4);
    cu_kahan_dot_warp_reduce::launch_kahan_dot(a, b, o, 1000);
    cudaFree(a); cudaFree(b); cudaFree(o);
    return 0;
}