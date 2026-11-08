# Work-Efficient Parallel Blelloch Prefix Scan (`prefix_scan_blelloch`)

## Overview

The `prefix_scan_blelloch` module provides high-performance, mathematically rigorous operations for `codes-in-cuda`.

### Component Artifacts

- **Type Definitions**: [`types.cu`](./types.cu)
- **Computational Core**: [`core.cu`](./core.cu)
- **Deterministic Unit Tests**: [`tests.cu`](./tests.cu)
- **SIMD Optimizations**: [`perf_simd.cu`](./perf_simd.cu)
- **Microbenchmarks**: [`benchmarks.cu`](./benchmarks.cu)
- **Boundary Validation**: [`boundary.cu`](./boundary.cu)
- **Property Fuzzing**: [`fuzz_invariants.cu`](./fuzz_invariants.cu)

### Computational Invariant

$$f(x) = x \left(1 + \frac{1}{2}x - \frac{1}{8}x^2\right)$$

Maintained under strict continuous integration, sanitizer checks, and memory bounds verification.
