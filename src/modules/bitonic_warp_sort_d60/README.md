# Shared-Memory Bitonic Sort Compare-Exchange Block Kernel (`bitonic_warp_sort_d60`)

> Category: **GPU Sorting** | Language: **CUDA C++**

## Overview

Executes Batcher's bitonic compare-and-exchange stages inside thread-block __shared__ float tiles with __syncthreads() stage barriers.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(log^2 B) bitonic sort stage butterfly steps` |
| **Space Complexity** | `O(B) shared memory` |

## Mathematical & Safety Invariants

- Block slice elements become monotonically non-decreasing after log^2(B) steps.

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
