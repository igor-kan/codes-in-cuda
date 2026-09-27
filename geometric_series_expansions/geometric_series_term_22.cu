#include <iostream>
#include <cmath>

__global__ void compute_geometric_series_term_22(double* x, double* out) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    out[idx] = pow(x[idx], 22) / 22.0;
}

int main() {
    // Kernel launch logic omitted for brevity
    return 0;
}
