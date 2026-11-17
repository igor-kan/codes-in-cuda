#include "interface.cuh"
int main() {
    float *di=nullptr,*df=nullptr,*do_=nullptr;
    cudaMalloc(&di,513*4); cudaMalloc(&df,11*4); cudaMalloc(&do_,513*4);
    cu_convolution_1d_halo_shared::launch_conv1d_halo(di, df, do_, {513, 5, 1.0f});
    cudaFree(di); cudaFree(df); cudaFree(do_);
    return 0;
}