#define AL_API  __attribute__((visibility("protected")))
#define ALC_API __attribute__((visibility("protected")))
#define ALSOFT_VERSION "1.16.0"

#ifdef IN_IDE_PARSER
#define restrict __restrict
#endif 

#define ALIGN(x) __attribute__((aligned(x)))
/* #undef HAVE_ALIGNED_ALLOC */
/* #undef HAVE_POSIX_MEMALIGN */ /* ARM64: define; x86-64: define */
/* #undef HAVE__ALIGNED_MALLOC */
/* #undef HAVE_SSE */ /* x86(-64): define */
/* #undef HAVE_SSE2 */ /* x86(-64): define */
/* #undef HAVE_SSE4_1 */ /* x86(-64): define */
/* #undef HAVE_NEON */ /* ARM32: define; ARM64: define */
/* #undef HAVE_FLUIDSYNTH */
/* #undef HAVE_ALSA */
/* #undef HAVE_OSS */
/* #undef HAVE_SOLARIS */
/* #undef HAVE_SNDIO */
/* #undef HAVE_QSA */
/* #undef HAVE_MMDEVAPI */
/* #undef HAVE_DSOUND */
/* #undef HAVE_WINMM */
/* #undef HAVE_PORTAUDIO */
/* #undef HAVE_PULSEAUDIO */
/* #undef HAVE_COREAUDIO */
#define HAVE_OPENSL
#define HAVE_WAVE
#define HAVE_STAT
#define HAVE_LRINTF
/* #undef HAVE_STRTOF */ /* ARM64: define; x86-64: define */
/* #undef HAVE___INT64 */
/* #undef SIZEOF_LONG 4 */ /* ARM32: 4; ARM64: 8; x86: 4; x86-64: 8 */
#define SIZEOF_LONG_LONG 8
#define HAVE_C99_VLA
#define HAVE_C99_BOOL
#define HAVE_C11_STATIC_ASSERT
#define HAVE_C11_ALIGNAS
/* #undef HAVE_C11_ATOMIC */
#define HAVE_GCC_DESTRUCTOR
#define HAVE_GCC_FORMAT
#define HAVE_STDINT_H
#define HAVE_STDBOOL_H
#define HAVE_STDALIGN_H
/* #undef HAVE_WINDOWS_H */
#define HAVE_DLFCN_H
/* #undef HAVE_PTHREAD_NP_H */
/* #undef HAVE_ALLOCA_H */
#define HAVE_MALLOC_H
#define HAVE_FTW_H
/* #undef HAVE_IO_H */
#define HAVE_STRINGS_H
/* #undef HAVE_CPUID_H */ /* x86(-64): define */
/* #undef HAVE_INTRIN_H */
#define HAVE_SYS_SYSCONF_H
/* #undef HAVE_GUIDDEF_H */
/* #undef HAVE_INITGUID_H */
/* #undef HAVE_IEEEFP_H */
#define HAVE_FLOAT_H
#define HAVE_FENV_H
/* #undef HAVE_GCC_GET_CPUID */ /* x86(-64): define */
/* #undef HAVE_CPUID_INTRINSIC */
/* #undef HAVE__CONTROLFP */
/* #undef HAVE___CONTROL87_2 */
#define HAVE_FTW
/* #undef HAVE__WFINDFIRST */
#define HAVE_PTHREAD_SETSCHEDPARAM
#define HAVE_PTHREAD_SETNAME_NP
/* #undef HAVE_PTHREAD_SET_NAME_NP */
/* #undef HAVE_PTHREAD_MUTEXATTR_SETKIND_NP */
/* #undef HAVE_PTHREAD_MUTEX_TIMEDLOCK */ /* ARM64: define; x86-64: define */
