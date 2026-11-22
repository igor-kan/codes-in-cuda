# 16x16 Shared-Tile Matrix Multiply Kernel (`matmul_tiled_smem_d57`)

> Category: **Dense Linear Algebra** | Language: **CUDA C++**

## Overview

Partitions input matrices A and B into 16x16 shared tiles to cut global DRAM traffic by 16x during block GEMM updates.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^3 / (B^2)) shared tile reuse` |
| **Space Complexity** | `O(2 * 16 * 16) tile scratch` |

## Mathematical & Safety Invariants

- Coalesced tile inner loop sums exact matrix inner products across all k phases.

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
