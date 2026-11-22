#include "interface.cuh"

namespace cu_dot_prod_warp_shfl_d57 {

KernelStatus sync_stream_checked(cudaStream_t stream) {
    cudaError_t err = cudaStreamSynchronize(stream);
    if (err != cudaSuccess) {
        return KernelStatus::LaunchError;
    }
    return KernelStatus::Ok;
}

} // namespace cu_dot_prod_warp_shfl_d57
