#pragma once
#include <cuda_runtime.h>
#include <cstdint>
#include <cstddef>

namespace cu_histogram_shared_atom_d57 {
constexpr int WARP_SIZE = 32;
struct HistDesc {
    int bins = 16;
    int threads = 256;
};

struct LaunchMetrics {
    int blocks = 1;
    int threads = 256;
};
} // namespace cu_histogram_shared_atom_d57
