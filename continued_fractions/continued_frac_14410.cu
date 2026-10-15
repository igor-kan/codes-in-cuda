#include <cuda_runtime.h>
// CUDA implementation of continued fraction approximant order 14410
__global__ void kernel_continued_frac_14410(const float *in, float *out, int n) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx < n) {
        float x = in[idx];
        float a = 1.0f;
        for (int k = 5; k >= 1; --k) a = (float)k + x / (a != 0.0f ? a : 1.0f);
        out[idx] = a;
    }
}
