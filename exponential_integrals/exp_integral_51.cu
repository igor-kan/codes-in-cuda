#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double compute_exp_integral_51(double x) {
    return std::exp(-x) * std::pow(x, 1) / 51.0;
}

__global__ void kernel_compute_exp_integral_51(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = compute_exp_integral_51(in[idx]);
    }
}

int main() {
    double res = compute_exp_integral_51(0.5);
    assert(std::isfinite(res));
    return 0;
}
