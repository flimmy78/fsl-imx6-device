#
# Product-specific compile-time definitions.
#

TARGET_BOARD_PLATFORM := imx5x
TARGET_CPU_ABI := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon

TARGET_NO_BOOTLOADER := true
#TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_INIT_RC := true

#BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_HAVE_BLUETOOTH := true
USE_CAMERA_STUB := false
BOARD_CAMERA_LIBRARIES := libcamera
BOARD_HAVE_VPU := true

BOARD_HAVE_WIFI := true

BOARD_HAVE_MODEM := true
BOARD_MODEM_VENDOR := HUAWEI
BOARD_MODEM_ID := EM750M
BOARD_MODEM_HAVE_DATA_DEVICE := true

HAVE_FSL_IMX_CODEC := true
PREBUILT_FSL_IMX_CODEC := true
PREBUILT_FSL_IMX_CODEC_V2 := true
BUILD_WITHOUT_FSL_DIRECTRENDER := false
BUILD_WITHOUT_FSL_XEC := true

TARGET_TS_CALIBRATION := true
TARGET_TS_DEVICE := "mxc_ts"

PREBUILT_FSL_IMX_GPU := true

TARGET_USERIMAGES_BLOCKS := 204800

EXCLUDED_CODEC_BUILD := false
EXCLUDED_CODEC_V2_BUILD := false

BUILD_WITH_GST := false

BUILD_WITH_GST := false

# for ums config, only export one partion instead of the whole disk
UMS_ONEPARTITION_PER_DISK := true

# for simulate the sensor event
BOARD_HAS_SENSOR := false
SIMULATE_SENSOR := false



