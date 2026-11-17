#include "interface.cuh"
namespace cu_sparse_coo_to_csr_gpu {
KernelStatus async_convert(const int* cr, const int* cc, int* rp, int* out, CooToCsrArgs args, cudaStream_t s) {
    cudaMemsetAsync(rp, 0, static_cast<std::size_t>(args.num_rows + 1) * sizeof(int), s);
    convert_coo_to_csr_gpu(cr, cc, rp, out, args);
    return KernelStatus::Ok;
}
} // namespace cu_sparse_coo_to_csr_gpu