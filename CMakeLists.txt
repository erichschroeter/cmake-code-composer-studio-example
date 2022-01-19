cmake_minimum_required(VERSION 3.20)
project(gpiointerrupt_EK_TM4C1294XL_TI)


# TODO XDCTools


add_executable(hello
    EK_TM4C1294XL.c
    EK_TM4C1294XL.cmd
    gpiointerrupt.c)




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

