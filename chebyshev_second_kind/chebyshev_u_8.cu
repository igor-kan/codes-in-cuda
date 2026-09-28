#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double evaluate_chebyshev_u_8(double x) {
    if (8 == 0) return 1.0;
    if (8 == 1) return 2.0 * x;
    double p0 = 1.0, p1 = 2.0 * x;
    for (int k = 1; k < 8; ++k) {
        double p_next = 2.0 * x * p1 - p0;
        p0 = p1;
        p1 = p_next;
    }
    return p1;
}

__global__ void kernel_evaluate_chebyshev_u_8(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = evaluate_chebyshev_u_8(in[idx]);
    }
}

int main() {
    double res = evaluate_chebyshev_u_8(0.5);
    assert(std::isfinite(res));
    return 0;
}
