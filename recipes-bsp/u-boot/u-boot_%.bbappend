FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:usom02 = " \
    file://0001-mmc-add-Exor-UltiMMC-ulti_sdc-SDHCI-driver.patch \
    file://0002-arm-socfpga-add-Exor-uSOM02-board-BeMoS.patch \
"

# No SPL: CONFIG_BUILD_TARGET="u-boot.img" in the defconfig
UBOOT_MAKE_TARGET:usom02 = "all"

# Content of the 0xA2 partition of the SD card: the Exor preloader expects
# u-boot.img at offset 256 KiB, the init scripts copy it from there into the
# eMMC boot0 partition (dd skip=4 bs=64k).
do_deploy:append:usom02() {
    dd if=/dev/zero of=${DEPLOYDIR}/u-boot-${MACHINE}-a2.bin bs=1k count=256
    cat ${B}/${UBOOT_BINARY} >> ${DEPLOYDIR}/u-boot-${MACHINE}-a2.bin
}
