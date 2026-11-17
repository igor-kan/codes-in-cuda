#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_page_rank_power_csr_gpu {
void launch_pagerank_step(const int* rp, const int* ci, const int* out_deg, const float* pr_old, float* pr_new, PrCfg cfg);
} // namespace cu_page_rank_power_csr_gpu
