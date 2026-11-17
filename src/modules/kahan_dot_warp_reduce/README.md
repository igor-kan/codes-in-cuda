# Compensated Kahan-Neumaier Warp-Reduced Dot Product (`kahan_dot_warp_reduce`)

> Category: **Floating-Point HPC** | Language: **CUDA C++**

## Overview

Accumulates FP32 inner products with Neumaier compensated error terms inside each thread before pairwise-compensated warp shuffle reduction into block totals.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / P) grid-stride Neumaier accumulation + warp shuffle` |
| **Space Complexity** | `O(1) per-thread registers` |

## Mathematical & Safety Invariants

- Reduces catastrophic cancellation on large dynamic range vectors compared to naive sum.

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
