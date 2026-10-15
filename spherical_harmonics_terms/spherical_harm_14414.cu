#include <cuda_runtime.h>
// CUDA implementation of spherical harmonic radial component order 14414
__global__ void kernel_spherical_harm_14414(const float *in, float *out, int n) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx < n) {
        float x = in[idx];
        out[idx] = __powf(x, 5.0f) / 10.0f;
    }
}
