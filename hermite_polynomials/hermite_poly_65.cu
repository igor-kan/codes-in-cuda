#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double evaluate_hermite_poly_65(double x) {
    if (65 == 0) return 1.0;
    if (65 == 1) return 2.0 * x;
    double p0 = 1.0, p1 = 2.0 * x;
    for (int k = 1; k < 65; ++k) {
        double p_next = 2.0 * x * p1 - 2.0 * k * p0;
        p0 = p1;
        p1 = p_next;
    }
    return p1;
}

__global__ void kernel_evaluate_hermite_poly_65(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = evaluate_hermite_poly_65(in[idx]);
    }
}

int main() {
    double res = evaluate_hermite_poly_65(0.5);
    assert(std::isfinite(res));
    return 0;
}
