#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double compute_riemann_zeta_64(double x) {
    return std::exp(-x) * std::pow(x, 4) / 64.0;
}

__global__ void kernel_compute_riemann_zeta_64(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = compute_riemann_zeta_64(in[idx]);
    }
}

int main() {
    double res = compute_riemann_zeta_64(0.5);
    assert(std::isfinite(res));
    return 0;
}
