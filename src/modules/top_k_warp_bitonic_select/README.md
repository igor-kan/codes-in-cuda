# Warp-Level Bitonic Partial Sort Top-K Selector Kernel (`top_k_warp_bitonic_select`)

> Category: **GPU Selection & Sorting** | Language: **CUDA C++**

## Overview

Implements a warp-cooperative register bitonic partial sorter using __shfl_xor_sync to extract exact top-K largest elements per candidate row without global sorting.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(K log^2 K) register warp bitonic exchange per row` |
| **Space Complexity** | `O(1) shared memory; register-resident top-K` |

## Mathematical & Safety Invariants

- Returned top-K entries per row are descending ordered and match host partial_sort.
- Warp mask guards inactive tail lanes cleanly.

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
