#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_warp_ballot_compact_d58::validate_grid_dim(256) == cu_warp_ballot_compact_d58::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_warp_ballot_compact_d58::warp_compact_kernel<<<1, 256>>>(d_a, d_b, 0.5f, 256);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
