LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libfreetype
LOCAL_SRC_FILES := lib/libfreetype-$(TARGET_ARCH_ABI).a
include $(PREBUILT_STATIC_LIBRARY)
