#include "interface.cuh"
#include <cassert>

int main() {
    assert(cu_box_blur_clamp_2d_d57::validate_grid_dim(256) == cu_box_blur_clamp_2d_d57::KernelStatus::Ok);
    float *d_a = nullptr, *d_b = nullptr;
    cudaMalloc(&d_a, 256 * sizeof(float));
    cudaMalloc(&d_b, 256 * sizeof(float));
    cu_box_blur_clamp_2d_d57::box_blur2d_kernel<<<dim3(1, 1), dim3(16, 16)>>>(d_a, d_b, 16, 16);
    cudaFree(d_a);
    cudaFree(d_b);
    return 0;
}
