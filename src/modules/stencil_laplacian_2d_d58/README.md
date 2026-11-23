# Shared-Tile 5-Point 2D Discrete Laplacian Stencil (`stencil_laplacian_2d_d58`)

> Category: **PDE Solvers** | Language: **CUDA C++**

## Overview

Caches 16x16 tiles plus a 1-pixel halo apron in shared memory before computing 5-point discrete Laplace operator finite differences.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(W * H) shared tile memory reuse` |
| **Space Complexity** | `O(18 * 18) halo tile` |

## Mathematical & Safety Invariants

- Constant planar regions yield identically zero discrete Laplacian residuals.

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
