# Warp-Shuffle Numerically Stable Row Softmax Normalization Kernel (`softmax_warp_row_d60`)

> Category: **GPU Attention Kernels** | Language: **CUDA C++**

## Overview

Computes max-subtracted exponentiation and normalized probability vector across warp lanes using __shfl_xor_sync without shared-memory bank conflicts.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(log W) warp butterfly max + sumexp reduction` |
| **Space Complexity** | `O(1) register shfl_xor` |

## Mathematical & Safety Invariants

- Output warp probabilities remain finite and sum to 1.0.

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
