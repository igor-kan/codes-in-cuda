#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double evaluate_laguerre_poly_77(double x) {
    if (77 == 0) return 1.0;
    if (77 == 1) return 1.0 - x;
    double p0 = 1.0, p1 = 1.0 - x;
    for (int k = 1; k < 77; ++k) {
        double p_next = ((2 * k + 1 - x) * p1 - k * p0) / static_cast<double>(k + 1);
        p0 = p1;
        p1 = p_next;
    }
    return p1;
}

__global__ void kernel_evaluate_laguerre_poly_77(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = evaluate_laguerre_poly_77(in[idx]);
    }
}

int main() {
    double res = evaluate_laguerre_poly_77(0.5);
    assert(std::isfinite(res));
    return 0;
}
