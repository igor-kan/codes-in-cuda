# Warp-Shuffle Value+Index Pair ArgMax Parallel Reduction (`reduce_argmax_warp_cuda`)

> Category: **Parallel Reductions** | Language: **CUDA C++**

## Overview

Finds both the maximum value and its global array index simultaneously using tied __shfl_down_sync comparisons without shared-memory bank conflicts.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / P + log2(WarpSize)) ballot-free register pair shuffle` |
| **Space Complexity** | `O(1) per-thread registers` |

## Mathematical & Safety Invariants

- Winning tie-break returns the smallest index achieving global max.

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
