# CSR Symmetric Graph Degree Normalization D^(-1/2) A D^(-1/2) (`csr_row_degree_norm_cuda`)

> Category: **Graph Neural Network Kernels** | Language: **CUDA C++**

## Overview

Normalizes sparse adjacency weights w_{u,v} by rsqrtf(deg[u] * deg[v]) for spectral graph convolution and normalized Laplacian propagation.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(NNZ / P) rsqrtf degree scaling per non-zero edge` |
| **Space Complexity** | `O(V + NNZ)` |

## Mathematical & Safety Invariants

- Normalized self-loop weight on isolated degree-1 vertex equals 1.0.

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
