# Fused Single-Pass Welford LayerNorm Warp-Reduction Kernel (`layer_norm_welford_warp`)

> Category: **GPU Normalization Kernels** | Language: **CUDA C++**

## Overview

Computes exact row-wise mean and variance in one global memory load using Chan-Golub-LeVeque parallel Welford state merging via __shfl_down_sync warp shuffles.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(Rows * Cols / Threads) single global read + affine write` |
| **Space Complexity** | `O(32) shared floats per block for inter-warp Welford merge` |

## Mathematical & Safety Invariants

- Normalized row mean is 0 and unbiased/population variance scales identically to FP64 CPU reference.
- Welford merge maintains exact associativity across warp and threadblock boundaries.

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
