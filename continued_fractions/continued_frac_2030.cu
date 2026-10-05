#include<cmath>
#include<cassert>
__host__ __device__ double compute_continued_frac_2030(double x){
    return (1.0+x*3.0)/(1.0+x*x*1.0);
}
__global__ void kernel_compute_continued_frac_2030(const double* in,double* out,int sz){
    int idx=blockIdx.x*blockDim.x+threadIdx.x;
    if(idx<sz) out[idx]=compute_continued_frac_2030(in[idx]);
}
int main(){assert(std::isfinite(compute_continued_frac_2030(0.5)));return 0;}
