LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := libluajit
LOCAL_EXPORT_C_INCLUDES := ${LOCAL_PATH}/src
LOCAL_SRC_FILES := android/$(TARGET_ARCH_ABI)/libluajit.a

include $(PREBUILT_STATIC_LIBRARY)
