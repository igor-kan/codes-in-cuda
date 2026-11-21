#include "interface.cuh"
#include <cmath>

namespace cu_radix_bit_partition_d56 {

__global__ void radix_bit_split_kernel(const float* d_in, float* d_out, int n, int bit_pos) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned active = __activemask();
    int key = (gid < n) ? static_cast<int>(d_in[gid]) : 0;
    int pred = (key >> bit_pos) & 1;
    unsigned ones = __ballot_sync(active, pred == 1);
    unsigned zeros = ~ones & active;
    int lane = threadIdx.x & 31;
    unsigned lower = (1u << lane) - 1u;
    int rank = pred ? (__popc(ones) + __popc(ones & lower)) : __popc(zeros & lower);
    if (gid < n) d_out[gid] = static_cast<float>(rank);
}

} // namespace cu_radix_bit_partition_d56
