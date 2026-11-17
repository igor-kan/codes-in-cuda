#include "interface.cuh"
int main() {
    float *di=nullptr,*df=nullptr,*do_=nullptr;
    cudaMalloc(&di,256*4); cudaMalloc(&df,7*4); cudaMalloc(&do_,256*4);
    cu_convolution_1d_halo_shared::launch_conv1d_halo(di, df, do_, {256, 3, 1.0f});
    cudaFree(di); cudaFree(df); cudaFree(do_);
    return 0;
}