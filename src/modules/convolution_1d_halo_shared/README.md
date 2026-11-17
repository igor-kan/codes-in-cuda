# Shared-Memory Halo-Tiled 1D Convolution Kernel (`convolution_1d_halo_shared`)

> Category: **DSP & Stencil Kernels** | Language: **CUDA C++**

## Overview

Caches symmetric 1D input tiles plus left/right apron halos inside on-chip shared memory before accumulating constant-memory FIR filter taps.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N * K / B) coalesced shared-memory tile load` |
| **Space Complexity** | `O(BLOCK_DIM + 2*R) shared tile` |

## Mathematical & Safety Invariants

- Shared tile matches CPU unpadded zero-boundary reference convolution.

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
