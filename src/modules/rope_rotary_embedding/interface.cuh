#pragma once
#include "types.cuh"
#include "errors.cuh"

namespace cu_rope_rotary_embedding {
void launch_rope_forward(float* d_qk, RopeConfig cfg, cudaStream_t stream);
int validate_rope_config(RopeConfig cfg);
void launch_rope_paired_fast(float* d_q, float* d_k, RopeConfig cfg, cudaStream_t stream);
void launch_rope_batched_streams(float** d_batches, int count, RopeConfig cfg, cudaStream_t* streams);
float verify_rope_norm_preservation(const float* h_before, const float* h_after, int total_pairs);
} // namespace cu_rope_rotary_embedding
