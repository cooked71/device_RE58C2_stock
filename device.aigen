#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Core configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Kernel
PRODUCT_ENABLE_UFFD_GC := false

# API levels
PRODUCT_SHIPPING_API_LEVEL := 34

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default



# VINTF Configuration
DEVICE_VENDOR_COMPATIBILITY_MATRIX_FILE := \
    device/realme/RE58C2/compatibility_matrix.device.xml

DEVICE_MANIFEST_FILES := \
    $(foreach manifest,$(HARDWARE_MANIFESTS),\
        vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/$(manifest).xml)

PRODUCT_PACKAGES += \
    manifest_oplus_performance.xml \
    manifest_dualsim.xml \
    manifest_media_c2_V1_1_unisoc.xml

# Boot Control
PRODUCT_PACKAGES += \
    vendor.sprd.hardware.boot@1.2-impl \
    vendor.sprd.hardware.boot@1.2-impl.recovery \
    bootctrl.ums9230

# Recovery
PRODUCT_PACKAGES += \
    fastbootd \
    linker.recovery \
    adbd.recovery \
    android.hardware.fastboot@1.0-impl-mock

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Device-specific init
PRODUCT_PACKAGES += \
    init.$(TARGET_DEVICE).rc \
    init.$(TARGET_DEVICE).usb.rc \
    init.storage.rc \
    init.zramwb.rc

# Essential utilities
PRODUCT_PACKAGES += \
    create_splloader_dual_slot_byname_path.sh \
    init.insmod.sh

# NFC
PRODUCT_PACKAGES += \
    vendor.nxp.eventprocessor@1.0 \
    vendor.nxp.nxpnfclegacy@1.0

# Hardware
PRODUCT_PACKAGES += \
    android.hardware.health-service.example \
    vendor.sprd.hardware.thermal@2.0-service

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    vendor/realme/RE58C2

# Device tree blobs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/dtb.img:$(TARGET_COPY_OUT)/dtb.img \
    $(LOCAL_PATH)/prebuilts/dtbo.img:dtbo.img

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sepolicy/vendor_dlkm/file_contexts:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/vendor_dlkm_file_contexts

# Recovery configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/stuff/recovery.fstab:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/recovery.fstab

# Inherit the proprietary files
$(call inherit-product, vendor/realme/RE58C2/RE58C2-vendor.mk)
