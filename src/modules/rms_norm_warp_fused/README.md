# Fused RMSNorm Transformer Kernel with Warp Shuffle Reduction (`rms_norm_warp_fused`)

> Category: **GPU Neural Kernels** | Language: **CUDA C++**

## Overview

Computes Root Mean Square Layer Normalization y_i = (x_i / sqrt(mean(x^2) + eps)) * gamma_i across transformer hidden rows using single-pass warp butterfly reductions and vectorized float4 loads.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(Rows * HiddenDim / ThreadsPerBlock) coalesced global memory passes` |
| **Space Complexity** | `O(Rows * HiddenDim) global + O(Warps) __shared__` |

## Mathematical & Safety Invariants

- Output matches CPU FP64 scalar RMSNorm within 1e-5 FP32 relative tolerance.
- Positive epsilon prevents NaN division under all-zero activation rows.

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
