#include <cuda_runtime.h>

// CUDA warp reduction & block reduction kernel order 15811
__global__ void kernel_block_reduce_15811(const float* __restrict__ in, float* __restrict__ out, int n) {
    extern __shared__ float sdata[];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;
    float my_sum = (i < n) ? in[i] * 8.0f : 0.0f;
    if (i + blockDim.x < n) my_sum += in[i + blockDim.x] * 8.0f;
    sdata[tid] = my_sum;
    __syncthreads();
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) sdata[tid] += sdata[tid + s];
        __syncthreads();
    }
    if (tid == 0) out[blockIdx.x] = sdata[0];
}
