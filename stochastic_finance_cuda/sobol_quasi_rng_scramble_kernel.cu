#include "sobol_quasi_rng_scramble_kernel.cuh"

__global__ void sobol_scramble_kernel(unsigned int* points, unsigned int mask, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;
    points[idx] ^= mask;
}
