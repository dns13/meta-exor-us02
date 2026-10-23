FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE:usom02 = "usom02"
KMACHINE:usom02 = "usom02"
KBRANCH:usom02 = "v6.18/standard/base"

# Start from the in-tree socfpga_defconfig, adjusted by the fragments below
KBUILD_DEFCONFIG:usom02 = "socfpga_defconfig"
KCONFIG_MODE:usom02 = "alldefconfig"

SRC_URI:append:usom02 = " \
    file://0001-mmc-sdhci-ultimmc-add-Exor-UltiMMC-FPGA-core-driver.patch \
    file://0002-ARM-dts-socfpga-add-Exor-uSOM02-BeMoS-boards.patch \
    file://usom02.cfg \
"

KERNEL_FEATURES:append:usom02 = " cfg/systemd.scc"
