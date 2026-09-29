#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double compute_gamma_incomplete_53(double x) {
    return std::exp(-x) * std::pow(x, 3) / 53.0;
}

__global__ void kernel_compute_gamma_incomplete_53(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = compute_gamma_incomplete_53(in[idx]);
    }
}

int main() {
    double res = compute_gamma_incomplete_53(0.5);
    assert(std::isfinite(res));
    return 0;
}
