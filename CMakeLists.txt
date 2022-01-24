cmake_minimum_required(VERSION 3.20)
project(gpiointerrupt_EK_TM4C1294XL_TI)

# Append to the CMake module path our local cmake directory so CMake knows of our custom modules.
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/Modules")


set(TI_COMPILER_ARGS
    -mv7M4
    --code_state=16
    --float_support=FPv4SPD16
    -me
    # --include_path=\"C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI\"
    # --include_path=\"C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI\"
    # --include_path=\"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b\"
    # --include_path=\"C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/posix\"
    # --include_path=\"C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include\"
    # --define=ccs=\"ccs\"
    # --define=PART_TM4C1294NCPDT
    # --define=ccs
    # --define=TIVAWARE
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
      -c \"${TI_CGT_DIR}\" \\
      --compileOptions \\
      \"${TI_COMPILER_ARGS_STR}\" \\
      \"${CMAKE_CURRENT_SOURCE_DIR}/gpiointerrupt.cfg\"
    ")
# "C:/ti/xdctools_3_32_00_06_core/xs" --xdcpath="C:/ti/tirtos_tivac_2_16_00_08/packages;C:/ti/tirtos_tivac_2_16_00_08/products/tidrivers_tivac_2_16_00_08/packages;C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages;C:/ti/tirtos_tivac_2_16_00_08/products/ndk_2_25_00_09/packages;C:/ti/tirtos_tivac_2_16_00_08/products/uia_2_00_05_50/packages;C:/ti/tirtos_tivac_2_16_00_08/products/ns_1_11_00_10/packages;" xdc.tools.configuro -o configPkg -t ti.targets.arm.elf.M4F -p ti.platforms.tiva:TM4C1294NCPDT -r release -c "C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS" --compileOptions "-mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path=\"C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI\" --include_path=\"C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI\" --include_path=\"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b\" --include_path=\"C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/posix\" --include_path=\"C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include\" --define=ccs=\"ccs\" --define=PART_TM4C1294NCPDT --define=ccs --define=TIVAWARE -g --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi  " "../gpiointerrupt.cfg"

# "C:/ti/xdctools_3_32_00_06_core/xs" \
#     --xdcpath="C:/ti/tirtos_tivac_2_16_00_08/packages;C:/ti/tirtos_tivac_2_16_00_08/products/tidrivers_tivac_2_16_00_08/packages;C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages;C:/ti/tirtos_tivac_2_16_00_08/products/ndk_2_25_00_09/packages;C:/ti/tirtos_tivac_2_16_00_08/products/uia_2_00_05_50/packages;C:/ti/tirtos_tivac_2_16_00_08/products/ns_1_11_00_10/packages;" \
#     xdc.tools.configuro \
#     -o configPkg \
#     -t ti.targets.arm.elf.M4F \
#     -p ti.platforms.tiva:TM4C1294NCPDT \
#     -r release \
#     -c "C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS" \
#     --compileOptions \
#     "-mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path=\"C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI\" --include_path=\"C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI\" --include_path=\"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b\" --include_path=\"C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/posix\" --include_path=\"C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include\" --define=ccs=\"ccs\" --define=PART_TM4C1294NCPDT --define=ccs --define=TIVAWARE -g --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi  " "../gpiointerrupt.cfg"

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
    gpiointerrupt.c
    EK_TM4C1294XL.c)
    # EK_TM4C1294XL.cmd)
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
        ccs=ccs
        PART_TM4C1294NCPDT
        ccs
        TIVAWARE)
target_compile_options(gpiointerrupt
    PRIVATE
        $<$<CXX_COMPILER_ID:TI>:--cmd_file=${CMAKE_CURRENT_BINARY_DIR}/configPkg/compiler.opt>)
        # $<$<CXX_COMPILER_ID:TI>:${TI_COMPILER_ARGS};--cmd_file=${CMAKE_CURRENT_BINARY_DIR}/configPkg/compiler.opt>)
target_link_directories(gpiointerrupt
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR})
target_link_options(gpiointerrupt
    PRIVATE
        --heap_size=0
        --stack_size=512
        --reread_libs
        --warn_sections
        --rom_model)
target_link_libraries(gpiointerrupt
    gpiointerrupt-xdc
    EK_TM4C1294XL.cmd
    -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/grlib/ccs/Debug/grlib.lib"
    -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/usblib/ccs/Debug/usblib.lib"
    -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/driverlib/ccs/Debug/driverlib.lib"
    -llibc.a)


# set(CMAKE_C_IMPLICIT_LINK_LIBRARIES "c" CACHE STRING "Standard link libraries for C programs.")
# set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "c" CACHE STRING "Standard link libraries for C++ programs.")
# add_executable(main main.c)
# set_target_properties(main PROPERTIES SUFFIX ".out")
# target_link_directories(main PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
# target_link_libraries(main
#     EK_TM4C1294XL.cmd
#     -llibc.a)
# -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/grlib/ccs/Debug/grlib.lib"
# -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/usblib/ccs/Debug/usblib.lib"
# -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/driverlib/ccs/Debug/driverlib.lib"
# target_link_options(main BEFORE PRIVATE -llibc.a)

# **** Build of configuration Debug for project gpiointerrupt_EK_TM4C1294XL_TI ****

# "C:\\ti\\ccs1031\\ccs\\utils\\bin\\gmake" -k -j 16 all -O 
 
# Building file: "../gpiointerrupt.cfg"
# Invoking: XDCtools
# "C:/ti/xdctools_3_32_00_06_core/xs" --xdcpath="C:/ti/tirtos_tivac_2_16_00_08/packages;C:/ti/tirtos_tivac_2_16_00_08/products/tidrivers_tivac_2_16_00_08/packages;C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages;C:/ti/tirtos_tivac_2_16_00_08/products/ndk_2_25_00_09/packages;C:/ti/tirtos_tivac_2_16_00_08/products/uia_2_00_05_50/packages;C:/ti/tirtos_tivac_2_16_00_08/products/ns_1_11_00_10/packages;" xdc.tools.configuro -o configPkg -t ti.targets.arm.elf.M4F -p ti.platforms.tiva:TM4C1294NCPDT -r release -c "C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS" --compileOptions "-mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path=\"C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI\" --include_path=\"C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI\" --include_path=\"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b\" --include_path=\"C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/posix\" --include_path=\"C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include\" --define=ccs=\"ccs\" --define=PART_TM4C1294NCPDT --define=ccs --define=TIVAWARE -g --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi  " "../gpiointerrupt.cfg"
# making package.mak (because of package.bld) ...
# generating interfaces for package configPkg (because package/package.xdc.inc is older than package.xdc) ...
# configuring gpiointerrupt.xem4f from package/cfg/gpiointerrupt_pem4f.cfg ...
# generating custom ti.sysbios library makefile ... 
# Starting build of library sources ...
# making C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI/src/sysbios/sysbios.aem4f ...
# gmake[1]: Entering directory `C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI/src/sysbios'
# clem4f C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/BIOS.c ...
# asmem4f C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/family/arm/m3/Hwi_asm.sv7M ...
# asmem4f C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/family/arm/m3/Hwi_asm_switch.sv7M ...
# asmem4f C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/family/arm/m3/IntrinsicsSupport_asm.sv7M ...
# asmem4f C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/family/arm/m3/TaskSupport_asm.sv7M ...
# arem4f BIOS.obj m3_Hwi_asm.obj m3_Hwi_asm_switch.obj m3_IntrinsicsSupport_asm.obj m3_TaskSupport_asm.obj ...
# gmake[1]: Leaving directory `C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI/src/sysbios'
# Build of libraries done.
# clem4f package/cfg/gpiointerrupt_pem4f.c ...
# "package/cfg/gpiointerrupt_pem4f.c", line 15172: warning #112-D: statement is unreachable
# "package/cfg/gpiointerrupt_pem4f.c", line 15658: warning #112-D: statement is unreachable
# "package/cfg/gpiointerrupt_pem4f.c", line 15932: warning #112-D: statement is unreachable
# "package/cfg/gpiointerrupt_pem4f.c", line 16113: warning #112-D: statement is unreachable
# Finished building: "../gpiointerrupt.cfg"
 
#         1 file(s) copied.
# making ../src/sysbios/sysbios.aem4f ...
# gmake[1]: Nothing to be done for 'all'.
# Building file: "../gpiointerrupt.c"
# Invoking: Arm Compiler
# "C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI" --include_path="C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI" --include_path="C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b" --include_path="C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/posix" --include_path="C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=ccs --define=TIVAWARE -g --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="gpiointerrupt.d_raw" --cmd_file="configPkg/compiler.opt"  "../gpiointerrupt.c"
# Finished building: "../gpiointerrupt.c"
 
# Building file: "../EK_TM4C1294XL.c"
# Invoking: Arm Compiler
# "C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI" --include_path="C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI" --include_path="C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b" --include_path="C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/posix" --include_path="C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=ccs --define=TIVAWARE -g --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="EK_TM4C1294XL.d_raw" --cmd_file="configPkg/compiler.opt"  "../EK_TM4C1294XL.c"
# Finished building: "../EK_TM4C1294XL.c"
 
# making ../src/sysbios/sysbios.aem4f ...
# gmake[2]: Nothing to be done for 'all'.
# Building target: "gpiointerrupt_EK_TM4C1294XL_TI.out"
# Invoking: Arm Linker
# "C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=ccs --define=TIVAWARE -g --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi -z -m"gpiointerrupt_EK_TM4C1294XL_TI.map" --heap_size=0 --stack_size=512 -i"C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/lib" -i"C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include" --reread_libs --diag_wrap=off --display_error_number --warn_sections --xml_link_info="gpiointerrupt_EK_TM4C1294XL_TI_linkInfo.xml" --rom_model -o "gpiointerrupt_EK_TM4C1294XL_TI.out" "./EK_TM4C1294XL.obj" "./gpiointerrupt.obj" "../EK_TM4C1294XL.cmd" -l"configPkg/linker.cmd"  -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/grlib/ccs/Debug/grlib.lib" -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/usblib/ccs/Debug/usblib.lib" -l"C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b/driverlib/ccs/Debug/driverlib.lib" -llibc.a 
# <Linking>
# Finished building target: "gpiointerrupt_EK_TM4C1294XL_TI.out"
 

# **** Build Finished ****


# "C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/bin/armcl"
# -mv7M4
# --code_state=16
# --float_support=FPv4SPD16
# -me
# --include_path="C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI"
# --include_path="C:/Users/erisch/workspace_v10_Q3_supervisor/gpiointerrupt_EK_TM4C1294XL_TI"
# --include_path="C:/ti/tirtos_tivac_2_16_00_08/products/TivaWare_C_Series-2.1.1.71b"
# --include_path="C:/ti/tirtos_tivac_2_16_00_08/products/bios_6_45_01_29/packages/ti/sysbios/posix"
# --include_path="C:/ti/ccs1031/ccs/tools/compiler/ti-cgt-arm_20.2.4.LTS/include"
# --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=ccs --define=TIVAWARE -g --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="gpiointerrupt.d_raw" --cmd_file="configPkg/compiler.opt"  "../gpiointerrupt.c"

#-------------------------------------------

# C:\ti\ccs1031\ccs\tools\compiler\ti-cgt-arm_20.2.4.LTS\bin\armcl.exe
# --compile_only
# --c_file=C:\Users\erisch\workspace_v10_Q3_supervisor\gpiointerrupt_EK_TM4C1294XL_TI\gpiointerrupt.c
# -DPART_TM4C1294NCPDT
# -DTIVAWARE -Dccs -Dccs=\"ccs\"
# --include_path=C:\Users\erisch\workspace_v10_Q3_supervisor\gpiointerrupt_EK_TM4C1294XL_TI
# --include_path=C:\ti\tirtos_tivac_2_16_00_08\products\TivaWare_C_Series-2.1.1.71b
# --include_path=C:\ti\tirtos_tivac_2_16_00_08\products\bios_6_45_01_29\packages\ti\sysbios\posix
# --include_path=C:\ti\ccs1031\ccs\tools\compiler\ti-cgt-arm_20.2.4.LTS\include
# -mv7M4
# --code_state=16
# --float_support=FPv4SPD16 -me --diag_wrap=off --display_error_number --gen_func_subsections=on --parallel=16 --abi=eabi -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -g --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency=CMakeFiles\gpiointerrupt.dir\gpiointerrupt.c.obj.d --output_file=CMakeFiles\gpiointerrupt.dir\gpiointerrupt.c.obj

# "C:\Users\erisch\workspace_v10_Q3_supervisor\gpiointerrupt_EK_TM4C1294XL_TI\gpiointerrupt.c", line 38: fatal error #1965: cannot open source file "xdc/std.h"
# 1 catastrophic error detected in the compilation of "C:\Users\erisch\workspace_v10_Q3_supervisor\gpiointerrupt_EK_TM4C1294XL_TI\gpiointerrupt.c".