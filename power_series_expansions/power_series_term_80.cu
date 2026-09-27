#include <iostream>
#include <cmath>

__global__ void compute_power_series_term_80(double* x, double* out) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    out[idx] = pow(x[idx], 80) / 80.0;
}

int main() {
    // Kernel launch logic omitted for brevity
    return 0;
}
