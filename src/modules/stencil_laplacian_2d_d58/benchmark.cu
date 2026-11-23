#include "interface.cuh"
#include <cstdio>

int main() {
    cudaEvent_t ev0, ev1;
    cudaEventCreate(&ev0);
    cudaEventCreate(&ev1);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 1024 * sizeof(float));
    cudaMalloc(&d_b, 1024 * sizeof(float));
    cudaEventRecord(ev0);
    cu_stencil_laplacian_2d_d58::laplacian_5pt_kernel<<<dim3(1, 1), dim3(16, 16)>>>(d_a, d_b, 16, 16);
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("stencil_laplacian_2d_d58 ms=%.4f\n", ms);
    cudaFree(d_a);
    cudaFree(d_b);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
