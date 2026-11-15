# 30-Bit 3D Morton Z-Order Key Encoder & Karras LBVH Split Kernel (`morton_zorder_bvh`)

> Category: **GPU Spatial Indexing** | Language: **CUDA C++**

## Overview

Interleaves quantized 10-bit 3D centroid coordinates into 30-bit Z-order Morton keys and computes Karras parallel binary radix tree internal-node ranges via hardware __clz.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N) parallel bit interleaving + O(N log N) LBVH hierarchy build` |
| **Space Complexity** | `O(N) Morton codes and BVH internal nodes` |

## Mathematical & Safety Invariants

- Morton bit expansion preserves strict lexicographical z-curve locality.
- Every internal node splits sorted Morton range into valid non-overlapping subtrees.

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
