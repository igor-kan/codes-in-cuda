# Fused Vector Cosine Similarity & Parallel Warp-Merge Top-K Retrieval (`cosine_sim_topk`)

> Category: **GPU Information Retrieval** | Language: **CUDA C++**

## Overview

Computes normalized dot-product cosine similarity across document embeddings via warp-shuffle reduction and extracts Top-K highest-scoring indices through two-stage block selection.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(NumDocs * Dim / Threads) fused dot + L2 norm + Top-K` |
| **Space Complexity** | `O(NumDocs) similarity scores + O(K * Blocks) partial winners` |

## Mathematical & Safety Invariants

- Cosine similarity of identical non-zero vectors equals 1.0 +/- 1e-5.
- Every similarity score lies strictly in [-1.0 - eps, 1.0 + eps].

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
