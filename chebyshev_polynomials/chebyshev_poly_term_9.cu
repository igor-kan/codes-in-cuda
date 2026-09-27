#include <iostream>
#include <cmath>

__global__ void compute_chebyshev_poly_term_9(double* x, double* out) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    out[idx] = pow(x[idx], 9) / 9.0;
}

int main() {
    // Kernel launch logic omitted for brevity
    return 0;
}
