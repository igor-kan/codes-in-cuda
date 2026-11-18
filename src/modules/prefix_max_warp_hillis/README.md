# Inclusive Warp-Shuffle Hillis-Steele Prefix Maximum Scan (`prefix_max_warp_hillis`)

> Category: **Parallel Primitives** | Language: **CUDA C++**

## Overview

Computes inclusive prefix maxima across 256-thread blocks by chaining 5-step __shfl_up_sync intra-warp prefix maxima with a shared-memory warp-spine scan.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / P * log2(WarpSize)) register-level inclusive prefix max` |
| **Space Complexity** | `O(WarpSize) shared spine` |

## Mathematical & Safety Invariants

- Output y[i] is monotonically non-decreasing and equals max_{0 <= k <= i} x[k].

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
