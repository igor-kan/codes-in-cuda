#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double compute_fibonacci_matrix_13(double x) {
    return (1.0 + x * 2.0) / (1.0 + x * x * 2.0);
}

__global__ void kernel_compute_fibonacci_matrix_13(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = compute_fibonacci_matrix_13(in[idx]);
    }
}

int main() {
    double res = compute_fibonacci_matrix_13(0.5);
    assert(std::isfinite(res));
    return 0;
}
