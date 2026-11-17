#include "interface.cuh"
int main() {
    float *a = nullptr, *b = nullptr, *c = nullptr, *d = nullptr;
    cudaMalloc(&a, 256 * 4); cudaMalloc(&b, 256 * 4); cudaMalloc(&c, 256 * 4); cudaMalloc(&d, 256 * 4);
    cu_batched_tridiag_pcr_cuda::launch_pcr_batch(a, b, c, d, {64, 4});
    cudaFree(a); cudaFree(b); cudaFree(c); cudaFree(d);
    return 0;
}