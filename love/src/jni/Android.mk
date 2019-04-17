# Paths specified here is relative to love folder directory
SDL_PATH := ../SDL2-2.0.9
OPENAL_INCLUDE_PATH := ../openal-soft-1.16.0/prebuilt/include
FT2_INCLUDE_PATH := ../freetype-2.8.1-prebuilt/include
MPG123_INCLUDE_PATH := ../mpg123-1.17.0/src/libmpg123
VORBIS_INCLUDE_PATH := ../libvorbis-1.3.5/include
LUA_INCLUDE_PATH := ../LuaJIT-2.1/src
OGG_INCLUDE_PATH := ../libogg-1.3.2/include
THEORA_INCLUDE_PATH := ../libtheora-1.2.0alpha1/include 

include $(call all-subdir-makefiles)
