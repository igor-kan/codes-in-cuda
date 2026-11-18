# Sliced ELLPACK (SELL-C-sigma) Coalesced Sparse Matrix-Vector Multiply (`sell_c_sigma_spmv_cuda`)

> Category: **Sparse Linear Algebra** | Language: **CUDA C++**

## Overview

Stores 32-row warp slices in padded column-major chunks of width C=32 so adjacent threads issue fully coalesced 128-byte transactions during SpMV.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(NNZ / P) warp-sliced column-major coalesced SpMV` |
| **Space Complexity** | `O(NNZ) sliced chunks` |

## Mathematical & Safety Invariants

- Coalesced slice accumulation equals standard CSR dot products per row.

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
