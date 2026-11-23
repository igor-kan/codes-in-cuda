# FMA Shared-Memory Outer-Product Square Matrix Multiply (`matmul_outer_tile_d58`)

> Category: **Linear Algebra Kernels** | Language: **CUDA C++**

## Overview

Computes block matrix multiplication via fused fmaf accumulations over coalesced 16x16 shared tiles cleanly.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^3 / B^2)` |
| **Space Complexity** | `O(2 * 16 * 16)` |

## Mathematical & Safety Invariants

- Accumulated entries match exact row-by-column inner products.

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
