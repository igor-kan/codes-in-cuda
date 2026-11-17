# Parallel GPU Histogram + Scan COO-to-CSR Graph Converter (`sparse_coo_to_csr_gpu`)

> Category: **Sparse Graph Conversion** | Language: **CUDA C++**

## Overview

Converts unordered Coordinate (COO) edge tuples into Compressed Sparse Row (CSR) row_ptr and col_idx arrays via atomic degree histogramming and shared prefix scan.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(E / P + log V) histogram + inclusive scan + scatter` |
| **Space Complexity** | `O(V + E)` |

## Mathematical & Safety Invariants

- Sum of CSR row degrees equals edge count nnz.
- Every row_ptr[u] <= row_ptr[u+1] monotonically.

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
