#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_stencil_5pt_halo_tiled {
void launch_5pt_stencil(const float* d_u, float* d_out, int n);

KernelStatus validate_grid_dim(int n);
} // namespace cu_stencil_5pt_halo_tiled
