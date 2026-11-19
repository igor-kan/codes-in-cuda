#pragma once
#include <cuda_runtime.h>
#include <cstdio>

namespace cu_stencil_5pt_halo_tiled {
enum class KernelStatus {
    Ok = 0,
    InvalidGrid = 1,
    InvalidDimension = 2,
    DeviceSyncFailure = 3,
    InvariantMismatch = 4
};

inline KernelStatus check_cuda(cudaError_t err, const char* site) {
    if (err != cudaSuccess) {
        std::fprintf(stderr, "CUDA error at %s: %s\n", site, cudaGetErrorString(err));
        return KernelStatus::DeviceSyncFailure;
    }
    return KernelStatus::Ok;
}

} // namespace cu_stencil_5pt_halo_tiled
