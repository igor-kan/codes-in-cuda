#include <iostream>
#include <cmath>

__global__ void compute_power_series_term_50(double* x, double* out) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    out[idx] = pow(x[idx], 50) / 50.0;
}

int main() {
    // Kernel launch logic omitted for brevity
    return 0;
}
