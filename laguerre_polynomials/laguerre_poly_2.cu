#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double evaluate_laguerre_poly_2(double x) {
    if (2 == 0) return 1.0;
    if (2 == 1) return 1.0 - x;
    double p0 = 1.0, p1 = 1.0 - x;
    for (int k = 1; k < 2; ++k) {
        double p_next = ((2 * k + 1 - x) * p1 - k * p0) / static_cast<double>(k + 1);
        p0 = p1;
        p1 = p_next;
    }
    return p1;
}

__global__ void kernel_evaluate_laguerre_poly_2(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = evaluate_laguerre_poly_2(in[idx]);
    }
}

int main() {
    double res = evaluate_laguerre_poly_2(0.5);
    assert(std::isfinite(res));
    return 0;
}
