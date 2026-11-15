# Atomic Worklist Top-Down CSR Breadth-First Search Kernel (`bfs_frontier_topdown`)

> Category: **GPU Graph Analytics** | Language: **CUDA C++**

## Overview

Expands exact Breadth-First Search levels over Compressed Sparse Row graphs on GPU using atomicCAS distance claiming and block-aggregated frontier emission.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(V + E) work-efficient across graph diameter steps` |
| **Space Complexity** | `O(V + E) CSR + O(V) double-buffered frontiers` |

## Mathematical & Safety Invariants

- Every visited vertex distance matches exact sequential hop count from source.
- No vertex appears more than once in any level frontier.

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
