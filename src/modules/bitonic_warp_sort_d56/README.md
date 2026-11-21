# Block-Shared Bitonic Compare-Exchange Sorter (`bitonic_warp_sort_d56`)

> Category: **GPU Sorting** | Language: **CUDA C++**

## Overview

Executes deterministic Batcher bitonic sorting stages in shared memory across power-of-two thread tiles.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(log^2 B) parallel compare-swap stages` |
| **Space Complexity** | `O(B) shared buffer` |

## Mathematical & Safety Invariants

- Every adjacent output pair inside the 256-element tile is non-decreasing.

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
