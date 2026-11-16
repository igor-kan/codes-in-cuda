#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_marching_squares_isoline {
KernelStatus launch_marching_squares_classify(const float* d_field, int* d_cell_cases, int* d_seg_counts, const IsolineConfig& cfg, cudaStream_t stream);
KernelStatus validate_isoline_cfg(const IsolineConfig& cfg);
KernelStatus launch_marching_squares_emit(const float* d_field, const int* d_offsets, SegVertex2D* d_segs, const IsolineConfig& cfg, cudaStream_t stream);
KernelStatus verify_isoline_cpu(const float* h_field, int width, int height, float iso, int expected_cells);
} // namespace cu_marching_squares_isoline
