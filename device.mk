#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)




#kernel
PRODUCT_ENABLE_UFFD_GC := false

DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE := device/realme/RE58C2/product/compatibility_matrix.xml
DEVICE_VENDOR_COMPATIBILITY_MATRIX_FILE := device/realme/RE58C2/compatibility_matrix.device.xml

#PRODUCT_VENDOR_MANIFEST_FILES := device/realme/RE58C2/manifest.xml

DEVICE_MANIFEST_FILES += \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/compatibility_matrix.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/ai_engine-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.biometrics.fingerprint@2.1-service.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.cas@1.2-service.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.drm-service.clearkey.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.gatekeeper@1.0-service.trusty.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.health-service.example.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.security.keymint@2.0-unisoc.service.trusty.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.sensors-multihal.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.thermal@2.0-service.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.usb-service.example.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.wifi@1.0-service.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.wifi.hostapd.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/android.hardware.wifi.supplicant.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/bluetooth_audio.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/cplog_svc-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/face-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/hdcp-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/lights.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/manifest_android.hardware.drm-service.widevine.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/manifest_dualsim.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/manifest_media_c2_V1_1_unisoc.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/manifest_oplus_performance.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/memtrack.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/network-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/power.stats-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/rebootescrow-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/soter_default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/trusty-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/tui-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/vendor-fingerprintmmi-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/vendor-log-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/vendor-oemlock-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/vendor-power-default.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/vendor.sprd.hardware.boot@1.2.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/vendor.sprd.hardware.commondcs@1.0-service.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/vendor.sprd.hardware.gnss@2.2-service.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/vendor.sprd.hardware.thermal@2.0-service.xml \
    vendor/realme/RE58C2/proprietary/vendor/etc/vintf/manifest/vibrator.xml

# lineage recovery
# WITH_LINEAGE_RECOVERY := true
# PRODUCT_PACKAGES += lineage_recovery

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/stuff/recovery.fstab:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/recovery.fstab

# Recovery-specific init/ueventd scripts from stuff/rcfiles
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/stuff/rcfiles/init.recovery.common.rc:root/init.recovery.common.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.module.rc:root/ueventd.module.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.RMX3624.rc:root/ueventd.RMX3624.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.ums9230_1h10.rc:root/ueventd.ums9230_1h10.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.ums9230_1h10_go.rc:root/ueventd.ums9230_1h10_go.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.ums9230_4h10.rc:root/ueventd.ums9230_4h10.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.ums9230_4h10_go.rc:root/ueventd.ums9230_4h10_go.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.ums9230_6h10.rc:root/ueventd.ums9230_6h10.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.ums9230_7h10.rc:root/ueventd.ums9230_7h10.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.ums9230_haps.rc:root/ueventd.ums9230_haps.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.ums9230_hulk.rc:root/ueventd.ums9230_hulk.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.ums9230_nico.rc:root/ueventd.ums9230_nico.rc \
    $(LOCAL_PATH)/stuff/rcfiles/ueventd.ums9230_zebu.rc:root/ueventd.ums9230_zebu.rc

#add fstabs to recovery  (first stage)
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/stuff/fastabs/fstab.module:root/first_stage_ramdisk/fstab.module \
    $(LOCAL_PATH)/stuff/fastabs/fstab.RMX3624:root/first_stage_ramdisk/fstab.RMX3624 \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_1h10:root/first_stage_ramdisk/fstab.ums9230_1h10 \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_1h10_go:root/first_stage_ramdisk/fstab.ums9230_1h10_go \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_4h10:root/first_stage_ramdisk/fstab.ums9230_4h10 \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_4h10_go:root/first_stage_ramdisk/fstab.ums9230_4h10_go \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_6h10:root/first_stage_ramdisk/fstab.ums9230_6h10 \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_7h10:root/first_stage_ramdisk/fstab.ums9230_7h10 \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_haps:root/first_stage_ramdisk/fstab.ums9230_haps \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_hulk:root/first_stage_ramdisk/fstab.ums9230_hulk \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_nico:root/first_stage_ramdisk/fstab.ums9230_nico \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_zebu:root/first_stage_ramdisk/fstab.ums9230_zebu

#add init specific 
#PRODUCT_COPY_FILES += \
    device/realme/RE58C2/stuff/initfiles/init.recovery.module.rc:vendor_recovery/init.recovery.module.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.RMX3624.rc:vendor_recovery/init.recovery.RMX3624.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.ums9230_1h10.rc:vendor_recovery/init.recovery.ums9230_1h10.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.ums9230_1h10_go.rc:vendor_recovery/init.recovery.ums9230_1h10_go.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.ums9230_4h10.rc:vendor_recovery/init.recovery.ums9230_4h10.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.ums9230_4h10_go.rc:vendor_recovery/init.recovery.ums9230_4h10_go.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.ums9230_6h10.rc:vendor_recovery/init.recovery.ums9230_6h10.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.ums9230_7h10.rc:vendor_recovery/init.recovery.ums9230_7h10.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.ums9230_haps.rc:vendor_recovery/init.recovery.ums9230_haps.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.ums9230_hulk.rc:vendor_recovery/init.recovery.ums9230_hulk.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.ums9230_nico.rc:vendor_recovery/init.recovery.ums9230_nico.rc \
    device/realme/RE58C2/stuff/initfiles/init.recovery.ums9230_zebu.rc:vendor_recovery/init.recovery.ums9230_zebu.rc

#add fstabs to recovery  (root)
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/stuff/fastabs/fstab.module:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.module \
    $(LOCAL_PATH)/stuff/fastabs/fstab.RMX3624:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.RMX3624 \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_1h10:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.ums9230_1h10 \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_1h10_go:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.ums9230_1h10_go \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_4h10:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.ums9230_4h10 \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_4h10_go:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.ums9230_4h10_go \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_6h10:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.ums9230_6h10 \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_7h10:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.ums9230_7h10 \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_haps:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.ums9230_haps \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_hulk:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.ums9230_hulk \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_nico:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.ums9230_nico \
    $(LOCAL_PATH)/stuff/fastabs/fstab.ums9230_zebu:$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/fstab.ums9230_zebu


#add recovery modules
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/stuff/modules,$(TARGET_COPY_OUT_VENDOR_RECOVERY)/root/lib/modules)



#from twrp




# Boot control HAL
PRODUCT_PACKAGES += \
android.hardware.boot@1.2-impl \
android.hardware.boot@1.2-impl.recovery \
vendor.sprd.hardware.boot@1.2-impl \
vendor.sprd.hardware.boot@1.2-impl.recovery

#mod from twrp
PRODUCT_PACKAGES += \
    bootctrl \
    bootctrl.recovery 


PRODUCT_PACKAGES += \
    bootctrl.ums9230

PRODUCT_PACKAGES_DEBUG += \
    bootctrl.ums9230

PRODUCT_PACKAGES += \
    linker.vendor_ramdisk \
    tune2fs.vendor_ramdisk \
    resize2fs.vendor_ramdisk

PRODUCT_PACKAGES += \
    linker.recovery \
    shell_and_utilities_recovery \

PRODUCT_PACKAGES += adbd.recovery

PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock 






# fstab files to recovery (first stage)
PRODUCT_COPY_FILES += \
    device/realme/RE58C2/stuff/fastabs/fstab.module:vendor_recovery/first_stage_ramdisk/fstab.module \
    device/realme/RE58C2/stuff/fastabs/fstab.RMX3624:vendor_recovery/first_stage_ramdisk/fstab.RMX3624 \
    device/realme/RE58C2/stuff/fastabs/fstab.ums9230_1h10:vendor_recovery/first_stage_ramdisk/fstab.ums9230_1h10 \
    device/realme/RE58C2/stuff/fastabs/fstab.ums9230_1h10_go:vendor_recovery/first_stage_ramdisk/fstab.ums9230_1h10_go \
    device/realme/RE58C2/stuff/fastabs/fstab.ums9230_4h10:vendor_recovery/first_stage_ramdisk/fstab.ums9230_4h10 \
    device/realme/RE58C2/stuff/fastabs/fstab.ums9230_4h10_go:vendor_recovery/first_stage_ramdisk/fstab.ums9230_4h10_go \
    device/realme/RE58C2/stuff/fastabs/fstab.ums9230_6h10:vendor_recovery/first_stage_ramdisk/fstab.ums9230_6h10 \
    device/realme/RE58C2/stuff/fastabs/fstab.ums9230_7h10:vendor_recovery/first_stage_ramdisk/fstab.ums9230_7h10 \
    device/realme/RE58C2/stuff/fastabs/fstab.ums9230_haps:vendor_recovery/first_stage_ramdisk/fstab.ums9230_haps \
    device/realme/RE58C2/stuff/fastabs/fstab.ums9230_hulk:vendor_recovery/first_stage_ramdisk/fstab.ums9230_hulk \
    device/realme/RE58C2/stuff/fastabs/fstab.ums9230_nico:vendor_recovery/first_stage_ramdisk/fstab.ums9230_nico \
    device/realme/RE58C2/stuff/fastabs/fstab.ums9230_zebu:vendor_recovery/first_stage_ramdisk/fstab.ums9230_zebu




PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 34


# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    log_to_csv.sh \
    loading.sh \
    para.sh \
    total.sh \
    create_splloader_dual_slot_byname_path.sh \
    engineer_vendor_shell.sh \
    idlefast.sh \
    init.insmod.sh \
    zramwb.sh \


PRODUCT_PACKAGES += \
    manifest.vendor.nxpnfclegacy.xml \
    manifest.vendor.nxp.eventprocessor.xml 
    
    

PRODUCT_PACKAGES += \
    vendor.nxp.eventprocessor@1.0 \
    vendor.nxp.nxpnfclegacy@1.0 \
    librpmbclient \
    libteeproduction \
    libsecrpmbdata

  


PRODUCT_PACKAGES += \
    init.RMX3624.rc \
    init.RMX3624.usb.rc \
    init.cali.rc \
    init.module.rc \
    init.module.usb.rc \
    init.ram.gms.rc \
    init.ram.native.rc \
    init.ram.rc \
    init.storage.rc \
    init.ums9230_1h10.rc \
    init.ums9230_1h10.usb.rc \
    init.ums9230_1h10_go.rc \
    init.ums9230_1h10_go.usb.rc \
    init.ums9230_4h10.rc \
    init.ums9230_4h10.usb.rc \
    init.ums9230_4h10_go.rc \
    init.ums9230_4h10_go.usb.rc \
    init.ums9230_6h10.rc \
    init.ums9230_6h10.usb.rc \
    init.ums9230_7h10.rc \
    init.ums9230_7h10.usb.rc \
    init.ums9230_haps.rc \
    init.ums9230_haps.usb.rc \
    init.ums9230_hulk.rc \
    init.ums9230_hulk.usb.rc \
    init.ums9230_nico.rc \
    init.ums9230_nico.usb.rc \
    init.ums9230_zebu.rc \
    init.ums9230_zebu.usb.rc \
    init.zramwb.rc \


PRODUCT_PREBUILT_DTBO_IMAGE := $(TARGET_PREBUILT_DTBO)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/dtb.img:$(TARGET_COPY_OUT)/dtb.img

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/dtbo.img:dtbo.img

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/realme/RE58C2/RE58C2-vendor.mk)
