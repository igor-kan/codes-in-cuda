#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double evaluate_legendre_poly_71(double x) {
    if (71 == 0) return 1.0;
    if (71 == 1) return x;
    double p0 = 1.0, p1 = x;
    for (int k = 2; k <= 71; ++k) {
        double p_next = ((2 * k - 1) * x * p1 - (k - 1) * p0) / static_cast<double>(k);
        p0 = p1;
        p1 = p_next;
    }
    return p1;
}

__global__ void kernel_evaluate_legendre_poly_71(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = evaluate_legendre_poly_71(in[idx]);
    }
}

int main() {
    double res = evaluate_legendre_poly_71(0.5);
    assert(std::isfinite(res));
    return 0;
}
