#include "interface.cuh"
int main() {
    float *di=nullptr,*dt=nullptr,*do_=nullptr;
    cudaMalloc(&di,1024*4); cudaMalloc(&dt,1024*4); cudaMalloc(&do_,1024*4);
    cu_box_blur_separable_cuda::launch_separable_blur(di, dt, do_, {32, 32, 2});
    cudaFree(di); cudaFree(dt); cudaFree(do_);
    return 0;
}