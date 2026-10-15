#include <cuda_runtime.h>
// CUDA implementation of fibonacci matrix power recurrence order 14423
__global__ void kernel_fibonacci_matrix_14423(const float *in, float *out, int n) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx < n) {
        float x = in[idx];
        float f0 = 1.0f, f1 = 1.0f;
        for (int i = 0; i < 12; ++i) { float nx = f0 + f1 * x * 0.1f; f0 = f1; f1 = nx; }
        out[idx] = f1;
    }
}
