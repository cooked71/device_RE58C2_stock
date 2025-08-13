# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0

DEVICE_PATH := device/realme/RE58C2

# =====================
# Build System Settings
# =====================
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlays

# =================
# Platform Settings
# =================
TARGET_BOARD_PLATFORM := ums9230
TARGET_BOOTLOADER_BOARD_NAME := ums9230_hulk
TARGET_NO_BOOTLOADER := true
TARGET_SCREEN_DENSITY := 320

# ==================
# Architecture Setup
# ==================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_2ND_CFLAGS += -mfloat-abi=softfp -mfpu=neon -march=armv7-a

# =====================
# Kernel Header Setup
# =====================
BOARD_32BIT_KERNEL_HEADERS := $(DEVICE_PATH)/headers/arm32_headers/include
ifneq ($(wildcard $(BOARD_32BIT_KERNEL_HEADERS)/asm-arm/sigcontext.h),)
  ARM_HEADER_PATH := asm-arm
else ifneq ($(wildcard $(BOARD_32BIT_KERNEL_HEADERS)/asm/sigcontext.h),)
  ARM_HEADER_PATH := asm
else
  $(error No valid 32-bit kernel headers found in $(BOARD_32BIT_KERNEL_HEADERS))
endif
TARGET_KERNEL_HEADERS := $(BOARD_32BIT_KERNEL_HEADERS)

# =====================
# Prebuilt Kernel
# =====================
TARGET_NO_KERNEL := true
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
TARGET_PREBUILT_DTBO := $(DEVICE_PATH)/prebuilts/dtbo.img
TARGET_KERNEL_SOURCE := kernel/realme/RE58C2
TARGET_KERNEL_CONFIG := RE58C2_defconfig

ifeq ($(wildcard $(TARGET_PREBUILT_KERNEL)),)
  $(error Prebuilt kernel missing at $(TARGET_PREBUILT_KERNEL))
endif
ifeq ($(wildcard $(TARGET_PREBUILT_DTB)),)
  $(error Prebuilt DTB missing at $(TARGET_PREBUILT_DTB))
endif

# =====================
# Boot / Vendor Boot
# =====================
BOARD_BOOT_HEADER_VERSION := 4
BOARD_VENDOR_RAMDISK_USE_DIRECTLY := true
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 buildvariant=user
BOARD_VENDOR_CMDLINE := console=ttyS1,115200n8

# =====================
# Partition Configuration
# =====================
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    vendor_dlkm \
    system \
    product \
    system_ext \
    vendor \
    odm

BOARD_HAS_DYNAMIC_PARTITIONS := true
BOARD_SUPER_PARTITION_SIZE := 8388608000
BOARD_SUPER_PARTITION_GROUPS := realme_dynamic_partitions
BOARD_REALME_DYNAMIC_PARTITIONS_SIZE := 8356268032
BOARD_REALME_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    product \
    system_ext \
    vendor \
    odm \
    vendor_dlkm

# File System Types
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs

# Partition Sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 1615167488
BOARD_SYSTEM_EXTIMAGE_PARTITION_SIZE := 542355456
BOARD_VENDORIMAGE_PARTITION_SIZE := 805306368
BOARD_ODMIMAGE_PARTITION_SIZE := 336166912
BOARD_VENDOR_DLKMIMAGE_PARTITION_SIZE := 10223616
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3068735488

# Copy-Out Directives
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_ODM := odm

# =====================
# Verified Boot (AVB)
# =====================
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_ROLLBACK_INDEX := 1
BOARD_AVB_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_ROLLBACK_INDEX := 1
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VENDOR_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VENDOR_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := 1
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 3

# =================
# Kernel Modules
# =================
BOOT_KERNEL_MODULES := $(shell cat $(DEVICE_PATH)/prebuilts/modules/modules.load)
BOARD_VENDOR_KERNEL_MODULES := \
    $(wildcard $(DEVICE_PATH)/prebuilts/vendor_dlkm/lib/modules/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# =================
# Security
# =================
VENDOR_SECURITY_PATCH := 2024-07-05
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/
BOARD_RECOVERY_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/recovery
BOARD_SEPOLICY_VERS := 30.0

# =================
# Properties
# =================
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop

# =================
# Vendor Blobs
# =================
include vendor/realme/RE58C2/BoardConfigVendor.mk
