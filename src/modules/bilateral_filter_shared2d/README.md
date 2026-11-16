# Edge-Preserving 2D Bilateral Filter with Halo-Padded __shared__ Tiles (`bilateral_filter_shared2d`)

> Category: **GPU Image & Vision Kernels** | Language: **CUDA C++**

## Overview

Applies edge-preserving spatial + photometric Gaussian bilateral smoothing on 2D float32 frames using halo-expanded 2D __shared__ memory caches and clamped image border mirroring.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(H * W * (2R+1)^2) via coalesced halo SRAM tiles` |
| **Space Complexity** | `O((TileW+2R)*(TileH+2R)) shared memory per threadblock` |

## Mathematical & Safety Invariants

- Constant intensity images remain strictly unchanged (filter preserves uniform DC planes).
- High-contrast step edges resist bleeding relative to isotropic Gaussian blurs.

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
