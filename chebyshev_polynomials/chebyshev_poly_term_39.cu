#include <iostream>
#include <cmath>

__global__ void compute_chebyshev_poly_term_39(double* x, double* out) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    out[idx] = pow(x[idx], 39) / 39.0;
}

int main() {
    // Kernel launch logic omitted for brevity
    return 0;
}
