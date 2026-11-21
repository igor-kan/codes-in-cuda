#include "interface.cuh"

namespace cu_radix_bit_partition_d56 {

KernelStatus sync_stream_checked(cudaStream_t stream) {
    cudaError_t err = cudaStreamSynchronize(stream);
    if (err != cudaSuccess) {
        return KernelStatus::LaunchError;
    }
    return KernelStatus::Ok;
}

} // namespace cu_radix_bit_partition_d56
