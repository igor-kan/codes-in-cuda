#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_chebyshev_poly_eval_cuda::validate_grid_dim(256) == cu_chebyshev_poly_eval_cuda::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_chebyshev_poly_eval_cuda::launch_clenshaw_eval(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
