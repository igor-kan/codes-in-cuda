#include "interface.cuh"

namespace cu_huber_loss_grad_fused_gpu {

KernelStatus sync_stream_checked(cudaStream_t stream) {
    cudaError_t err = cudaStreamSynchronize(stream);
    if (err != cudaSuccess) {
        return KernelStatus::LaunchError;
    }
    return KernelStatus::Ok;
}

} // namespace cu_huber_loss_grad_fused_gpu
