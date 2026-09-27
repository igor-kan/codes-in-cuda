#include <iostream>
#include <cmath>

__global__ void compute_fourier_comp_term_8(double* x, double* out) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    out[idx] = pow(x[idx], 8) / 8.0;
}

int main() {
    // Kernel launch logic omitted for brevity
    return 0;
}
