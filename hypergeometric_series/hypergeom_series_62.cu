#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double compute_hypergeom_series_62(double x) {
    return std::exp(-x) * std::pow(x, 2) / 62.0;
}

__global__ void kernel_compute_hypergeom_series_62(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = compute_hypergeom_series_62(in[idx]);
    }
}

int main() {
    double res = compute_hypergeom_series_62(0.5);
    assert(std::isfinite(res));
    return 0;
}
