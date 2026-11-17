# Shared-Memory Parallel Cyclic Reduction (PCR) Batched Tridiagonal Solver (`batched_tridiag_pcr_cuda`)

> Category: **Linear Solvers (GPU)** | Language: **CUDA C++**

## Overview

Solves independent tridiagonal linear systems in parallel blocks using log2(N)-step Parallel Cyclic Reduction inside fast shared memory without branch divergence.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(log N) synchronized parallel cyclic reduction steps per system` |
| **Space Complexity** | `O(3 * N) shared memory per system` |

## Mathematical & Safety Invariants

- Residual ||A*x - d||_inf stays below tolerance on diagonally dominant systems.

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
