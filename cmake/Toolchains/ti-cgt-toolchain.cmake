# Set the operating system and processor architecture.
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_SYSTEM_VERSION 1)

# Setup CMake's rules for using the CMAKE_FIND_ROOT_PATH for cross-compilation.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

if(DEFINED ENV{CCS_VERSION})
    set(CCS_VERSION $ENV{CCS_VERSION})
endif()
if(NOT DEFINED CCS_VERSION)
    set(CCS_VERSION "1031") # Default to what this project was started developing with.
    message(STATUS "CCS_VERSION undefined, defaulting to ${CCS_VERSION}")
endif()

file(GLOB _CCS_SEARCH_DIRS
    C:/ti/ccs*/ccs/tools/compiler/ti-cgt-arm*
    /opt/ti/ccs*/ccs/tools/compiler/ti-cgt-arm*
    /Application/ti/ccs*/ccs/tools/compiler/ti-cgt-arm*)
# Filter out potentially multiple versions of CCS installed on the system.
list(FILTER _CCS_SEARCH_DIRS INCLUDE REGEX ".*ccs${CCS_VERSION}.*")

if(NOT DEFINED TI_CGT_DIR)
    set(TI_CGT_DIR "${_CCS_SEARCH_DIRS}" CACHE PATH "The root directory of the TI ARM C/C++ Code Generation Tools.")
endif()

# Set target environment
set(CMAKE_FIND_ROOT_PATH ${TI_CGT_DIR})

# toolchain paths
find_program(TI_GCC       NAMES   armcl       PATHS  ${TI_CGT_DIR}/bin    NO_DEFAULT_PATH)
find_program(TI_CXX       NAMES   armcl       PATHS  ${TI_CGT_DIR}/bin    NO_DEFAULT_PATH)
find_program(TI_AS        NAMES   armasm      PATHS  ${TI_CGT_DIR}/bin    NO_DEFAULT_PATH)
find_program(TI_AR        NAMES   armar       PATHS  ${TI_CGT_DIR}/bin    NO_DEFAULT_PATH)
find_program(TI_OBJCOPY   NAMES   armobjcopy  PATHS  ${TI_CGT_DIR}/bin    NO_DEFAULT_PATH)
find_program(TI_OBJDUMP   NAMES   armobjdump  PATHS  ${TI_CGT_DIR}/bin    NO_DEFAULT_PATH)
find_program(TI_SIZE      NAMES   armsize     PATHS  ${TI_CGT_DIR}/bin    NO_DEFAULT_PATH)
find_program(TI_LD        NAMES   armlnk      PATHS  ${TI_CGT_DIR}/bin    NO_DEFAULT_PATH)

# set executables settings
set(CMAKE_C_COMPILER    ${TI_GCC})
set(CMAKE_CXX_COMPILER  ${TI_CXX})
set(CMAKE_AS            ${TI_AS})
set(CMAKE_AR            ${TI_AR})
set(CMAKE_OBJCOPY       ${TI_OBJCOPY})
set(CMAKE_OBJDUMP       ${TI_OBJDUMP})
set(CMAKE_SIZE          ${TI_SIZE})
set(CMAKE_LD            ${TI_LD})


find_path(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES
    NAMES stdio.h
    PATHS ${TI_CGT_DIR}
    PATH_SUFFIXES "include"
    DOC "Standard include directories for C programs.")

find_path(_CXX_STANDARD_INCLUDE_DIRECTORIES
    NAMES cstdio sstream
    PATHS ${TI_CGT_DIR}
    PATH_SUFFIXES "include/libcxx"
    NO_CACHE)
list(APPEND _CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_STANDARD_INCLUDE_DIRECTORIES})
set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${_CXX_STANDARD_INCLUDE_DIRECTORIES} CACHE PATH "Standard include directories for C++ programs.")

# Let CMake to detect how many cores we can compile with.
include(ProcessorCount)
ProcessorCount(N)

# -mv,--silicon_version=4,5e,6,6M0,7A8,7M3,7M4,7R4,7R5
#                              Target processor version (when not specified,
#                              compiler defaults to --silicon_version=4)
# --code_state=16,32           Designate code state, 16-bit (thumb) or 32-bit
# --float_support=VFPv2,VFPv3,VFPv3D16,vfplib,fpalib,FPv4SPD16,none
#                              Specify floating point support
# -me,--little_endian          Little endian code
# -g,--symdebug:dwarf          Full symbolic debug
# --relaxed_ansi,-pr           Relaxed parsing (non-strict ANSI)
# --display_error_number,-pden Emit diagnostic identifier numbers
# --diag_wrap[=on,off]         Wrap diagnostic messages (argument optional, defaults to: on)
# --gen_func_subsections,-ms[=on,off]
#                              Place each function in a separate subsection (argument optional, defaults to: on)
# --parallel[=parallelism]     Allow parallel compilation up to this many
#                              threads (argument optional, defaults to: 0)
list(APPEND _FLAGS
    -mv7M4
    --code_state=16
    --float_support=FPv4SPD16
    -me
    --diag_wrap=off
    --display_error_number
    --gen_func_subsections=on
    --parallel=${N}
    --abi=eabi)
string(REPLACE ";" " " _FLAGS_STR "${_FLAGS}")

set(CMAKE_C_FLAGS           "${CMAKE_C_FLAGS} ${_FLAGS_STR}" CACHE STRING "Flags used by the C compiler during all build types.")
set(CMAKE_C_FLAGS_DEBUG     "${CMAKE_C_FLAGS} -g" CACHE STRING "Flags used by the C compiler during DEBUG build types.")
set(CMAKE_C_FLAGS_RELEASE   "${CMAKE_C_FLAGS}" CACHE STRING "Flags used by the C compiler during RELEASE build types.")
set(CMAKE_CXX_FLAGS         "${CMAKE_CXX_FLAGS} ${_FLAGS_STR}" CACHE STRING "Flags used by the CXX compiler during all build types.")
set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS} -g" CACHE STRING "Flags used by the CXX compiler during DEBUG build types.")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS}" CACHE STRING "Flags used by the CXX compiler during RELEASE build types.")


# Unfortunately, we need to force CMake to think the compiler works due to the TI compiler
# having issues trying to compile its test programs.
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

message(STATUS "Using toolchain file: ${CMAKE_TOOLCHAIN_FILE}")