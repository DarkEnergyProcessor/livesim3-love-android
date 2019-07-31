# CMake is used to build the prebuilt binary for Android
# Base is OpenAL-soft 1.16.0

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libopenal
LOCAL_EXPORT_C_INCLUDES := ${LOCAL_PATH}/include
LOCAL_SRC_FILES := prebuilt/$(TARGET_ARCH_ABI)/libopenal.so
include $(PREBUILT_SHARED_LIBRARY)
