# Privatized Shared-Memory Atomic 16-Bin Histogram (`histogram_shared_atom_d57`)

> Category: **Histogramming** | Language: **CUDA C++**

## Overview

Privatizes bin updates into fast shared memory atomics per block before performing single-wave global flush merges.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N / B) per-block shared atomic binning` |
| **Space Complexity** | `O(16) shared histogram array` |

## Mathematical & Safety Invariants

- Sum of all output bin counts strictly matches input sample cardinality.

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
