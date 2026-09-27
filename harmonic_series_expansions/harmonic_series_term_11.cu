#include <iostream>
#include <cmath>

__global__ void compute_harmonic_series_term_11(double* x, double* out) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    out[idx] = pow(x[idx], 11) / 11.0;
}

int main() {
    // Kernel launch logic omitted for brevity
    return 0;
}
