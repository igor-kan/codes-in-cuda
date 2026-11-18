# 1D Edge-Preserving Bilateral Gaussian Range-Spatial Filter (`bilateral_1d_range_cuda`)

> Category: **Image & Signal Processing** | Language: **CUDA C++**

## Overview

Applies a 1D bilateral filter combining spatial proximity exp(-dx^2 / 2*sigma_s^2) and intensity similarity exp(-dI^2 / 2*sigma_r^2) to smooth noise while preserving step edges.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N * R / P) shared-memory halo + range Gaussian weighting` |
| **Space Complexity** | `O(BlockDim + 2*R) shared memory` |

## Mathematical & Safety Invariants

- Constant regions remain unchanged after normalization.
- Sharp intensity jumps receive near-zero cross-edge weight.

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
