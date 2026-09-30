#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double compute_continued_frac_65(double x) {
    return (1.0 + x * 3.0) / (1.0 + x * x * 2.0);
}

__global__ void kernel_compute_continued_frac_65(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = compute_continued_frac_65(in[idx]);
    }
}

int main() {
    double res = compute_continued_frac_65(0.5);
    assert(std::isfinite(res));
    return 0;
}
