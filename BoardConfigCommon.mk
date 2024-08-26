# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017,2021 The LineageOS Project
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

COMMON_PATH := device/samsung/msm8974-common

# Android Platform
TARGET_BOARD_PLATFORM := msm8974

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true

# Bootloader
BOARD_VENDOR := samsung
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
MALLOC_SVELTE_FOR_LIBC32 := true

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U | 0x02002000U
TARGET_DISABLE_POSTRENDER_CLEANUP := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true

# Filesystem
TARGET_FS_CONFIG_GEN += $(COMMON_PATH)/config.fs

# HIDL
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37 ehci-hcd.park=3 zcache.enabled=1 zcache.compressor=lz4
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
TARGET_KERNEL_CLANG_COMPILE := false
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_RAMDISK_USE_XZ := true
TARGET_KERNEL_ADDITIONAL_FLAGS := HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"
TARGET_KERNEL_SOURCE := kernel/samsung/msm8974

# Legacy memfd
TARGET_HAS_MEMFD_BACKPORT := true

# Netd
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Legacy BLOB Support
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/hw/camera.vendor.msm8974.so|libshim_camera.so \
    /system/vendor/lib/libperipheral_client.so|libshim_binder.so
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22 \
    /system/vendor/bin/hw/rild=27

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_ROOT_EXTRA_FOLDERS := efs firmware firmware-modem
BOARD_ROOT_EXTRA_SYMLINKS := /data/tombstones:/tombstones 
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Platform
TARGET_BOARD_PLATFORM := msm8974

# Power
TARGET_USES_INTERACTION_BOOST := true

# Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# Radio
BOARD_PROVIDES_LIBRIL := true

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_DENSITY := xhdpi
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/msm8974-common
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# SELinux
include device/qcom/sepolicy-legacy/sepolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Wifi
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/vendor/etc/wifi/bcmdhd_sta.bin nvram_path=/vendor/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/vendor/etc/wifi/bcmdhd_apsta.bin nvram_path=/vendor/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# inherit from the proprietary version
include vendor/samsung/msm8974-common/BoardConfigVendor.mk
