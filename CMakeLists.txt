cmake_minimum_required(VERSION 3.18 FATAL_ERROR)

project("verify-cuda-cxx-17" VERSION 1.0.0)

enable_language(CUDA)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CUDA_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_CUDA_STANDARD_REQUIRED TRUE)

add_executable(main main.cu)
#target_compile_features(main PUBLIC cuda_std_17)
