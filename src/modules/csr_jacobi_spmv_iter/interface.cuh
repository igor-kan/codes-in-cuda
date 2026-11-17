#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_csr_jacobi_spmv_iter {
void launch_csr_jacobi_step(const int* rp, const int* ci, const float* val, const float* b, const float* x_old, float* x_new, JacobiCfg cfg);
} // namespace cu_csr_jacobi_spmv_iter
