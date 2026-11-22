#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_histogram_shared_atom_d57::validate_grid_dim(256) == cu_histogram_shared_atom_d57::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_histogram_shared_atom_d57::hist_shared16_kernel<<<1, 256>>>(d_a, d_b, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
