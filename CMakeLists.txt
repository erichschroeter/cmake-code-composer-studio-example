cmake_minimum_required(VERSION 3.20)
project(gpiointerrupt_EK_TM4C1294XL_TI)

# Append to the CMake module path our local cmake directory so CMake knows of our custom modules.
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/Modules")


set(TI_COMPILER_ARGS
    -mv7M4
    --code_state=16
    --float_support=FPv4SPD16
    -me

    --include_path=\"C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI\"
    --include_path=\"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b\"
    --include_path=\"C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/posix\"
    --include_path=\"C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include\"
    --define=ccs=\"ccs\"
    --define=PART_TM4C1294NCPDT
    --define=ccs
    --define=TIVAWARE

    -g
    --gcc
    --diag_warning=225
    --diag_warning=255
    --diag_wrap=off
    --display_error_number
    --gen_func_subsections=on
    --abi=eabi)


#
# XDCTools
#

find_package(XDCTools REQUIRED)

if(DEFINED TI_CGT_DIR)
    set(TIRTOS_INCLUDE_DIR "C:/ti/tirtos_tivac_2_16_00_08")
    set(TIRTOS_TIDRIVERS_INCLUDE_DIR "C:/ti/tirtos_tivac_2_16_00_08/products/tidrivers_tivac_2_16_00_08")
    set(TIRTOS_BIOS_INCLUDE_DIR "C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29")
    set(TIRTOS_NDK_INCLUDE_DIR "C:/ti/tirtos_tivac_2_16_00_08/products/ndk_2_26_00_09")
    set(TIRTOS_UIA_INCLUDE_DIR "C:/ti/tirtos_tivac_2_16_00_08/products/uia_2_00_05_50")
    set(TIRTOS_NS_INCLUDE_DIR "C:/ti/tirtos_tivac_2_16_00_08/products/ns_1_11_00_10")
    string(REPLACE "\"" "\\\"" TI_COMPILER_ARGS_STR "${TI_COMPILER_ARGS}")
    string(REPLACE ";" " " TI_COMPILER_ARGS_STR "${TI_COMPILER_ARGS}")
    file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/xs_cmd.sh
    "#!/usr/bin/env bash
# This command is written to a script file as a workaround to CMake's complicated
# rules around quotes and variables.
# This command line was taken from the CCS build output.
    ${XDCTools_XS} \\
    --xdcpath=\"${TIRTOS_INCLUDE_DIR}/packages;${TIRTOS_TIDRIVERS_INCLUDE_DIR}/packages;${TIRTOS_BIOS_INCLUDE_DIR}/packages;${TIRTOS_NDK_INCLUDE_DIR}/packages;${TIRTOS_UIA_INCLUDE_DIR}/packages;${TIRTOS_NS_INCLUDE_DIR}/packages;\" \\
      xdc.tools.configuro \\
      -o ${CMAKE_CURRENT_BINARY_DIR}/configPkg \\
      -t ti.targets.arm.elf.M4F \\
      -p ti.platforms.tiva:TM4C1294NCPDT \\
      -r release \\
      -b \"${CMAKE_CURRENT_BINARY_DIR}/configPkg/config.bld\" \\
      -c \"${TI_CGT_DIR}\" \\
      --compileOptions \"-mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path=\\\"C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI\\\" --include_path=\\\"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b\\\" --include_path=\\\"C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/posix\\\" --include_path=\\\"C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include\\\" --define=ccs=\\\"ccs\\\" --define=PART_TM4C1294NCPDT --define=ccs --define=TIVAWARE -g --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on -e=_c_int00 --abi=eabi \" \\
      \"${CMAKE_CURRENT_SOURCE_DIR}/gpiointerrupt.cfg\"
    ")

    add_custom_command(COMMAND sh ${CMAKE_CURRENT_BINARY_DIR}/xs_cmd.sh
        OUTPUT
            # ${CMAKE_CURRENT_BINARY_DIR}/configPkg/package/cfg/gpiointerrupt_pem4f.c
            ${CMAKE_CURRENT_BINARY_DIR}/configPkg/compiler.opt
            ${CMAKE_CURRENT_BINARY_DIR}/configPkg/linker.cmd
        COMMENT "Invoking: XDCTools for gpiointerrupt.cfg")
    add_custom_target(gpiointerrupt-xdctools
        DEPENDS
            # ${CMAKE_CURRENT_BINARY_DIR}/configPkg/package/cfg/gpiointerrupt_pem4f.c
            ${CMAKE_CURRENT_BINARY_DIR}/configPkg/compiler.opt
            ${CMAKE_CURRENT_BINARY_DIR}/configPkg/linker.cmd)
    add_library(gpiointerrupt-xdc INTERFACE)
        # ${CMAKE_CURRENT_BINARY_DIR}/configPkg/package/cfg/gpiointerrupt_pem4f.c)
    target_link_libraries(gpiointerrupt-xdc
        INTERFACE
            ${CMAKE_CURRENT_BINARY_DIR}/configPkg/linker.cmd)
            # -llibc.a)
    # target_compile_definitions(gpiointerrupt-xdc
    #     INTERFACE
    #         xdc_target_types__=ti/targets/arm/elf/std.h
    #         xdc_target_name__=M4F
    #         xdc_cfg__xheader__="C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI/build/configPkg/package/cfg/gpiointerrupt_pem4f.h")
    # target_include_directories(gpiointerrupt-xdc
    #     PUBLIC
    #         "C:/ti/tirtos_tivac_2_16_00_08/packages"
    #         "C:/ti/tirtos_tivac_2_16_00_08/products/tidrivers_tivac_2_16_00_08/packages"
    #         "C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages"
    #         "C:/ti/tirtos_tivac_2_16_00_08/products/ndk_2_26_00_09/packages"
    #         "C:/ti/tirtos_tivac_2_16_00_08/products/uia_2_00_05_50/packages"
    #         "C:/ti/tirtos_tivac_2_16_00_08/products/ns_1_11_00_10/packages"
    #         "C:/ti/xdctools_3_32_00_06_core/packages"
    #         "C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI/build/configPkg/.."
    #         C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include/rts
    #         C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include
    #         ${XDCTools_INCLUDE_DIRS})
    add_dependencies(gpiointerrupt-xdc gpiointerrupt-xdctools)
endif()


add_executable(gpiointerrupt
    # ${CMAKE_CURRENT_BINARY_DIR}/configPkg/linker.cmd
    EK_TM4C1294XL.cmd
    gpiointerrupt.c
    EK_TM4C1294XL.c)
    # EK_TM4C1294XL.cmd)
set_source_files_properties(
    ${CMAKE_CURRENT_BINARY_DIR}/configPkg/linker.cmd
    EK_TM4C1294XL.cmd
    PROPERTIES EXTERNAL_OBJECT TRUE)
# set_target_properties(gpiointerrupt PROPERTIES LINK_DEPENDS EK_TM4C1294XL.cmd)
set_target_properties(gpiointerrupt PROPERTIES SUFFIX ".out")
target_include_directories(gpiointerrupt
    PRIVATE
        "C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI"
        "C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b"
        "C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/posix"
        "C:/ti/tirtos_tivac_2_16_00_08/products/ndk_2_25_00_09/packages"
        "C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include")
        # "C:/ti/tirtos_tivac_2_16_00_08/products/ndk_2_25_00_09/packages/ti/ndk/inc/stkmain.h"
target_compile_definitions(gpiointerrupt
    PRIVATE
        ccs=\"ccs\"
        PART_TM4C1294NCPDT
        ccs
        TIVAWARE)
target_compile_options(gpiointerrupt
    PRIVATE
        $<$<CXX_COMPILER_ID:TI>:-gcc;--cmd_file=${CMAKE_CURRENT_BINARY_DIR}/configPkg/compiler.opt>)
        # $<$<CXX_COMPILER_ID:TI>:${TI_COMPILER_ARGS};--cmd_file=${CMAKE_CURRENT_BINARY_DIR}/configPkg/compiler.opt>)
target_link_directories(gpiointerrupt
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR})
target_link_options(gpiointerrupt
    PRIVATE
        --define=ccs=\"ccs\"
        --define=PART_TM4C1294NCPDT
        --define=ccs
        --define=TIVAWARE
        -e=_c_int00
        --issue_remarks
        --heap_size=0
        --stack_size=512
        --reread_libs
        --warn_sections
        --rom_model)
target_link_libraries(gpiointerrupt
    gpiointerrupt-xdc
    # EK_TM4C1294XL.cmd
    -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/grlib/ccs/Debug/grlib.lib"
    -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/usblib/ccs/Debug/usblib.lib"
    -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/driverlib/ccs/Debug/driverlib.lib"
    -llibc.a)

