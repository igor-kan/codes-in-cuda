#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_jacobi_eigen_batch3x3 {
constexpr int WARP_SIZE = 32;
struct BatchEigenConfig {
    int count;
    int max_sweeps;
    float tol;
};
} // namespace cu_jacobi_eigen_batch3x3
