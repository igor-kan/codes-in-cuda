# Register-Resident Batched 3x3 Symmetric Jacobi Eigensolver (`jacobi_eigen_batch3x3`)

> Category: **Batched Dense Linear Algebra** | Language: **CUDA C++**

## Overview

Computes eigenvalues and orthogonal 3x3 eigenvector matrices for thousands of independent 3x3 symmetric tensors in parallel with one GPU thread per matrix and zero global scratch.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(Batches * Sweeps / Threads) register-only Givens updates` |
| **Space Complexity** | `O(Batches * 6) symmetric packed inputs` |

## Mathematical & Safety Invariants

- Eigenvalues conserve trace(A) = l0 + l1 + l2 within 1e-4 FP32 tolerance.
- Reconstructed Q * diag(lambda) * Q^T equals input symmetric 3x3 matrix.

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
