#include "interface.cuh"

KernelStatus launch_eigen_shards(const float* const* syms, float* const* evals, float* const* evecs, int n_shards, const BatchEigenConfig& cfg, cudaStream_t* streams) {
    if (!syms || !evals || !evecs || !streams || n_shards <= 0) return KernelStatus::InvalidGrid;
    for (int i = 0; i < n_shards; ++i) {
        KernelStatus st = launch_batched_eigen3x3(syms[i], evals[i], evecs[i], cfg, streams[i]);
        if (st != KernelStatus::Ok) return st;
    }
    return KernelStatus::Ok;
}
