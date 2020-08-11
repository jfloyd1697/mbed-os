# Copyright (c) 2020 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

set(DEBUG_DEFINITIONS
    -DMBED_DEBUG
    -DMBED_TRAP_ERRORS_ENABLED=1
)

if(MBED_TOOLCHAIN STREQUAL "GCC_ARM")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    -c \
    -g3 \
    -std=gnu11 \
")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    -c \
    -g3 \
    -std=gnu++14 \
    -fno-rtti \
    -Wvla \
")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} \
    -c \
    -g3 \
    -x assembler-with-cpp \
")
set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} \
    -Wl,--gc-sections \
    -Wl,--wrap,main \
    -Wl,--wrap,_malloc_r \
    -Wl,--wrap,_free_r \
    -Wl,--wrap,_realloc_r \
    -Wl,--wrap,_memalign_r \
    -Wl,--wrap,_calloc_r \
    -Wl,--wrap,exit \
    -Wl,--wrap,atexit \
    -Wl,-n \
")

elseif(MBED_TOOLCHAIN STREQUAL "ARM")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    -std=gnu11 \
")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    -fno-rtti \
    -fno-c++-static-destructors \
    -std=gnu++14 \
")
set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} \
    --verbose \
    --remove \
    --show_full_path \
    --legacyalign \
    --any_contingency \
    --keep=os_cb_sections \
")
set(DEBUG_DEFINITIONS ${DEBUG_DEFINITIONS}
    -D__ASSERT_MSG
    -DMULADDC_CANNOT_USE_R7
)

elseif(MBED_TOOLCHAIN STREQUAL "ARM")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    --md \
    --no_depend_system_headers \
    --c99 \
")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    --cpp11 \
    --no_rtti \
    --no_vla \
")
set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} \
    --show_full_path \
    --any_contingency \
    --keep=os_cb_sections \
")
set(DEBUG_DEFINITIONS ${DEBUG_DEFINITIONS}
    -D__ASSERT_MSG
)

elseif(MBED_TOOLCHAIN STREQUAL "uARM")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    --md \
    --no_depend_system_headers \
    --c99 \
")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    --cpp11 \
    --no_rtti \
    --no_vla \
")
set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} \
    --library_type=microlib \
")
set(DEBUG_DEFINITIONS ${DEBUG_DEFINITIONS}
    -D__ASSERT_MSG
    -DMBED_RTOS_SINGLE_THREAD
    -D__MICROLIB
)

elseif(MBED_TOOLCHAIN STREQUAL "IAR")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    --vla \
    --diag_suppress=Pe546 \
")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    --guard_calls \
    --no_static_destruction \
")
set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} \
    --skip_dynamic_initialization \
    --threaded_lib \
")

endif()

add_definitions(${DEBUG_DEFINITIONS})
