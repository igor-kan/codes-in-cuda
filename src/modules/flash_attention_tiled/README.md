# SRAM-Tiled Online-Softmax FlashAttention Forward Kernel (`flash_attention_tiled`)

> Category: **GPU Transformer Kernels** | Language: **CUDA C++**

## Overview

Computes exact scaled dot-product attention O = softmax(Q K^T / sqrt(d)) V without materializing the N x N attention score matrix in HBM by maintaining running row-wise (m_i, l_i) rescaling statistics inside __shared__ memory tiles.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^2 * d / (BLOCK_M * BLOCK_N)) parallel HBM-bound optimal I/O` |
| **Space Complexity** | `O(N * d) HBM + O(Br*d + Bc*d) shared SRAM (zero N^2 matrix)` |

## Mathematical & Safety Invariants

- Output matches full FP64 CPU materialized softmax(Q K^T / sqrt(d)) V within 1e-4 FP32 tolerance.
- HBM global memory traffic stays O(N * d) regardless of sequence length N.

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
