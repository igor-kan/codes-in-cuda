# Fused CSR SpMV + Jacobi Preconditioner Residual Iteration (`csr_jacobi_spmv_iter`)

> Category: **Iterative Solvers (GPU)** | Language: **CUDA C++**

## Overview

Executes a sparse CSR row-per-thread sweep computing off-diagonal Ax product and damped Jacobi update x_{k+1} = (1-w)*x_k + (w/diag)*(b - offdiag).

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(NNZ / P) per-row CSR sweep` |
| **Space Complexity** | `O(V) vector temporaries` |

## Mathematical & Safety Invariants

- Monotonically decreases linear residual on strictly diagonally dominant CSR matrices.

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
