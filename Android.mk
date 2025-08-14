#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),RE58C2)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif


# Log file access attempts
define log_file_access
$(shell mkdir -p $(TARGET_OUT_INTERMEDIATES)/file_access)
$(shell echo "$(shell date '+%H:%M:%S') TRYING TO ACCESS: $1" \
  >> $(TARGET_OUT_INTERMEDIATES)/file_access/log.txt)
$(if $(wildcard $1),,\
  $(shell echo ">> FILE NOT FOUND: $1" \
    >> $(TARGET_OUT_INTERMEDIATES)/file_access/errors.txt))
endef

# Example usage for kernel:
$(eval $(call log_file_access,$(TARGET_PREBUILT_KERNEL)))
