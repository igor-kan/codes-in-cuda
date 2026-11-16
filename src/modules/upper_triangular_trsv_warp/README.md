# Warp-Cooperative Triangular System Solver (TRSV 32x32) in CUDA (`upper_triangular_trsv_warp`)

> Category: **GPU Linear Algebra Kernels** | Language: **CUDA C++**

## Overview

Solves batched 32x32 upper-triangular systems U x = b cleanly in registers across single CUDA warps via __shfl_sync backward substitution without inter-thread __shared__ synchronization.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(32) sequential steps per 32x32 warp-resident block solve` |
| **Space Complexity** | `O(N * N) triangular blocks` |

## Mathematical & Safety Invariants

- Residual norm ||U x - b||_inf stays below 1e-5 across diagonally dominant 32x32 blocks.
- Singular diagonal pivots |U_ii| < 1e-12 are screened by validation.

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
