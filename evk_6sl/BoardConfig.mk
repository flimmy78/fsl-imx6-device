#
# Product-specific compile-time definitions.
#

include device/fsl/imx6/soc/imx6sl.mk
include device/fsl/evk_6sl/build_id.mk
include device/fsl/imx6/BoardConfigCommon.mk
-include device/fsl-proprietary/gpu-viv/fsl-gpu.mk
# evk_mx6sl default target for EXT4
BUILD_TARGET_FS ?= ext4
include device/fsl/imx6/imx6_target_fs.mk

ifeq ($(BUILD_TARGET_FS),ubifs)
TARGET_RECOVERY_FSTAB = device/fsl/evk_6sl/fstab_nand.freescale
# build ubifs for nand devices
PRODUCT_COPY_FILES +=	\
	device/fsl/evk_6sl/fstab_nand.freescale:root/fstab.freescale
else
TARGET_RECOVERY_FSTAB = device/fsl/evk_6sl/fstab.freescale
# build for ext4
PRODUCT_COPY_FILES +=	\
	device/fsl/evk_6sl/fstab.freescale:root/fstab.freescale
endif # BUILD_TARGET_FS

TARGET_BOOTLOADER_BOARD_NAME := EVK
PRODUCT_MODEL := EVK_MX6SL

# Wifi related defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_MODULE_NAME     := bcmdhd
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"

# Intel vendor
ifeq ($(BOARD_WLAN_VENDOR),INTEL)
BOARD_HOSTAPD_PRIVATE_LIB                := private_lib_driver_cmd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB         := private_lib_driver_cmd
WPA_SUPPLICANT_VERSION                   := VER_0_8_X
HOSTAPD_VERSION                          := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB         := private_lib_driver_cmd_intel
WIFI_DRIVER_MODULE_PATH                  := "/system/lib/modules/iwlagn.ko"
WIFI_DRIVER_MODULE_NAME                  := "iwlagn"
WIFI_DRIVER_MODULE_PATH                  ?= auto
endif

BOARD_MODEM_VENDOR := AMAZON

USE_ATHR_GPS_HARDWARE := false
USE_QEMU_GPS_HARDWARE := false

# Freescale digital acceleromter
BOARD_HAS_SENSOR := true
SENSOR_MMA8451 := true

# for recovery service
TARGET_SELECT_KEY := 28
# we don't support sparse image.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# atheros 3k BT
BOARD_USE_AR3K_BLUETOOTH := false

USE_ION_ALLOCATOR := false
USE_GPU_ALLOCATOR := true

# camera hal v2
IMX_CAMERA_HAL_V2 := false

# define frame buffer count
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

BOARD_KERNEL_CMDLINE := console=ttymxc0,115200 init=/init androidboot.console=ttymxc0 video=mxcepdcfb:E060SCM,bpp=16 androidboot.hardware=freescale
TARGET_BOOTLOADER_CONFIG := mx6sl:mx6sl_evk_android_config
BOARD_SEPOLICY_DIRS := \
       device/fsl/evk_6sl/sepolicy
BOARD_SEPOLICY_UNION := \
       app.te \
       file_contexts \
       fs_use \
       untrusted_app.te \
       genfs_contexts
