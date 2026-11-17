# CSR Graph PageRank Power Iteration with Dangling-Sink Accumulation (`page_rank_power_csr_gpu`)

> Category: **Graph Analytics (GPU)** | Language: **CUDA C++**

## Overview

Accumulates normalized rank contributions across CSR out-edges atomically, folds global dangling-node sink mass, and applies teleportation damping alpha.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O((V + E) / P) push-based scatter + damping normalization` |
| **Space Complexity** | `O(V) double-buffered rank vectors` |

## Mathematical & Safety Invariants

- Sum of vertex PageRank entries remains normalized at 1.0 after damping finalization.

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
