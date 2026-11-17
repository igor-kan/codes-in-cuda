#include "interface.cuh"
namespace cu_sparse_coo_to_csr_gpu {
KernelStatus validate_coo_dims(CooToCsrArgs args) {
    return (args.num_rows > 0 && args.nnz >= 0) ? KernelStatus::Ok : KernelStatus::InvalidDimension;
}
} // namespace cu_sparse_coo_to_csr_gpu