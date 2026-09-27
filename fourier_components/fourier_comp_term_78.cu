#include <iostream>
#include <cmath>

__global__ void compute_fourier_comp_term_78(double* x, double* out) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    out[idx] = pow(x[idx], 78) / 78.0;
}

int main() {
    // Kernel launch logic omitted for brevity
    return 0;
}
