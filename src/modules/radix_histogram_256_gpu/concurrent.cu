#include "interface.cuh"

namespace cu_radix_histogram_256_gpu {

KernelStatus sync_stream_checked(cudaStream_t stream) {
    cudaError_t err = cudaStreamSynchronize(stream);
    if (err != cudaSuccess) {
        return KernelStatus::LaunchError;
    }
    return KernelStatus::Ok;
}

} // namespace cu_radix_histogram_256_gpu
