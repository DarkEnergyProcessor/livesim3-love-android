# CMake is used to build the prebuilt binary for Android
# Base is OpenAL-soft 1.19.1

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libopenal
LOCAL_SRC_FILES := prebuilt/lib/$(TARGET_ARCH_ABI)/libopenal.so
include $(PREBUILT_SHARED_LIBRARY)
