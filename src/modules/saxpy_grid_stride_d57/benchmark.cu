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
    cu_saxpy_grid_stride_d57::saxpy_stride_kernel<<<1, 256>>>(d_a, d_b, 2.5f, 256);
    cudaEventRecord(ev1);
    cudaEventSynchronize(ev1);
    float ms = 0.0f;
    cudaEventElapsedTime(&ms, ev0, ev1);
    std::printf("saxpy_grid_stride_d57 ms=%.4f\n", ms);
    cudaFree(d_a);
    cudaFree(d_b);
    cudaEventDestroy(ev0);
    cudaEventDestroy(ev1);
    return 0;
}
