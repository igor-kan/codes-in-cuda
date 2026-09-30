#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double compute_chebyshev_colloc_22(double x) {
    return (1.0 + x * 2.0) / (1.0 + x * x * 1.0);
}

__global__ void kernel_compute_chebyshev_colloc_22(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = compute_chebyshev_colloc_22(in[idx]);
    }
}

int main() {
    double res = compute_chebyshev_colloc_22(0.5);
    assert(std::isfinite(res));
    return 0;
}
