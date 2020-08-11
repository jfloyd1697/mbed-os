# Copyright (c) 2020 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

set(CMAKE_SYSTEM_PROCESSOR cortex-m33)

if(MBED_TOOLCHAIN STREQUAL "GCC_ARM")

set(GCC_FLAGS " \
    -mthumb \
    -mfpu=fpv5-sp-d16 \
    -mfloat-abi=softfp \
    -march=armv8-m.main+dsp \
")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    ${GCC_FLAGS} \
")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    ${GCC_FLAGS} \
")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} \
    ${GCC_FLAGS} \
")
set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} \
    ${GCC_FLAGS} \
")

elseif(MBED_TOOLCHAIN STREQUAL "ARM")

set(ARM_FLAGS " \
    -mcpu=cortex-m33 \
")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    ${ARM_FLAGS} \
")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    ${ARM_FLAGS} \
")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} \
    --cpu=Cortex-M33 \
")
set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} \
    --cpu=Cortex-M33 \
")

endif()

add_definitions(
    -D__CORTEX_M33
    -DARM_MATH_ARMV8MML
    -DDOMAIN_NS=1
    -D__FPU_PRESENT=1U
    -D__CMSIS_RTOS
    -D__MBED_CMSIS_RTOS_CM
    -D__DSP_PRESENT=1U
)
