#
# Copyright (C) 2017 The OmniRom Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := le_x2,LeMax2_CN,LeMax2_NA,x2

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8996
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8996
TARGET_BOARD_PLATFORM_GPU := qcom-adreno530

TARGET_USES_64_BIT_BINDER := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 cma=16M@0-0xffffffff androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x02000000
BOARD_RAMDISK_OFFSET     := 0x02200000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_APPEND_DTB := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/leeco/msm8996
TARGET_KERNEL_CONFIG := lineage_x2_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

# /proc/partitions * 2 * BLOCK_SIZE (512) = size in bytes
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296
BOARD_USERDATAIMAGE_PARTITION_SIZE := 58139029504
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc/

# Recovery
TARGET_RECOVERY_FSTAB := device/leeco/x2/recovery.fstab
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
BOARD_SUPPRESS_SECURE_ERASE := true

TARGET_USES_ION := true

# Full disk encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# TWRP
RECOVERY_VARIANT := twrp
BOARD_HAS_NO_REAL_SDCARD := true
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := "160"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/soc/6a00000.ssusb/6a00000.dwc3/gadget/lun0/file
TW_INCLUDE_CRYPTO := true
TARGET_RECOVERY_DEVICE_MODULES := libbinder libgui libui libEGL libGLES_trace libGLESv2 libprotobuf-cpp-lite libsync
TW_RECOVERY_ADDITIONAL_RELINK_FILES := $(OUT)/system/lib64/libbinder.so $(OUT)/system/lib64/libgui.so $(OUT)/system/lib64/libui.so $(OUT)/system/lib64/libEGL.so $(OUT)/system/lib64/libGLES_trace.so $(OUT)/system/lib64/libGLESv2.so $(OUT)/system/lib64/libprotobuf-cpp-lite.so $(OUT)/system/lib64/libsync.so
TW_NEW_ION_HEAP := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"

# MultiROM
TARGET_RECOVERY_IS_MULTIROM := true
MR_NO_KEXEC := 2
MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
MR_CONTINUOUS_FB_UPDATE := true
MR_DPI := xhdpi
MR_DPI_FONT := 340
MR_USE_MROM_FSTAB := true
MR_FSTAB := device/leeco/x2/multirom/mrom.fstab
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/leeco/x2/multirom/mr_init_devices.c
MR_KEXEC_MEM_MIN := 0x00200000
MR_KEXEC_DTB := true
MR_DEVICE_HOOKS := device/leeco/x2/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 4
MR_DEVICE_VARIANTS := x2 le_x2 LeMax2_CN LeMax2_NA
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/leeco/x2/multirom/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
# BootMenu
DEVICE_RESOLUTION := 1080x1920
MR_PIXEL_FORMAT := "RGBA_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
MR_DEV_BLOCK_BOOTDEVICE := true
MR_DEVICE_SPECIFIC_VERSION := b
MR_POPULATE_BY_NAME_PATH := "/dev/block/platform/soc/624000.ufshc/by-name"

# MultiRom Recovery Version
include device/leeco/x2/MR_REC_VERSION.mk
ifeq ($(MR_REC_VERSION),)
MR_REC_VERSION := $(shell date -u +%Y%m%d)-01
endif
BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)
