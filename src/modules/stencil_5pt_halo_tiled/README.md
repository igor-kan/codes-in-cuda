# Shared-Memory Halo-Loaded 2D 5-Point Stencil Smoothing Kernel (`stencil_5pt_halo_tiled`)

> Category: **PDE & Image Filtering** | Language: **CUDA C++**

## Overview

Loads interior and 1-cell halo boundary cells into 2D shared memory tiles once per block to compute smoothed 5-point Laplace updates with coalesced global traffic.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(W * H / P) shared-tile neighbor reuse reducing global reads 5x` |
| **Space Complexity** | `O((16+2) * (16+2)) shared tile` |

## Mathematical & Safety Invariants

- Uniform constant fields remain strictly invariant across stencil sweeps.

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
