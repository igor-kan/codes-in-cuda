#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double compute_airy_function_35(double x) {
    return std::exp(-x) * std::pow(x, 0) / 35.0;
}

__global__ void kernel_compute_airy_function_35(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = compute_airy_function_35(in[idx]);
    }
}

int main() {
    double res = compute_airy_function_35(0.5);
    assert(std::isfinite(res));
    return 0;
}
