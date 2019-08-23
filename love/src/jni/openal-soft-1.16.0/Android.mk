# CMake is used to build the prebuilt binary for Android
# Base is OpenAL-soft 1.16.0

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := libopenal
LOCAL_CFLAGS := -std=c99 -DAL_ALEXT_PROTOTYPES
LOCAL_ARM_NEON := true

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
	# Defines for ARM32
	LOCAL_CFLAGS += \
		-DHAVE_NEON \
		-DSIZEOF_LONG=4
else ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
	# Defines for ARM64
	LOCAL_CFLAGS += \
		-DHAVE_POSIX_MEMALIGN \
		-DHAVE_NEON \
		-DHAVE_LOG2F \
		-DHAVE_STRTOF \
		-DSIZEOF_LONG=8 \
		-DHAVE_PTHREAD_MUTEX_TIMEDLOCK
else ifeq ($(TARGET_ARCH_ABI),x86)
	# Defines for x86. UNTESTED!
	LOCAL_CFLAGS += \
		-DHAVE_SSE \
		-DHAVE_SSE2 \
		-DSIZEOF_LONG=4 \
		-DHAVE_CPUID_H \
		-DHAVE_GCC_GET_CPUID \
else ifeq ($(TARGET_ARCH_ABI),x86_64)
	# Defines for x86-64. UNTESTED!
	LOCAL_CFLAGS += \
		-DHAVE_POSIX_MEMALIGN \
		-DHAVE_SSE \
		-DHAVE_SSE2 \
		-DHAVE_SSE4_1 \
		-DHAVE_LOG2F \
		-DHAVE_STRTOF \
		-DSIZEOF_LONG=8 \
		-DHAVE_CPUID_H \
		-DHAVE_GCC_GET_CPUID \
		-DHAVE_PTHREAD_MUTEX_TIMEDLOCK
endif

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/common \
	$(LOCAL_PATH)/Alc \
	$(LOCAL_PATH)/OpenAL32/Include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_SRC_FILES := \
	common/atomic.c \
	common/rwlock.c \
	common/threads.c \
	common/uintmap.c \
	OpenAL32/alAuxEffectSlot.c \
	OpenAL32/alBuffer.c \
	OpenAL32/alEffect.c \
	OpenAL32/alError.c \
	OpenAL32/alExtension.c \
	OpenAL32/alFilter.c \
	OpenAL32/alFontsound.c \
	OpenAL32/alListener.c \
	OpenAL32/alMidi.c \
	OpenAL32/alPreset.c \
	OpenAL32/alSoundfont.c \
	OpenAL32/alSource.c \
	OpenAL32/alState.c \
	OpenAL32/alThunk.c \
	OpenAL32/sample_cvt.c \
	Alc/ALc.c \
	Alc/ALu.c \
	Alc/alcConfig.c \
	Alc/alcRing.c \
	Alc/bs2b.c \
	Alc/effects/autowah.c \
	Alc/effects/chorus.c \
	Alc/effects/compressor.c \
	Alc/effects/dedicated.c \
	Alc/effects/distortion.c \
	Alc/effects/echo.c \
	Alc/effects/equalizer.c \
	Alc/effects/flanger.c \
	Alc/effects/modulator.c \
	Alc/effects/null.c \
	Alc/effects/reverb.c \
	Alc/helpers.c \
	Alc/hrtf.c \
	Alc/panning.c \
	Alc/mixer.c \
	Alc/mixer_c.c \
	Alc/midi/base.c \
	Alc/midi/sf2load.c \
	Alc/midi/dummy.c \
	Alc/midi/fluidsynth.c \
	Alc/midi/soft.c \
	Alc/backends/base.c \
	Alc/backends/loopback.c \
	Alc/backends/null.c \
	Alc/backends/opensl.c \
	Alc/backends/wave.c

LOCAL_LDLIBS := -lOpenSLES -llog

ifneq (,$(findstring HAVE_SSE4_1,${LOCAL_CFLAGS}))
	# SSE4.1 mixer
	LOCAL_SRC_FILES += \
		Alc/mixer_sse.c \
		Alc/mixer_sse2.c \
		Alc/mixer_sse41.c
else ifneq (,$(findstring HAVE_SSE2,${LOCAL_CFLAGS}))
	# SSE2 mixer
	LOCAL_SRC_FILES += \
		Alc/mixer_sse.c \
		Alc/mixer_sse2.c
else ifneq (,$(findstring HAVE_NEON,${LOCAL_CFLAGS}))
	# NEON mixer
	LOCAL_SRC_FILES += Alc/mixer_neon.c
endif

include $(BUILD_SHARED_LIBRARY)
