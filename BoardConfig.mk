# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0

# ========================
# ABI / Dependency Checks
# ========================
#TARGET_CHECK_ABI := true
#TARGET_ALLOW_MISSING_LLNDK_LIBS := true
#SOONG_CONFIG_NAMESPACES += header_abi_checker
#SOONG_CONFIG_header_abi_checker := skip_libs
#SOONG_CONFIG_header_abi_checker_skip_libs := libbinder_ndk




DEVICE_PATH := device/realme/RE58C2


# Release tools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)



# ========================
# Security
# ========================
VENDOR_SECURITY_PATCH := 2024-07-05
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/
BOARD_RECOVERY_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/recovery


#BOARD_VNDK_VERSION := current
#BOARD_VNDK_CURRENT_VERSION := current
#BOARD_FULL_TREBLE_OVERRIDE := true
#BOARD_COMPATIBLE_PROPERTY_OVERRIDE := true
TARGET_PREBUILT_VENDOR := $(DEVICE_PATH)/vendor
#BOARD_SHIPPING_API_LEVEL := 33
BOARD_PREBUILT_DTBO := $(TARGET_PREBUILT_VENDOR)/prebuilts/dtbo.img
#BOARD_ENFORCE_VINTF_MANIFEST := false

# ========================
# Build System Flags
# ========================%
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
ALLOW_MISSING_DEPENDENCIES := false

# ========================
# Platform Configuration
# ========================
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

TARGET_BOARD_PLATFORM := ums9230
TARGET_BOOTLOADER_BOARD_NAME := ums9230_hulk
TARGET_NO_BOOTLOADER := true
TARGET_SCREEN_DENSITY := 320

# ========================
# Hybrid Kernel Setup
# ========================
# Kernel source for headers
TARGET_KERNEL_SOURCE := kernel/realme/RE58C2
TARGET_KERNEL_CONFIG := RE58C2_defconfig

# Prebuilt kernel override
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
BOARD_PREBUILT_DTBIMAGE := $(DEVICE_PATH)/prebuilts/dtb.img
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_PREBUILT_DTBO := $(DEVICE_PATH)/prebuilts/dtbo.img
TARGET_PREBUILT_DTBO := $(DEVICE_PATH)/prebuilts/dtbo.img

# Header generation control
#TARGET_KERNEL_HEADERS_GEN := true
#BUILD_BROKEN_DONT_GENERATE_KERNEL_INCLUDES := false
#TARGET_NO_KERNEL := false

# Kernel version (must match prebuilt)
KERNEL_VERSION := 5.4.254-android12-9-gb10a25caafa5-ab1063

# Clang Toolchain
KERNEL_CLANG_PATH := prebuilts/clang/kernel/linux-x86/clang-r416183b
TARGET_KERNEL_CLANG_VERSION := r416183b
TARGET_KERNEL_CLANG_PATH := $(KERNEL_CLANG_PATH)

# ========================
# Kernel Parameters
# ========================
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_MKBOOTIMG_ARGS += --header_version 4
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_DTB_OFFSET := 0x01f00000

# ========================
# Partitions
# ========================
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    vendor_dlkm \
    system \
    product \
    system_ext \
    vendor \
    odm

BOARD_USES_VENDOR_BOOT_IMAGE := true
BOARD_BOOT_HEADER_VERSION := 4
BOARD_RAMDISK_USE_LZ4 := true



# Super partition
BOARD_SUPER_PARTITION_SIZE := 8388608000
BOARD_SUPER_PARTITION_GROUPS := realme_dynamic_partitions
BOARD_REALME_DYNAMIC_PARTITIONS_SIZE := 8356268032
BOARD_REALME_DYNAMIC_PARTITIONS_PARTITION_LIST := system product system_ext vendor odm vendor_dlkm
AB_OTA_UPDATER := true
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true


# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3068735488
BOARD_VENDORIMAGE_PARTITION_SIZE := 805306368
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 1615167488
BOARD_SYSTEM_EXTIMAGE_PARTITION_SIZE := 542355456
BOARD_ODMIMAGE_PARTITION_SIZE := 336166912
BOARD_VENDOR_DLKMIMAGE_PARTITION_SIZE := 10223616

TARGET_COPY_OUT_VENDOR:=vendor
TARGET_COPY_OUT_PRODUCT:=product
TARGET_COPY_OUT_SYSTEM_EXT:=system_ext
TARGET_COPY_OUT_VENDOR_DLKM:=vendor_dlkm
TARGET_COPY_OUT_ODM:=odm
TARGET_COPY_OUT_SYSTEM:= system

# Filesystems
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_FLASH_BLOCK_SIZE := 262144

# Properties
TARGET_SYSTEM_PROP        += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP        += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP       += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP    += $(DEVICE_PATH)/system_ext.prop
TARGET_SYSTEM_DLKM_PROP   += $(DEVICE_PATH)/system_dlkm.prop
TARGET_ODM_PROP           += $(DEVICE_PATH)/odm.prop
TARGET_VENDOR_DLKM_PROP   += $(DEVICE_PATH)/vendor_dlkm.prop
TARGET_ODM_DLKM_PROP      += $(DEVICE_PATH)/odm_dlkm.prop


# ========================
# DTBO/Modules
# ========================
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_PREBUILT_BOOTIMAGE := $(DEVICE_PATH)/prebuilts/boot.img

# Prebuilt DTBO and DT images
BOARD_USE_DTBO_IMAGE := true

# Module loading
#BOOT_KERNEL_MODULES := \
#    $(wildcard $(DEVICE_PATH)/prebuilts/modules/vendor_boot_modules/*.ko) \
#    $(wildcard $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/vendor_boot_modules/*.ko)

#BOARD_VENDOR_KERNEL_MODULES := \
#    $(wildcard $(DEVICE_PATH)/prebuilts/modules/vendor_dlkm_modules/*.ko) \
#    $(wildcard $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/vendor_dlkm_modules/*.ko)

#BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(notdir $(BOOT_KERNEL_MODULES))

# Module loading - Use ONLY prebuilt modules
BOOT_KERNEL_MODULES := \
    $(wildcard $(DEVICE_PATH)/prebuilts/modules/vendor_boot_modules/*.ko)

BOARD_VENDOR_KERNEL_MODULES := \
    $(wildcard $(DEVICE_PATH)/prebuilts/modules/vendor_dlkm_modules/*.ko)

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(notdir $(BOOT_KERNEL_MODULES))
# ========================
# AVB/Verification
# ========================
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_ALGORITHM := SHA256_RSA4096

BOARD_SEPOLICY_VERS := 202404
# ========================
# Debugging
# ========================
# File existence verification
$(if $(wildcard $(TARGET_PREBUILT_KERNEL)),,$(error Missing kernel at $(TARGET_PREBUILT_KERNEL)))
$(if $(wildcard $(TARGET_KERNEL_SOURCE)/Makefile),,$(error Missing kernel source at $(TARGET_KERNEL_SOURCE)))
$(if $(wildcard $(BOARD_PREBUILT_DTBOIMAGE)),,$(error Missing DTBO at $(BOARD_PREBUILT_DTBOIMAGE)))

# ========================
# Inherit
# ========================
include vendor/realme/RE58C2/BoardConfigVendor.mk
