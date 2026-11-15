# Fused Rotary Position Embedding (RoPE) Complex-Pair CUDA Kernel (`rope_rotary_embedding`)

> Category: **GPU Transformer Kernels** | Language: **CUDA C++**

## Overview

Rotates paired query/key feature components (x_{2k}, x_{2k+1}) by position-dependent angles pos * theta^{-2k/d} using hardware __sincosf intrinsics while preserving Euclidean L2 norms.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(SeqLen * Heads * HeadDim) embarrassingly parallel` |
| **Space Complexity** | `O(1) on-the-fly trigonometric frequency computation` |

## Mathematical & Safety Invariants

- RoPE is an orthogonal SO(2) block rotation: ||RoPE(x)||_2 == ||x||_2 for every token and head.
- Dot product between rotated q_m and k_n depends strictly on relative offset (m - n).

## Module Architecture

| File | Lifecycle Role |
| :--- | :--- |
| `types.cuh` | Stage 01 |
| `errors.cuh` | Stage 02 |
| `interface.cuh` | Stage 03 |
| `core.cu` | Stage 04 |
| `validation.cu` | Stage 05 |
| `fast_path.cu` | Stage 06 |
| `concurrent.cu` | Stage 07 |
| `invariants.cu` | Stage 08 |
| `unit_tests.cu` | Stage 09 |
| `property_tests.cu` | Stage 10 |
| `benchmark.cu` | Stage 11 |
| `README.md` | Stage 12 |

## Verification & Execution Example

```text
nvcc -std=c++17 -O3 -arch=sm_80 core.cu validation.cu fast_path.cu concurrent.cu invariants.cu unit_tests.cu -o test_cu && ./test_cu
```

---
© 2026 Igor Kan
