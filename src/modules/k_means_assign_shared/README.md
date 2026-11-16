# Shared-Memory Centroid Tiled K-Means Assignment & Reduction (`k_means_assign_shared`)

> Category: **GPU Clustering & ML Kernels** | Language: **CUDA C++**

## Overview

Assigns N D-dimensional samples to nearest of K centroids by caching centroid blocks in __shared__ SRAM and accumulating new centroid coordinates via atomicAdd updates.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N * K * D / Threads) via __shared__ centroid cache` |
| **Space Complexity** | `O(N*D + K*D) global + O(TileK * D) shared` |

## Mathematical & Safety Invariants

- Every output cluster index lies strictly inside [0, K - 1].
- Total cluster membership count across K centroids equals N.

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
