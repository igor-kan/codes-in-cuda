#include <iostream>
#include <cmath>
#include <cassert>

__host__ __device__ double evaluate_bessel_series_69(double x) {
    double sign = -1.0;
    double denom = 10461394944000.0;
    return sign * pow(x / 2.0, 19) / denom;
}

__global__ void kernel_evaluate_bessel_series_69(const double* in, double* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = evaluate_bessel_series_69(in[idx]);
    }
}

int main() {
    double res = evaluate_bessel_series_69(0.5);
    assert(std::isfinite(res));
    return 0;
}
