#include <iostream>
#include <cmath>

__global__ void compute_geometric_series_term_42(double* x, double* out) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    out[idx] = pow(x[idx], 42) / 42.0;
}

int main() {
    // Kernel launch logic omitted for brevity
    return 0;
}
