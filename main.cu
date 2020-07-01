#include <stdio.h>
#include <cassert>

#include <cuda_runtime.h>
#include <helper_functions.h>
#include <helper_cuda.h>

#include "inline_check.h"

template<typename EQ>
__global__ void testKernel(int N) {

    // N3928 - static assert without message
    static_assert(true);

    // P0217R3 - structured binding
    int a[2] = {1, 2};
    auto [a1, a2] = a;
    assert(a1 == 1);
    assert(a2 == 2);

    // P0386R2 - inline variables
    assert(EQ::M == 2);

    // P0292R2 - constexpr if statements
    if constexpr(EQ::M ==2) {
        printf("M == 2\n");
    } else {
        printf("M != 2\n");
    }

    int gtid = blockIdx.x*blockDim.x + threadIdx.x;
    assert(gtid < N);
}

int main(int argc, char **argv) {
    printf("starting...\n");
    testKernel<StaticMembers><<<256, 256>>>(60);
    exit(0);
}
