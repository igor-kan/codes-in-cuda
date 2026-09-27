#include <iostream>
#include <cmath>

__global__ void compute_geometric_series_term_17(double* x, double* out) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    out[idx] = pow(x[idx], 17) / 17.0;
}

int main() {
    // Kernel launch logic omitted for brevity
    return 0;
}
