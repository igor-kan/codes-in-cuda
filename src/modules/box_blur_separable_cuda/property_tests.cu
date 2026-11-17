#include "interface.cuh"
int main() {
    float *di=nullptr,*dt=nullptr,*do_=nullptr;
    cudaMalloc(&di,2048*4); cudaMalloc(&dt,2048*4); cudaMalloc(&do_,2048*4);
    cu_box_blur_separable_cuda::launch_separable_blur(di, dt, do_, {64, 32, 3});
    cudaFree(di); cudaFree(dt); cudaFree(do_);
    return 0;
}